<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>DeskSet - 시작 페이지</title>
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
        .welcome-container {
            width: 100%;
            max-width: 800px;
            margin: 100px auto;
            padding: 40px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .welcome-message {
            font-size: 32px;
            color: #333;
            margin-bottom: 30px;
        }
        .welcome-submessage {
            font-size: 18px;
            color: #666;
            margin-bottom: 40px;
        }
        .start-button {
            display: inline-block;
            padding: 15px 40px;
            background: #00aaff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 18px;
            transition: background 0.3s;
        }
        .start-button:hover {
            background: #0088cc;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="welcome-container">
        <div class="welcome-message">
            ${userName}님 환영합니다!
        </div>
        <div class="welcome-submessage">
            DeskSet 서비스를 이용하시려면 아래 버튼을 클릭해주세요.
        </div>
        <a href="${pageContext.request.contextPath}/user/main" class="start-button">시작하기</a>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html> 