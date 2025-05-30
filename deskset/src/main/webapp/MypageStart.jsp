<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DeskSet - 최고의 사무용품 쇼핑몰</title>
<link rel="preconne
ct" href="https://fonts.googleapis.com">
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
	display: flex;
	justify-content: center;
	align-items: center;
	color: #333;
}

.container {
	width: 100%;
	max-width: 1200px;
	padding: 2rem;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	animation: fadeIn 1.5s ease-in-out;
}

@
keyframes fadeIn { 0% {
	opacity: 0;
	transform: translateY(-20px);
}

100
%
{
opacity
:
1;
transform
:
translateY(
0
);
}
}
.card {
	background-color: rgba(255, 255, 255, 0.9);
	border-radius: 16px;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
	padding: 3rem;
	width: 100%;
	max-width: 800px;
	text-align: center;
	backdrop-filter: blur(5px);
	transition: transform 0.3s ease;
}

.card:hover {
	transform: translateY(-5px);
}

.logo {
	margin-bottom: 2rem;
	animation: pulse 2s infinite;
}

@
keyframes pulse { 0% {
	transform: scale(1);
}

50
%
{
transform
:
scale(
1.05
);
}
100
%
{
transform
:
scale(
1
);
}
}
.logo i {
	font-size: 3.5rem;
	color: #00a8e8;
	margin-bottom: 1rem;
}

.welcome-message {
	margin-bottom: 2.5rem;
}

h1 {
	font-size: 2.5rem;
	font-weight: 700;
	margin-bottom: 1rem;
	color: #2d3436;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
}

p {
	font-size: 1.2rem;
	line-height: 1.6;
	color: #636e72;
	margin-bottom: 1.5rem;
}

.features {
	display: flex;
	justify-content: space-around;
	margin: 2rem 0;
	flex-wrap: wrap;
}

.feature {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 1rem;
	flex: 1;
	min-width: 180px;
}

.feature i {
	font-size: 1.8rem;
	color: #00a8e8;
	margin-bottom: 0.5rem;
}

.feature p {
	font-size: 0.9rem;
	margin-bottom: 0;
}

.buttons {
	display: flex;
	gap: 1rem;
	margin-top: 1.5rem;
	flex-wrap: wrap;
	justify-content: center;
}

.button {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 0.8rem 2rem;
	background-color: #00a8e8;
	color: white;
	text-decoration: none;
	border-radius: 50px;
	font-size: 1rem;
	font-weight: 500;
	transition: all 0.3s ease;
	border: none;
	cursor: pointer;
	box-shadow: 0 4px 15px rgba(0, 168, 232, 0.3);
}

.button:hover {
	background-color: #0088cc;
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(0, 168, 232, 0.4);
}

.button.secondary {
	background-color: transparent;
	color: #00a8e8;
	border: 2px solid #00a8e8;
}

.button.secondary:hover {
	background-color: rgba(0, 168, 232, 0.1);
}

.button i {
	margin-right: 0.5rem;
}

@media ( max-width : 768px) {
	.card {
		padding: 2rem 1rem;
	}
	h1 {
		font-size: 2rem;
	}
	p {
		font-size: 1rem;
	}
	.features {
		flex-direction: column;
	}
	.buttons {
		flex-direction: column;
		width: 100%;
	}
	.button {
		width: 100%;
		margin-bottom: 0.5rem;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="logo">
				<i class="fas fa-desktop"></i>
				<h1>DeskSet</h1>
			</div>

			<div class="welcome-message">
				<h1>최고의 사무용품 쇼핑몰에 오신 것을 환영합니다</h1>
				<p>
					필요한 모든 사무용품을 한 곳에서 만나보세요.<br>DeskSet과 함께 더 효율적인 업무 환경을 만들어보세요!
				</p>
			</div>

			<div class="features">
				<div class="feature">
					<i class="fas fa-truck"></i>
					<p>빠른 배송</p>
				</div>
				<div class="feature">
					<i class="fas fa-medal"></i>
					<p>품질 보증</p>
				</div>
				<div class="feature">
					<i class="fas fa-comment-dots"></i>
					<p>24시간 고객 지원</p>
				</div>
			</div>

			<div class="buttons">
				<a href="<c:url value='/mypage'/>" class="button"> <i
					class="fas fa-shopping-cart"></i>쇼핑 시작하기
				</a>
			</div>
		</div>
	</div>
</body>
</html>
