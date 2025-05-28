<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>DeskSet 상품 목록</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_list/sub_list_style.css">
  <script src="${pageContext.request.contextPath}/resources/js/sub_list/sub_list_script.js" defer></script>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<section class="key-banner">
  <div class="banner-key">
    <img src="${pageContext.request.contextPath}/resources/images/sub_list/monitor_banner.png" alt="모니터배너">
    <div class="banner-text">
      <h1>모니터</h1>
    </div>
  </div>
</section>

<main class="product-page">

 <form action="${pageContext.request.contextPath}/product/sub_list3" method="get">
  <section class="filter-bar">
    <div class="filter-group">
      <h4>화면크기</h4>
      <label><input type="checkbox" name="size" value="27인치"> 27인치</label>
      <label><input type="checkbox" name="size" value="32인치"> 32인치</label>
    </div>

    <div class="filter-group">
     <h4>패널타입</h4>
      <label><input type="checkbox" name="panel" value="IPS"> IPS</label>
      <label><input type="checkbox" name="panel" value="VA"> VA</label>
    </div>

    <div class="filter-group">
      <h4>해상도</h4>
      <label><input type="checkbox" name="resolution" value="FHD"> FHD</label>
      <label><input type="checkbox" name="resolution" value="QHD"> QHD</label>
      <label><input type="checkbox" name="resolution" value="UHD"> UHD</label>
    </div>

    <div class="filter-group">
      <h4>주사율</h4>
      <label><input type="checkbox" name="hz" value="60Hz"> 60Hz</label>
      <label><input type="checkbox" name="hz" value="75Hz"> 75Hz</label>
      <label><input type="checkbox" name="hz" value="100Hz"> 100Hz</label>
      <label><input type="checkbox" name="hz" value="144Hz"> 144Hz</label>
      <label><input type="checkbox" name="hz" value="165Hz"> 165Hz</label>
      <label><input type="checkbox" name="hz" value="180Hz"> 180Hz</label>
    </div>

    <div class="filter-group">
      <h4>응답속도</h4>
      <label><input type="checkbox" name="response" value="0.5ms"> 0.5ms</label>
      <label><input type="checkbox" name="response" value="1ms"> 1ms</label>
      <label><input type="checkbox" name="response" value="4ms"> 4ms</label>
      <label><input type="checkbox" name="response" value="5ms"> 5ms</label>
    </div>
    
     <!-- 정렬 셀렉트 -->
        <div class="product-sorting">
          <select name="sort">
            <option value="recommend" <c:if test="${param.sort == 'recommend'}">selected</c:if>>추천순</option>
            <option value="newest" <c:if test="${param.sort == 'newest'}">selected</c:if>>최신순</option>
            <option value="lowPrice" <c:if test="${param.sort == 'lowPrice'}">selected</c:if>>낮은 가격순</option>
            <option value="highPrice" <c:if test="${param.sort == 'highPrice'}">selected</c:if>>높은 가격순</option>
          </select>
        </div>

        <!-- 검색 버튼 -->
        <button type="submit" class="filter-search-btn">검색</button>
      </section>
	</form>

  <section class="product-list-section">
    <div class="product-grid">

     <c:forEach var="product" items="${monitorList}">
  <div class="product-card">
    <a href="${pageContext.request.contextPath}/product/sub_product?product_no=${product.product_no}">
      <img src="${pageContext.request.contextPath}/resources/upload/${product.product_image}" alt="${product.product_name}" />
      
    </a>
    <p class="product-price">${product.product_price}원</p>
    <button class="cart-btn">장바구니</button>
    <button class="buy-btn">구매하기</button>
  </div>
</c:forEach>
</div>

   
  </section>

</main>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
