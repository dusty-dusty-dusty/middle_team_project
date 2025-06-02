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
        border: 1px solid #eaeaea;
        border-radius: 6px;
        background-color: #f9f9f9;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
        font-size: 16px;
        color: #555;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);
    }
    
    .form-group input:focus {
        border-color: #00a8e8;
        box-shadow: 0 0 0 3px rgba(0,168,232,0.2);
        outline: none;
    }

    /* 아이디 input만 더 진하게 */
    .id-strong {
        background-color: #eceff3 !important;
        border: 1.5px solid #ccc !important;
        color: #888 !important;
        font-weight: 500;
        cursor: not-allowed;
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
                <form action="<c:url value='/mypage/profile/edit-profile'/>" method="POST" class="edit-profile-form" id="editProfileForm" autocomplete="off">
                    <input type="hidden" id="memNo" name="memNo" value="${memberVO.memNo}">
                    <!-- 기존 값 hidden input으로 저장 -->
                    <input type="hidden" id="origMemName" value="${memberVO.memName}">
                    <input type="hidden" id="origMemTel" value="${memberVO.memTel}">
                    <input type="hidden" id="origMemEmail" value="${memberVO.memEmail}">
                    <input type="hidden" id="origMemAddr" value="${memberVO.memAddr}">
                    <div class="form-group">
                        <label for="memName">회원 이름</label>
                        <input type="text" id="memName" name="memName" value="${memberVO.memName}" autocomplete="name">
                    </div>
                    
                    <div class="form-group">
                        <label for="memId">아이디</label>
                        <input type="text" id="memId" name="memId" value="${memberVO.memId}" class="id-strong" readonly autocomplete="username">
                    </div>
                    
                    <div class="form-group">
                        <label for="memPwd">새 비밀번호 <span class="required">*</span></label>
                        <input type="password" id="memPwd" name="memPwd" autocomplete="new-password">
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
                        <input type="password" id="confirmPassword" name="confirmPassword" autocomplete="new-password">
                        <div id="matchCheck" class="requirement">
                            <span class="icon">❌</span> 비밀번호 일치
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="memTel">휴대폰 번호</label>
                        <input type="tel" id="memTel" name="memTel" value="${memberVO.memTel}" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" autocomplete="tel">
                    </div>
                    
                    <div class="form-group">
                        <label for="memEmail">이메일</label>
                        <input type="text" id="memEmail" name="memEmail" value="${memberVO.memEmail}" autocomplete="email">
                    </div>
                    
                    <div class="form-group">
                        <label for="memAddr">주소</label>
                        <input type="text" id="memAddr" name="memAddr" value="${memberVO.memAddr}" autocomplete="street-address">
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

    // submit 이벤트 중복 방지 및 로직 명확화
    (function() {
        const form = document.getElementById('editProfileForm');
        if (!form) return;
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            // 기존 값과 비교
            const orig = {
                memName: document.getElementById('origMemName').value,
                memTel: document.getElementById('origMemTel').value,
                memEmail: document.getElementById('origMemEmail').value,
                memAddr: document.getElementById('origMemAddr').value
            };
            const curr = {
                memName: document.getElementById('memName').value,
                memTel: document.getElementById('memTel').value,
                memEmail: document.getElementById('memEmail').value,
                memAddr: document.getElementById('memAddr').value
            };
            let changed = false;
            for (const key in orig) {
                if (orig[key] !== curr[key]) {
                    changed = true;
                    break;
                }
            }
            const password = document.getElementById('memPwd').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            // 비밀번호 입력이 있으면 변경된 것으로 간주
            if (password.trim() || confirmPassword.trim()) {
                changed = true;
            }

            // 회원정보가 바뀌었으면 비밀번호 입력 필수
            if (changed) {
                if (!password.trim() || !confirmPassword.trim()) {
                    showInputAlert('회원정보를 수정하려면 새 비밀번호와 확인을 모두 입력해야 합니다.', 'memPwd', '비밀번호 입력 필요', 'warning');
                    return;
                }
                if (password !== confirmPassword) {
                    showInputAlert('비밀번호가 일치하지 않습니다.', 'confirmPassword', '비밀번호 불일치', 'warning');
                    return;
                }
                const validations = validatePassword(password);
                if (!validations.length || !validations.specialChar) {
                    showInputAlert('비밀번호는 8자 이상, 특수문자 2개 이상이어야 합니다.', 'memPwd', '비밀번호 규칙 오류', 'warning');
                    return;
                }
            } else {
                showInputAlert('변경된 정보가 없습니다.', null, '수정 불가', 'warning');
                return;
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
                    // context path 동적 추출
                    var contextPath = window.location.pathname.split('/')[1] ? '/' + window.location.pathname.split('/')[1] : '';
                    var postUrl = contextPath + '/mypage/profile/edit-profile';
                    const telField = document.getElementById('memTel');
                    // FormData 대신 URLSearchParams 사용
                    const params = new URLSearchParams();
                    params.append('memNo', document.getElementById('memNo').value);
                    params.append('memId', document.getElementById('memId').value);
                    params.append('memName', document.getElementById('memName').value);
                    params.append('memPwd', document.getElementById('memPwd').value);
                    params.append('confirmPassword', document.getElementById('confirmPassword').value);
                    params.append('memTel', telField.value.replace(/-/g, ''));
                    params.append('memEmail', document.getElementById('memEmail').value);
                    params.append('memAddr', document.getElementById('memAddr').value);
                    fetch(postUrl, {
                        method: 'POST',
                        body: params
                    })
                    .then(response => {
                        console.log('응답 status:', response.status);
                        if (!response.ok) {
                            return response.text().then(text => { throw new Error('HTTP ' + response.status + ': ' + text); });
                        }
                        return response.json();
                    })
                    .then(data => {
                        console.log('응답 데이터:', data);
                        if (data.success) {
                            Swal.fire({
                                title: '수정 완료',
                                text: '개인정보가 성공적으로 수정되었습니다.',
                                icon: 'success',
                                confirmButtonText: '확인',
                                confirmButtonColor: '#00a8e8'
                            }).then(() => {
                                window.location.href = contextPath + '/mypage/profile/check-profile';
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
                        console.error('fetch 오류:', error);
                        Swal.fire({
                            title: '오류',
                            text: '수정 중 오류가 발생했습니다.\n' + error,
                            icon: 'error',
                            confirmButtonText: '확인',
                            confirmButtonColor: '#00a8e8'
                        });
                    });
                }
            });
        });
    })();

    // 페이지 진입 시 하이픈 자동 변환
    window.addEventListener('DOMContentLoaded', function() {
        const telField = document.getElementById('memTel');
        if (telField && telField.value && telField.value.length === 11 && telField.value.indexOf('-') === -1) {
            telField.value = telField.value.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        }
    });

    // 휴대폰 번호 입력 시 자동 하이픈 (개선)
    document.getElementById('memTel').addEventListener('input', function(e) {
        let value = this.value.replace(/[^0-9]/g, '').slice(0, 11);
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

    // 비밀번호 입력 시 실시간 유효성 검사
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

    // 비밀번호 확인 입력 시 일치 여부 실시간 검사
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
        } else {
            matchCheck.querySelector('.icon').textContent = '❌';
            matchCheck.classList.add('invalid');
            matchCheck.classList.remove('valid');
        }
    }
    </script>

    <!-- 공통 푸터 포함 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html> 