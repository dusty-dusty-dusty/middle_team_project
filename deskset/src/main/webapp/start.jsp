<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeskSet - 최고의 사무용품 쇼핑몰</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
	min-height: 100vh;
	color: #333;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: white;
	padding: 1rem 2rem;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.header-left img {
	height: 30px;
}

.header-center .nav {
	margin: 0 1rem;
	text-decoration: none;
	color: #333;
	font-weight: 500;
}

.auth-links {
	margin-left: 1rem;
	text-decoration: none;
	color: #00a8e8;
	font-weight: 500;
}

.main-content {
	text-align: center;
	padding: 5rem 2rem;
}

h1 {
	font-size: 2.5rem;
	font-weight: 700;
	margin-bottom: 1.5rem;
	color: #2d3436;
}

p {
	font-size: 1.2rem;
	margin-bottom: 1.2rem;
	color: #636e72;
}

.login-button {
	background: #00aaff;
	color: white;
	padding: 12px 24px;
	border-radius: 8px;
	text-decoration: none;
	font-weight: 600;
	transition: 0.3s;
}

.login-button:hover {
	background: #0088cc;
}
</style>
</head> 
<body> 
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="main-content">
		<h1>Welcome to DeskSet!</h1>
		<p>데스크 환경을 위한 최고의 선택, DeskSet에 오신 것을 환영합니다.</p>
		<p>로그인하여 다양한 기능과 혜택을 경험하세요.</p>
		<p>
			<a href="${pageContext.request.contextPath}/user/login" class="login-button">로그인</a>
		</p>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html> 