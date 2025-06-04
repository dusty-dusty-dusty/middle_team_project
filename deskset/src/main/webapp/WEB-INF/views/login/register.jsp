<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>DeskSet - 회원가입</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            height: calc(100vh - 200px); /* 헤더/푸터 제외한 높이 */
            margin: 0;
            padding: 0;
            position: relative; /* register-box의 absolute 포지셔닝 기준 */
        }
        .banner {
            width: 50%;
            height: 100%;
            overflow: hidden;
            position: relative;
        }
        .banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
        }
        .register-box {
            width: 400px;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            position: absolute;
            left: 50%;
            top: 60%; /* 중앙(50%)에서 아래로 내림 */
            transform: translate(-50%, -50%);
            z-index: 10;
        }
        .register-box h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            color: #333;
        }
        .register-box input[type="text"],
        .register-box input[type="password"],
        .register-box input[type="email"],
        .register-box input[type="tel"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
        }
        .id-input-group {
            display: flex;
            align-items: center; /* 세로 중앙 정렬 */
            gap: 10px; /* 입력창과 버튼 사이 간격 */
            margin: 10px 0; /* 다른 입력창과 동일한 상하 마진 */
        }
        .id-input-group input[type="text"] {
            flex: 1; /* 남은 공간을 모두 차지하도록 */
            margin: 0; /* 부모 id-input-group에서 마진을 설정했으므로 개별 마진 제거 */
            padding: 15px; /* 다른 입력창과 동일한 패딩 */
            font-size: 16px; /* 다른 입력창과 동일한 폰트 크기 */
        }
        .id-input-group button {
            /* 중복확인 버튼의 크기를 적절히 조정 */
            width: 100px; /* 고정 너비로 설정 (원하는 크기로 조정) */
            flex-shrink: 0; /* 너비가 줄어들지 않도록 고정 */
            background: #00aaff;
            color: white;
            padding: 15px 0; /* 세로 패딩은 다른 입력창과 동일, 가로 패딩은 0으로 */
            border: none;
            font-size: 16px; /* 다른 입력창/버튼과 유사하게 */
            cursor: pointer;
            border-radius: 8px;
            height: auto; /* 내용에 맞춰 높이 자동 조절 */
            line-height: normal; /* 텍스트가 중앙에 오도록 */
            margin: 0; /* 부모 id-input-group에서 마진을 설정했으므로 개별 마진 제거 */
        }
        .id-input-group button:hover {
            background: #0088cc;
        }
        #idCheckMsg {
            font-size: 14px;
            margin: 5px 0;
            color: #555; /* 기본 색상 */
        }
        .register-box button[type="submit"] { /* 전체 가입하기 버튼 선택자 명확화 */
            width: 100%;
            background: #00aaff;
            color: white;
            padding: 15px;
            border: none;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            margin-top: 20px;
        }
        .register-box button[type="submit"]:hover {
            background: #0088cc;
        }
        .register-options {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }
        .register-options a {
            margin: 0 8px;
            text-decoration: none;
            color: #555;
            transition: color 0.3s ease; /* 호버 효과를 위한 전환 추가 */
        }
        .register-options a:hover {
            color: #00aaff;
        }
        .error-message {
            color: red;
            font-size: 0.9rem;
            margin-top: 5px;
        }
        footer {
            margin-top: auto; /* 푸터를 하단에 고정 */
        }
        .password-requirements {
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }
        .icon {
            margin-right: 5px;
        }
        .valid {
            color: green;
        }
        .invalid {
            color: red;
        }
        .password-requirements-row {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .password-requirements-row .requirement {
            margin-bottom: 0;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        window.onload = function() {
            var registerError = "${registerError != null ? registerError : ''}";
            if (registerError.trim() !== "") {
                alert(registerError);
            }
        };
        function validatePassword() {
            var pw = document.getElementById("memPwd").value;
            var pwCheck = document.getElementById("memPwdCheck").value;
            var passwordMismatch = document.getElementById("passwordMismatch");

            if (pw !== pwCheck) {
                passwordMismatch.innerText = "비밀번호가 일치하지 않습니다.";
                passwordMismatch.style.display = "block";
                return false;
            }

            if (pw.length < 8) {
                passwordMismatch.innerText = "비밀번호는 최소 8자 이상이어야 합니다.";
                passwordMismatch.style.display = "block";
                return false;
            }

            var special = pw.match(/[^a-zA-Z0-9]/g);
            if (!special || special.length < 2) {
                passwordMismatch.innerText = "비밀번호는 특수문자를 2개 이상 포함해야 합니다.";
                passwordMismatch.style.display = "block";
                return false;
            }

            passwordMismatch.style.display = "none";
            return true;
        }
        function checkId() {
            var memId = document.getElementById("memId").value;
            if (!memId) {
                document.getElementById("idCheckMsg").innerText = "아이디를 입력하세요.";
                document.getElementById("idCheckMsg").style.color = "red";
                return;
            }
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "${pageContext.request.contextPath}/user/idCheck?memId=" + encodeURIComponent(memId), true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    if (xhr.responseText === "success") {
                        document.getElementById("idCheckMsg").style.color = "#007bff";
                        document.getElementById("idCheckMsg").innerText = "사용할 수 있는 아이디입니다.";
                    } else {
                        document.getElementById("idCheckMsg").style.color = "red";
                        document.getElementById("idCheckMsg").innerText = "사용할 수 없는 아이디입니다.";
                    }
                }
            };
            xhr.send();
        }
        function validateForm() {
            var memId = document.getElementById("memId").value;
            var memPwd = document.getElementById("memPwd").value;
            var memPwdCheck = document.getElementById("memPwdCheck").value;
            var memName = document.getElementsByName("memName")[0].value;
            var memEmail = document.getElementsByName("memEmail")[0].value;
            var memTel = document.getElementsByName("memTel")[0].value;
            var memAddr = document.getElementsByName("memAddr")[0].value;

            if (!memId || !memPwd || !memPwdCheck || !memName || !memEmail || !memTel || !memAddr) {
                Swal.fire('입력 오류', '모든 필수 항목을 입력해주세요.', 'warning');
                return false;
            }

            if (document.getElementById("idCheckMsg").style.color !== "rgb(0, 123, 255)") {
                Swal.fire('아이디 중복 확인', '아이디 중복 확인을 해주세요.', 'warning');
                return false;
            }

            return validatePassword();
        }
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('.register-box form');
            const telInput = form.querySelector('input[name="memTel"]');
            telInput.addEventListener('input', function(e) {
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
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                if (!validateForm()) return;
                const formData = new FormData(form);
                formData.set('memTel', formData.get('memTel').replace(/-/g, ''));
                const params = new URLSearchParams();
                for (const [key, value] of formData.entries()) {
                    params.append(key, value);
                }
                fetch(form.action, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: params.toString()
                })
                .then(res => res.json())
                .then(data => {
                    if (data.success) {
                        Swal.fire('회원가입 성공!', '', 'success').then(() => {
                            location.href = '/deskset/user/login';
                        });
                    } else {
                        Swal.fire('회원가입 실패', data.message, (data.message === '이미 등록된 이메일입니다. 다른 이메일을 입력해 주세요.' || data.message === '이미 등록된 휴대폰 번호입니다. 다른 번호를 입력해 주세요.') ? 'warning' : 'error');
                    }
                })
                .catch(() => {
                    Swal.fire('회원가입 실패', '알 수 없는 오류가 발생했습니다.', 'error');
                });
            });
        });
    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="container">
        <div class="banner">
            <img src="${pageContext.request.contextPath}/resources/images/notice/main_banner1.jpg" alt="배너1">
        </div>
        <div class="register-box">
            <h2>회원가입</h2>
            <form action="${pageContext.request.contextPath}/user/register" method="post" onsubmit="return validateForm()">
                <input type="text" name="memName" placeholder="이름" required>
                <div class="id-input-group">
                    <input type="text" id="memId" name="memId" placeholder="아이디" required>
                    <button type="button" onclick="checkId()">중복확인</button>
                </div>
                <div id="idCheckMsg"></div>
                <input type="password" id="memPwd" name="memPwd" placeholder="비밀번호" required>
                <input type="password" id="memPwdCheck" name="memPwdCheck" placeholder="비밀번호 확인" required>
                <div id="passwordMismatch" class="error-message" style="display:none;"></div>
                <input type="email" name="memEmail" placeholder="이메일" required>
                <input type="tel" name="memTel" placeholder="휴대폰 번호" required>
                <input type="text" name="memAddr" placeholder="주소" required>
                <button type="submit">가입하기</button>
            </form>
            <div class="register-options">
                <a href="${pageContext.request.contextPath}/user/login">로그인</a>
            </div>
        </div>
        <div class="banner">
            <img src="${pageContext.request.contextPath}/resources/images/notice/main_banner2.jpg" alt="배너2">
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>