<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>DeskSet - 제품 상세</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_product/sub_product_style.css">
  <script src="${pageContext.request.contextPath}/resources/js/sub_product/sub_product_script.js" defer></script>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<main class="product-container">
  <div class="product-inner">

    <!-- 제품 이미지 -->
    <div class="product-image">
      <img src="${pageContext.request.contextPath}/${product.product_image}" alt="${product.product_name}" />
    </div>

    <!-- 제품 정보 -->
    <div class="product-info">
      <h2 class="product-name">${product.product_name}</h2>
      <p class="product-price">${product.product_price}원</p>

      <ul class="product-spec">
        <li>제조사: ${product.product_mfc}</li>
<%--         <li>배열: ${product.layout}</li>
        <li>스위치: ${product.switchType}</li>
        <li>키압: ${product.keyWeight}</li>
        <li>인터페이스: ${product.interfaceType}</li>
        <li>응답속도: ${product.responseTime}</li>
        <li>하우징: ${product.housing}</li> --%>
      </ul>

      <!-- 수량 조절 -->
      <div class="product-quantity">
        <label for="quantity">수량:</label>
        <div class="quantity-box">
          <button type="button" class="qty-btn minus">-</button>
          <input type="number" id="quantity" name="quantity" value="1" min="1" />
          <button type="button" class="qty-btn plus">+</button>
        </div>
      </div>

      <div class="product-buttons">
        <button class="btn-cart">장바구니</button>
        <button class="btn-buy">구매하기</button>
      </div>
    </div>
  </div>

  <!-- 탭 메뉴 -->
  <div class="product-tab">
    <ul class="tab-menu">
      <li><a href="#detail-section" class="tab-link active">상품 상세정보</a></li>
      <li><a href="#review-section" class="tab-link scroll-to-review">리뷰</a></li>
    </ul>
  </div>

  <!-- 상세 이미지 출력 -->
<section class="product-detail" id="detail-section">
  <div class="detail-image">
  <c:forEach var="img" items="${imgList}">
    <img src="${pageContext.request.contextPath}/${img}" alt="${product.product_name} 상세 이미지" />
  </c:forEach>
</div>
  <div class="product-description">
    <p>${product.product_cont}</p> <!-- 설명 텍스트 -->
  </div>
</section>

  <!-- 리뷰 영역 -->
  <section class="product-review" id="review-section">
    <h3>리뷰</h3>

   <form action="${pageContext.request.contextPath}/product/sub_product" method="post">
 <input type="hidden" name="product_no" value="${product.product_no}">
  <input type="hidden" name="order_detail_no" value="${order_detail_no}">
  

  <textarea name="review_cont" placeholder="리뷰를 입력하세요"></textarea>

  <select name="review_rating">
    <option value="5">5점</option>
    <option value="4">4점</option>
    <option value="3">3점</option>
    <option value="2">2점</option>
    <option value="1">1점</option>
  </select>

  <button type="submit">리뷰 등록</button>
</form>
    





    <!-- 리뷰 목록 -->
     <ul class="review-list">
  <c:forEach var="review" items="${reviewList}">
    <li class="review-item">
      <div class="review-header">
        <strong>${review.mem_no}</strong>
        <span class="review-date">${review.review_date}</span>
      </div>
      <p class="review-content">${review.review_cont}</p>
      <p class="review-rating">평점: ${review.review_rating}점</p>
    </li>
  </c:forEach>
</ul>
  </section>
</main> 

<jsp:include page="../common/footer.jsp" />

</body>
</html>
