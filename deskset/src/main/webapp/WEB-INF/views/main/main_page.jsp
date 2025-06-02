<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>DeskSet Main</title>

  <!-- CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main_style.css">

  <!-- JS -->
  <script src="${pageContext.request.contextPath}/resources/js/main/main_script.js" defer></script>
</head>
<body>


  <!--  헤더 include -->
  <jsp:include page="../common/header.jsp" />

  <main>
    <!--  메인 배너 -->
    <section class="main-banner">
      <div class="banner-slider">
        <img src="${pageContext.request.contextPath}/resources/images/main/main_banner1.jpg" alt="배너1" class="active">
        <img src="${pageContext.request.contextPath}/resources/images/main/main_banner2.jpg" alt="배너2">
      </div>

      <div class="banner-text">
        <h1>최고의 환경,</h1>
        <h1>데스크셋에서</h1>
        <p>지금 바로 당신만의 게이밍 셋팅을 완성하세요.</p>
      </div>

      <button class="banner-btn prev">‹</button>
      <button class="banner-btn next">›</button>
    </section>


	<!-- 추천 결과 출력 영역 -->
<div id="recommendationArea" style="margin: 30px; text-align: center;"></div>




    <!--  상품 리스트 -->
    <section class="product">
      <h2>PRODUCT</h2>
      <div class="product-list">

        <c:forEach var="product" items="${randomProducts}">
          <div class="product-item">
            <a href="${pageContext.request.contextPath}/product/sub_product?product_no=${product.product_no}">
      <img src="${pageContext.request.contextPath}/${product.product_thum}" alt="${product.product_name} 상세 이미지" />
                </a> 
           	 <p class="product-name">${product.product_name}</p>
           	<p>${product.product_price}원</p> 
            <div class="product-buttons">
	 		<button class="cart-btn">장바구니</button>
	 		<button class="buy-btn">구매하기</button>
			</div>
         
          </div>
        </c:forEach>

      </div>
    </section>

    <!--  서브 배너 -->
    <section class="sub-banner">
      <img src="${pageContext.request.contextPath}/resources/images/main/sub_banner.png" alt="서브 배너">
      <div class="sub-banner-text">
        <h1>지금 구매하세요!</h1>
      </div>
    </section>

    <!--  이벤트 배너 -->
    <section class="event">
      <h2>EVENT</h2>
      <div class="event-banner-list">
        <img src="${pageContext.request.contextPath}/resources/images/main/event1.png" alt="이벤트1">
        <img src="${pageContext.request.contextPath}/resources/images/main/event2.png" alt="이벤트2">
        <img src="${pageContext.request.contextPath}/resources/images/main/event3.png" alt="이벤트3">
      </div>
    </section>
  </main>

  <!--  푸터 include -->
  <jsp:include page="../common/footer.jsp" />
  
  <!-- 챗봇 버튼 -->
<button id="chatBotToggle">💬</button>

<!-- 챗봇 모달 -->
<div id="chatBotModal">
    <div>
        DeskSet AI Chatbot
    </div>
    <div id="chatContent"></div>
    <div>
        <input type="text" id="chatInput" placeholder="메시지를 입력하세요">
        <button onclick="sendChat()">전송</button>
    </div>
</div>

<script>
    // 버튼 클릭하면 챗봇 모달 열고 닫기
    document.getElementById("chatBotToggle").onclick = function() {
        var modal = document.getElementById("chatBotModal");
        if (modal.style.display === "none" || modal.style.display === "") {
            modal.style.display = "flex";
        } else {
            modal.style.display = "none";
        }
    };

    // 전송 버튼 클릭 이벤트 (임시 - 나중에 API 연결 예정)
    function sendChat() {
    var input = document.getElementById("chatInput");
    var chatContent = document.getElementById("chatContent");
    var userMessage = input.value;

    if (userMessage.trim() === "") return;

    // 사용자 입력 표시
    chatContent.innerHTML += "<p class='user-message'><strong>나:</strong> " + userMessage + "</p>";
    chatContent.innerHTML += "<p id='loadingMessage' class='bot-message'><strong>챗봇:</strong> 잠시만 기다려주세요...</p>";
    chatContent.scrollTop = chatContent.scrollHeight;
    input.value = "";

    // AJAX 요청 (Spring Controller로 메시지 전달)
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "${pageContext.request.contextPath}/deskset/chat");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            var loadingMessage = document.getElementById("loadingMessage");
            if (loadingMessage) loadingMessage.remove();

            if (xhr.status === 200) {
                var botResponse = xhr.responseText;

                // 챗봇 응답 표시
                chatContent.innerHTML += "<p class='bot-message'><strong>챗봇:</strong> " + botResponse + "</p>";
            } else {
                chatContent.innerHTML += "<p class='bot-message'><strong>챗봇:</strong> 오류가 발생했습니다. 다시 시도해주세요.</p>";
            }

            chatContent.scrollTop = chatContent.scrollHeight;
        }
    };
    xhr.send("question=" + encodeURIComponent(userMessage));
    }
</script>
  
 
 
  

</body>
</html>
