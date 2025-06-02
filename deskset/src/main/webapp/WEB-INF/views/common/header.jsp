<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 45px;
    height: 60px;
    background-color: #f8f8f8;
    border-bottom: 1px solid #ddd;
  }

  .logo img {
    height: 215px;
    width: auto;
    display: block;
  }

  nav a {
    margin: 0 70px;
    text-decoration: none;
    color: #333;
    font-weight: bold;
    font-size: 20px;
  }

nav a:hover {
  color: #3EC6FF; /* 원하는 색상으로 변경 (파란색 예시) */
}

.login-area a {
  margin: 0 10px;
  padding: 5px 0px;
  text-decoration: none;
  color: #333;         /* 흰색에서 검정으로 변경 */
  border-radius: 4px;
  font-size: 14px;
}


  /* hover 제거됨 */
</style>
</head>
<body>

<header>
  <div class="logo">
    <a href="${pageContext.request.contextPath}/main/main_page">
      <img src="${pageContext.request.contextPath}/resources/images/common/logo.png" alt="DeskSet 로고" />
    </a>
  </div>
  <nav>
    <a href="${pageContext.request.contextPath}/notice/NoticeBoardList">NOTICE</a>
    <a href="${pageContext.request.contextPath}/product/sub_list">KEYBOARD</a>
    <a href="${pageContext.request.contextPath}/product/sub_list2">MOUSE</a>
    <a href="${pageContext.request.contextPath}/product/sub_list3">MONITOR</a>
    <a href="${pageContext.request.contextPath}/mypage/orders">MYPAGE</a>
  </nav>
  <div class="login-area">
	<c:if test="${empty sessionScope.loggedInUser}">
      <a href="${pageContext.request.contextPath}/user/login">Login</a>
      <a href="${pageContext.request.contextPath}/user/register">Register</a>
    </c:if>
    <c:if test="${not empty sessionScope.loggedInUser}">
      <a href="${pageContext.request.contextPath}/user/logout">Logout</a>
      <a href="${pageContext.request.contextPath}/mypage/cart">Cart</a>
    </c:if>
    
    <a href="#">Search</a>
  </div>
</header>

</body>
</html>
