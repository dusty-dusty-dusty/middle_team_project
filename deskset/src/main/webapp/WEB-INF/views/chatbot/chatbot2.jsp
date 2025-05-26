<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Awesome Devices - 챗봇</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    /* General Page Styles */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
        color: #333;
        line-height: 1.6;
        padding-bottom: 100px; /* 챗봇 버튼과의 간격 확보 */
    }

    header {
        background: #333;
        color: #fff;
        padding: 1rem 0;
        text-align: center;
    }

    header h1 {
        margin: 0;
        font-size: 2rem;
    }

    main {
        padding: 20px;
        min-height: 70vh;
        max-width: 1200px;
        margin: 20px auto;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    footer {
        text-align: center;
        padding: 20px;
        background: #333;
        color: #fff;
        /* position: relative; */ /* 필요에 따라 조절 */
        /* bottom: 0; */ /* 필요에 따라 조절 */
        /* width: 100%; */ /* 필요에 따라 조절 */
    }

    /* 챗봇 UI관련 스타일CSS */
    .chatbot-button {
        position: fixed;
        bottom: 25px;
        right: 25px;
        background-color: #007bff;
        color: white;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 28px;
        cursor: pointer;
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        z-index: 1000;
        transition: background-color 0.3s ease;
    }

    .chatbot-button:hover {
        background-color: #0056b3;
    }

    .chatbot-window {
        position: fixed;
        bottom: 100px;
        right: 25px;
        width: 360px;
        max-height: 70vh;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.25);
        display: none; /* <<--- 핵심: 기본적으로 숨김 처리 */
        flex-direction: column;
        z-index: 1000;
        overflow: hidden;
        border: 1px solid #ddd;
    }

    .chatbot-window.open {
        display: flex; /* <<--- 'open' 클래스가 추가되면 보이도록 설정 */
    }

    .chatbot-header {
        background-color: #007bff;
        color: white;
        padding: 12px 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: bold;
        font-size: 1.1rem;
        border-bottom: 1px solid #0056b3;
    }

    .close-chatbot { /* HTML에서 id="close-chatbot" 요소의 클래스 */
        background: none;
        border: none;
        color: white;
        font-size: 24px;
        cursor: pointer;
        line-height: 1;
    }
    .close-chatbot:hover {
        opacity: 0.8;
    }

    .chatbot-messages { /* HTML에서 id="chatbot-message" 요소의 클래스 */
        flex-grow: 1;
        padding: 15px;
        overflow-y: auto;
        background-color: #f9f9f9;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .message {
        padding: 10px 15px;
        border-radius: 18px;
        max-width: 85%;
        word-wrap: break-word;
        line-height: 1.4;
    }

    .message.user {
        background-color: #007bff;
        color: white;
        align-self: flex-end;
        border-bottom-right-radius: 5px;
    }

    .message.bot {
        background-color: #e9ecef;
        color: #333;
        align-self: flex-start;
        border-bottom-left-radius: 5px;
    }

    .chatbot-input-area {
        display: flex;
        padding: 12px;
        border-top: 1px solid #ddd;
        background-color: #fff;
    }

    #chatbot-input {
        flex-grow: 1;
        padding: 10px 15px;
        border: 1px solid #ccc;
        border-radius: 20px;
        margin-right: 10px;
        outline: none;
        font-size: 0.95rem;
    }
    #chatbot-input:focus {
        border-color: #007bff;
    }

    #chatbot-send {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 20px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    #chatbot-send:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <header>
    <h1>Awesome Devices</h1>
    </header>

    <main>
        <h2>주요상품</h2>
        <p>여기에 메인페이지~~~~~~</p>
    <%
        String userName=(String)session.getAttribute("userName"); //"userName"의 속성값을 가져오기
        String initialBotMessage ="무엇을 도와드릴까요"; // 기본 메시지
        if(userName != null && !userName.isEmpty()){ //만약 로그인한 사용자라면
            initialBotMessage =userName+"님, 무엇을 도와드릴까요"; // 오타 수정: "님,무엇을" -> "님, 무엇을"
        }
    %>
    </main>

    <footer>
        <p>&copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> Awesome Devices</p>
    </footer>

    <div id="chatbot-button" class="chatbot-button"> <!-- 플로팅 챗봇 아이콘 버튼 -->
        <i class="fas fa-comments"></i>
    </div>

    <div id="chatbot-window" class="chatbot-window"> <!-- 챗봇대화창:숨져져있다가 아이콘 클릭시 나옴 -->
         <div class="chatbot-header">
             <span>Gemini 챗봇</span>
             <button id="close-chatbot" class="close-chatbot">&times;</button>
        </div>
        <div id="chatbot-message" class="chatbot-messages"></div> <!-- 사용자 입력영역:메시지를 입력 -->
        <div class="chatbot-input-area"><!-- 사용자 입력영역: 메시지를 입력하고 전송 -->
            <input type="text" id="chatbot-input" placeholder="메시지를 입력하세요..">
            <button id="chatbot-send">전송</button>
        </div>
    </div>
      <%-- 챗봇 UI 끝 --%>
      <%-- 인라인 스크립트: JSP에서 생성된 initialBotMessage 값을 JavaScript 변수로 전달 --%>
    <script>
        const serverSideInitialMessage = "<%=initialBotMessage%>"; 
        //serverSideInitialMessage라는 javaScript상수를 선언, initialBotMessage의 값을 문자열로 할당
        															
    </script>
    <script src="<%= request.getContextPath() %>/resources/js/script.js"></script>
	
</body>
</html>