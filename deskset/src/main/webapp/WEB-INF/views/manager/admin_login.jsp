<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>DeskSet Login</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Arial', sans-serif;
      background-color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-container {
   	 display: flex;
	  flex-direction: column;
	  align-items: center;
	  min-height: 300px; /* 추가: 컨테이너 크기 확보 */
	  justify-content: center;
	  text-align: center;
    }
    .logo {
      display: flex;
      justify-content: center;
      align-items: center;
      max-width: 300px;
  	  width: 100%;
  	  margin: 0 auto 20px;
 	  gap: 10px;
/*       font-size: 32px;
      font-weight: bold;
      color: #00BFFF;
      margin-bottom: 40px; */
    }
    .logo img {
      width: 100%;
	  height: auto;
  	  display : block;
/*    width: 50px;
       margin-right: 10px;  */
    }
    .input-group {
    	  display: flex;
  align-items: center;
      margin-bottom: 15px;
      text-align: left;
    }
    .input-group label {
      display: block;
      font-size: 14px;
      color: #666;
      margin-bottom: 5px;
  margin-right: 55px; /* 라벨과 인풋 간 간격 */
  width: 55px;         /* 라벨 너비 고정 (선택) */
  flex-shrink: 0;
  font-weight: bold;
    }
    .input-group input {
      flex: 1;  
      width: 250px;
      padding: 8px;
      font-size: 14px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
 button {
  background-color: #2dbbfe; /* bg-primary: Tailwind 기본 파란색 (primary로 지정한 색상에 따라 달라질 수 있음) */
  color: white; /* text-white */
  padding-top: 0.5rem; /* py-2 (padding-y: 0.5rem) */
  padding-bottom: 0.5rem;
  padding-left: 1.5rem; /* px-6 (padding-x: 1.5rem) */
  padding-right: 1.5rem;
  border-radius: 0.375rem; /* rounded-button, 보통 rounded-md ~ rounded-lg 사이 */
  white-space: nowrap; /* whitespace-nowrap */
	margin-top: 15px;
  /* hover 상태 */
  transition: background-color 0.2s ease;
}

button:hover {
  background-color: rgba(59, 130, 246, 0.9); /* hover:bg-primary/90 (primary 색상 90% 불투명도) */
}

/* focus 상태 */
button:focus {
  outline: none;
  box-shadow:
    0 0 0 2px #3b82f6, /* focus:ring-2 + focus:ring-primary */
    0 0 0 4px #dbeafe; /* focus:ring-offset-2 + focus:ring-offset 색상(기본 Tailwind 파란색 계열) */
}
  </style>
</head>
<body>
  <div class="login-container">
    <div class="logo">
      <img src="/deskset/resources/images/manager/logo_admin.png" alt="deskset Icon">
      <!-- Desk<span style="color:#00BFFF;">Set</span> -->
    </div>
    <form>
      <div class="input-group">
        <label for="adminId">ID</label>
        <input type="text" id="admin_id" placeholder="아이디를 입력해 주세요.">
      </div>
      <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="admin_pwd" placeholder="비밀번호를 입력해 주세요.">
      </div>
	  <button type="submit">로그인</button>
    </form>
  </div>
</body>
</html>