<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <a href="${pageContext.request.contextPath}/index.jsp">
      <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="DeskSet 로고" />
    </a>
  </div>
  <nav>
    <a href="#">NOTICE</a>
    <a href="#">KEYBOARD</a>
    <a href="#">MOUSE</a>
    <a href="#">MONITOR</a>
    <a href="#">MYPAGE</a>
  </nav>
  <div class="login-area">
    <a href="#">Login</a>
    <a href="#">Register</a>
    <a href="#">Search</a>
  </div>
</header>

</body>
</html>
