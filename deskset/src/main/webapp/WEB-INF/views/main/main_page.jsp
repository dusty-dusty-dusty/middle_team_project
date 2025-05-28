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

    <!--  상품 리스트 -->
    <section class="product">
      <h2>PRODUCT</h2>
      <div class="product-list">

        <c:forEach var="product" items="${randomProducts}">
          <div class="product-item">
            <a href="${pageContext.request.contextPath}/product/sub_product?product_no=${product.product_no}">
             <img src="${pageContext.request.contextPath}/resources/images/${product.product_image}" alt="${product.product_name}">
                </a> 
           	
           	<p>${product.product_price}원</p> 
            <button class="cart-btn">장바구니</button>
            <button class="buy-btn">구매하기</button>
         
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

</body>
</html>
