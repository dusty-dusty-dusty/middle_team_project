<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 수정</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/mypage.css'/>" />
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-minimal/minimal.css">
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
    .container {
        width: 1200px;
        margin: 0 auto;
        padding: 20px;
        display: flex;
        gap: 20px;
    }

    .main-content {
        flex: 1;
        padding: 30px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    .page-title {
        margin-bottom: 30px;
        font-size: 28px;
        color: #333;
        font-weight: 600;
        position: relative;
        padding-bottom: 15px;
    }
    
    .page-title:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 3px;
        background-color: #00a8e8;
    }

    .edit-profile-container {
        max-width: 550px;
        margin: 0 auto;
    }

    .form-group {
        margin-bottom: 28px;
        position: relative;
    }

    .form-group label {
        display: block;
        margin-bottom: 10px;
        font-weight: 500;
        color: #444;
        font-size: 16px;
    }
    
    .required {
        color: #e74c3c;
        margin-left: 3px;
    }

    .form-group input {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
        font-size: 16px;
        transition: all 0.3s;
        box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    }
    
    .form-group input:focus {
        border-color: #00a8e8;
        box-shadow: 0 0 0 3px rgba(0,168,232,0.2);
        outline: none;
    }

    /* 아이디 입력창과 중복확인 버튼을 감싸는 컨테이너 */
    /* 너비를 조절하여 다른 텍스트박스와 오른쪽 끝을 맞출 수 있음 (예: 400px ~ 490px) */
    .input-with-button {
        position: relative;
        width: 107%; /* 이 값을 조절하여 전체 너비 변경 (작게 하려면 값 감소, 크게 하려면 값 증가) */
    }

    /* 아이디 입력창 스타일 */
    .input-with-button input {
        width: 100%;
        padding-right: 110px; /* 이 값을 조절하여 텍스트와 버튼 사이 간격 조정 (작게 하면 텍스트 영역 증가) */
        border-radius: 6px;
    }

    /* 중복확인 버튼 스타일 */
    .check-button {
        position: absolute;
        right: 5px;
        top: 2px;
        width: 100px; /* 버튼 너비 */
        height: 42px;
        background-color: #00a8e8;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        white-space: nowrap;
        display: flex;
        align-items: center; /* 텍스트 수직 가운데 정렬 */
        justify-content: center;
        font-weight: 500;
        font-size: 15px;
        transition: all 0.2s;
    }
    
    .check-button:hover {
        background-color: #0091c8;
        transform: translateY(-1px);
        box-shadow: 0 2px 5px rgba(0,168,232,0.4);
    }

    .button-group {
        display: flex;
        gap: 15px;
        margin-top: 40px;
        width: 100%;
    }

    .button-group button {
        flex: 1;
        padding: 15px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: all 0.3s;
    }

    .save-button {
        background-color: #00a8e8;
        color: white;
        box-shadow: 0 2px 5px rgba(0,168,232,0.3);
    }
    
    .save-button:hover {
        background-color: #0091c8;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,168,232,0.4);
    }

    .cancel-button {
        background-color: #f1f1f1;
        color: #444;
    }
    
    .cancel-button:hover {
        background-color: #e5e5e5;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    
    .notification-container {
        position: fixed;
        top: 20px;
        right: 20px;
        z-index: 1000;
    }

    .password-requirements {
        margin-top: 10px;
        font-size: 14px;
        color: #666;
    }

    .requirement {
        margin: 5px 0;
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .requirement .icon {
        font-size: 12px;
    }

    .requirement.valid .icon {
        color: #2ecc71;
    }

    .requirement.invalid .icon {
        color: #e74c3c;
    }

    .invalid-feedback {
        color: #dc3545;
        font-size: 14px;
        margin-top: 5px;
        display: none;
    }
    </style>
</head>
<body>
    <!-- 알림창 컨테이너 -->
    <div class="notification-container"></div>

    <!-- 공통 헤더 포함 -->
    <jsp:include page="../common/header.jsp" />

    <div class="container">
     <!-- 공통 사이드바 포함 -->
        <jsp:include page="/WEB-INF/views/mypage/mypage-sidebar.jsp" />

        <div class="main-content">
            <h2 class="page-title">개인정보 수정</h2>
            <div class="edit-profile-container">
                <form action="/mypage/edit-profile" method="POST" class="edit-profile-form" id="editProfileForm">
                    <div class="form-group">
                        <label for="memName">회원 이름 <span class="required">*</span></label>
                        <input type="text" id="memName" name="memName" value="${memberVO.memName}">
                    </div>
                    
                    <div class="form-group">
                        <label for="memId">아이디 <span class="required">*</span></label>
                        <div class="input-with-button">
                            <input type="text" id="memId" name="memId" value="${memberVO.memId}">
                            <button type="button" class="check-button">중복확인</button>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="memPwd">새 비밀번호 <span class="required">*</span></label>
                        <input type="password" id="memPwd" name="memPwd">
                        <div class="password-requirements">
                            <div id="lengthCheck" class="requirement">
                                <span class="icon">❌</span> 8자 이상
                            </div>
                            <div id="specialCharCheck" class="requirement">
                                <span class="icon">❌</span> 특수문자 2개 이상
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">새 비밀번호 확인 <span class="required">*</span></label>
                        <input type="password" id="confirmPassword" name="confirmPassword">
                        <div id="matchCheck" class="requirement">
                            <span class="icon">❌</span> 비밀번호 일치
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="memTel">휴대폰 번호 <span class="required">*</span></label>
                        <input type="tel" id="memTel" name="memTel" value="${memberVO.memTel}" 
                               pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
                    </div>
                    
                    <div class="form-group">
                        <label for="memEmail">이메일 <span class="required">*</span></label>
                        <input type="email" id="memEmail" name="memEmail" value="${memberVO.memEmail}">
                    </div>
                    
                    <div class="form-group">
                        <label for="memAddr">주소 <span class="required">*</span></label>
                        <input type="text" id="memAddr" name="memAddr" value="${memberVO.memAddr}">
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="save-button">수정</button>
                        <button type="button" class="cancel-button" onclick="history.back()">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
    function validatePassword(password) {
        const checks = {
            length: password.length >= 8,
            specialChar: (password.match(/[!@#$%^&*(),.?":{}|<>]/g) || []).length >= 2
        };
        return checks;
    }

    // SweetAlert2로 입력값 미입력 시 알림 및 포커스 이동 함수
    function showInputAlert(message, fieldId, title = '필수 입력', icon = 'warning') {
        Swal.fire({
            title: title,
            text: message,
            icon: icon,
            confirmButtonText: '확인',
            confirmButtonColor: '#00a8e8'
        }).then(() => {
            if (fieldId) {
                const el = document.getElementById(fieldId);
                if (el) el.focus({ preventScroll: true });
            }
        });
    }

    document.getElementById('memPwd').addEventListener('input', function() {
        const password = this.value;
        const validations = validatePassword(password);
        
        // 길이 체크
        const lengthCheck = document.getElementById('lengthCheck');
        if (validations.length) {
            lengthCheck.querySelector('.icon').textContent = '✓';
            lengthCheck.classList.add('valid');
            lengthCheck.classList.remove('invalid');
        } else {
            lengthCheck.querySelector('.icon').textContent = '❌';
            lengthCheck.classList.add('invalid');
            lengthCheck.classList.remove('valid');
        }
        
        // 특수문자 체크
        const specialCharCheck = document.getElementById('specialCharCheck');
        if (validations.specialChar) {
            specialCharCheck.querySelector('.icon').textContent = '✓';
            specialCharCheck.classList.add('valid');
            specialCharCheck.classList.remove('invalid');
        } else {
            specialCharCheck.querySelector('.icon').textContent = '❌';
            specialCharCheck.classList.add('invalid');
            specialCharCheck.classList.remove('valid');
        }
        
        // 비밀번호 확인 체크
        const confirmPassword = document.getElementById('confirmPassword').value;
        checkPasswordMatch(password, confirmPassword);
    });

    document.getElementById('confirmPassword').addEventListener('input', function() {
        const password = document.getElementById('memPwd').value;
        const confirmPassword = this.value;
        checkPasswordMatch(password, confirmPassword);
    });

    function checkPasswordMatch(password, confirmPassword) {
        const matchCheck = document.getElementById('matchCheck');
        if (password && confirmPassword) {
            if (password === confirmPassword) {
                matchCheck.querySelector('.icon').textContent = '✓';
                matchCheck.classList.add('valid');
                matchCheck.classList.remove('invalid');
            } else {
                matchCheck.querySelector('.icon').textContent = '❌';
                matchCheck.classList.add('invalid');
                matchCheck.classList.remove('valid');
            }
        }
    }

    // 폼 유효성 검사
    document.getElementById('editProfileForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        // 필수 필드 검사
        const requiredFields = {
            'memName': '이름을 입력해주세요',
            'memId': '아이디를 입력해주세요',
            'memPwd': '비밀번호를 입력해주세요',
            'memTel': '휴대폰 번호를 입력해주세요',
            'memEmail': '이메일을 입력해주세요',
            'memAddr': '주소를 입력해주세요'
        };
        
        for (const [fieldId, message] of Object.entries(requiredFields)) {
            const field = document.getElementById(fieldId);
            if (!field.value.trim()) {
                showInputAlert(message, fieldId);
                return;
            }
        }

        const password = document.getElementById('memPwd').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        
        if (password) {
            const validations = validatePassword(password);
            if (!validations.length && !validations.specialChar) {
                showInputAlert('비밀번호는 8자 이상이고 특수문자를 2개 이상 포함해야 합니다.', 'memPwd', '비밀번호 오류', 'error');
                return;
            } else if (!validations.length) {
                showInputAlert('비밀번호는 8자 이상이어야 합니다.', 'memPwd', '비밀번호 오류', 'error');
                return;
            } else if (!validations.specialChar) {
                showInputAlert('비밀번호는 특수문자를 2개 이상 포함해야 합니다.', 'memPwd', '비밀번호 오류', 'error');
                return;
            }
            if (password !== confirmPassword) {
                showInputAlert('비밀번호가 일치하지 않습니다.', 'confirmPassword', '비밀번호 불일치', 'error');
                return;
            }
        }
        
        // 휴대폰 번호 형식 검사
        const telPattern = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
        const telField = document.getElementById('memTel');
        if (!telPattern.test(telField.value)) {
            showInputAlert('휴대폰 번호를 올바른 형식으로 입력해주세요. (예: 010-1234-5678)', 'memTel', '형식 오류', 'warning');
            return;
        }
        
        // 이메일 형식 검사
        const emailField = document.getElementById('memEmail');
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(emailField.value)) {
            showInputAlert('올바른 이메일 주소를 입력해주세요.', 'memEmail', '형식 오류', 'warning');
            return;
        }

        // 수정 확인 대화상자
        Swal.fire({
            title: '개인정보 수정',
            text: '입력하신 정보로 수정하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '수정',
            cancelButtonText: '취소',
            confirmButtonColor: '#00a8e8',
            cancelButtonColor: '#6c757d'
        }).then((result) => {
            if (result.isConfirmed) {
                // AJAX로 폼 데이터 전송
                const formData = new FormData(this);
                fetch(this.action, {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        Swal.fire({
                            title: '수정 완료',
                            text: '개인정보가 성공적으로 수정되었습니다.',
                            icon: 'success',
                            confirmButtonText: '확인',
                            confirmButtonColor: '#00a8e8'
                        }).then(() => {
                            window.location.href = '/deskset/mypage/check-profile';
                        });
                    } else {
                        Swal.fire({
                            title: '수정 실패',
                            text: data.message || '수정에 실패했습니다.',
                            icon: 'error',
                            confirmButtonText: '확인',
                            confirmButtonColor: '#00a8e8'
                        });
                    }
                })
                .catch(error => {
                    Swal.fire({
                        title: '오류',
                        text: '수정 중 오류가 발생했습니다.',
                        icon: 'error',
                        confirmButtonText: '확인',
                        confirmButtonColor: '#00a8e8'
                    });
                });
            }
        });
    });

    // 중복확인 버튼 클릭 이벤트
    document.querySelector('.check-button').addEventListener('click', function() {
        const memId = document.getElementById('memId').value.trim();
        if (!memId) {
            showInputAlert('아이디를 입력해주세요', 'memId');
            return;
        }
        
        // 서버에 중복 확인 요청
        fetch('/mypage/check-id?memId=' + memId, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            }
        })
        .then(response => response.json())
        .then(available => {
            if (available) {
                showInputAlert('사용 가능한 아이디입니다.', null, '사용 가능', 'success');
            } else {
                showInputAlert('이미 사용 중인 아이디입니다.', 'memId', '중복', 'error');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showInputAlert('서버 오류가 발생했습니다. 다시 시도해주세요.', null, '오류', 'error');
        });
    });

    // 휴대폰 번호 입력 시 자동 하이픈
    document.getElementById('memTel').addEventListener('input', function(e) {
        let value = this.value.replace(/[^0-9]/g, '');
        let result = '';
        if (value.length < 4) {
            result = value;
        } else if (value.length < 8) {
            result = value.substr(0, 3) + '-' + value.substr(3);
        } else {
            result = value.substr(0, 3) + '-' + value.substr(3, 4) + '-' + value.substr(7, 4);
        }
        this.value = result;
    });
    </script>

    <!-- 공통 푸터 포함 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html> 