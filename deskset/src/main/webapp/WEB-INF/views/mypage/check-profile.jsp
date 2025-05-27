<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인정보 확인</title>
<link rel="stylesheet" href="<c:url value='/resources/css/mypage.css'/>" />
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
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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
	left: 80%;
	width: 188px;
	height: 3px;
	background-color: #00a8e8;
}

.profile-container {
	max-width: 550px;
	margin: 0 auto;
}

.info-group {
	margin-bottom: 28px;
	position: relative;
}

.info-group label {
	display: block;
	margin-bottom: 10px;
	font-weight: 500;
	color: #444;
	font-size: 16px;
}

.info-value {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ddd;
	border-radius: 6px;
	font-size: 16px;
	background-color: #f8f9fa;
	color: #333;
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

.edit-button {
	background-color: #00a8e8;
	color: white;
	box-shadow: 0 2px 5px rgba(0,168,232,0.3);
}

.edit-button:hover {
	background-color: #0091c8;
	transform: translateY(-2px);
	box-shadow: 0 4px 8px rgba(0,168,232,0.4);
}
</style>
</head>
<body>
	<!-- 공통 헤더 포함 -->
	<jsp:include page="../common/header.jsp" />

	<div class="container">
		<!-- 공통 사이드바 포함 -->
		<jsp:include page="/WEB-INF/views/mypage/mypage-sidebar.jsp" />

		<div class="main-content">
			<h2 class="page-title">개인정보 확인</h2>
			
			<c:if test="${not empty message}">
				<script>
					Swal.fire({
						title: '성공',
						text: '${message}',
						icon: 'success',
						confirmButtonText: '확인',
						confirmButtonColor: '#00a8e8'
					});
				</script>
			</c:if>
			
			<div class="profile-container">
				<div class="info-group">
					<label>회원 이름</label>
					<div class="info-value">${member.memName}</div>
					</div>

				<div class="info-group">
					<label>아이디</label>
					<div class="info-value">${member.memId}</div>
					</div>

				<div class="info-group">
					<label>이메일</label>
					<div class="info-value">${member.memEmail}</div>
					</div>

				<div class="info-group">
					<label>휴대폰 번호</label>
					<div class="info-value">${member.memTel}</div>
					</div>

				<div class="info-group">
					<label>주소</label>
					<div class="info-value">${member.memAddr}</div>
					</div>

					<div class="button-group">
					<button type="button" class="edit-button" onclick="location.href='/deskset/mypage/edit-profile'">수정</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 공통 푸터 포함 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
