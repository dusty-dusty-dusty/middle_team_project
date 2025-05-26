<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>DeskSet - 로그인</title>
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
            height: calc(100vh - 200px);
            margin: 0;
            padding: 0;
            position: relative;
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
        .login-box {
            width: 450px;
            background: white;
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            z-index: 10;
        }
        .login-box h2 {
            text-align: center;
            margin-bottom: 35px;
            font-size: 30px;
            color: #333;
        }
        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 18px;
            margin: 12px 0;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 17px;
        }
        .login-box button {
            width: 100%;
            background: #00aaff;
            color: white;
            padding: 18px;
            border: none;
            font-size: 19px;
            cursor: pointer;
            border-radius: 8px;
            margin-top: 25px;
        }
        .login-box button:hover {
            background: #0088cc;
        }
        .login-options {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }
        .login-options a {
            margin: 0 8px;
            text-decoration: none;
            color: #555;
        }
        .error-message {
            color: red;
            font-size: 0.9rem;
            margin-top: 5px;
        }
        footer {
            margin-top: auto;
        }
    </style>
    <script>
        window.onload = function() {
            var loginError = "${loginError != null ? loginError : ''}";
            if (loginError.trim() !== "") {
                alert(loginError);
            }
            
            // 로그인 성공 시 환영 메시지 표시
            var loginSuccess = "${loginSuccess}";
            var userName = "${userName}";
            if (loginSuccess === "true" && userName) {
                alert(userName + "님 환영합니다.");
            }
        }
    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="container">
        <div class="banner">
            <img src="${pageContext.request.contextPath}/resources/images/main_banner1.jpg" alt="배너1">
        </div>
        <div class="login-box">
            <h2>로그인</h2>
            <form action="${pageContext.request.contextPath}/user/login" method="post">
                <input type="text" name="memId" placeholder="아이디" required>
                <input type="password" name="memPwd" placeholder="비밀번호" required>
                <button type="submit">로그인</button>
            </form>
            <div class="login-options">
                <a href="${pageContext.request.contextPath}/user/register">회원가입</a> |
                <a href="#">아이디 찾기</a> |
                <a href="#">비밀번호 찾기</a>
            </div>
        </div>
        <div class="banner">
            <img src="${pageContext.request.contextPath}/resources/images/main_banner2.jpg" alt="배너2">
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
