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

  <!-- 키보드 배너 -->
  <section class="key-banner">
    <div class="banner-key">
      <img src="${pageContext.request.contextPath}/resources/images/sub_list/keyboard_banner.png" alt="키보드배너">
      <div class="banner-text">
        <h1>키보드</h1>
      </div>
    </div>
  </section>

  <main class="product-page">

    <!-- 필터 영역 -->
    <form action="${pageContext.request.contextPath}/product/sub_list" method="get">
      <section class="filter-bar">
        <div class="filter-group">
          <h4>제조사</h4>
          <label><input type="checkbox" name="brand" value="레이저">레이저</label>
          <label><input type="checkbox" name="brand" value="앱코">앱코</label>
          <label><input type="checkbox" name="brand" value="한성컴퓨터">한성컴퓨터</label>
          <label><input type="checkbox" name="brand" value="AULA">AULA</label>
          <label><input type="checkbox" name="brand" value="로지텍">로지텍</label>
          <label><input type="checkbox" name="brand" value="CHERRY">CHERRY</label>
          <label><input type="checkbox" name="brand" value="다얼유">다얼유</label>
        </div>

        <div class="filter-group">
          <h4>배열</h4>
          <label><input type="checkbox" name="layout" value="104키">104키</label>
          <label><input type="checkbox" name="layout" value="108키">108키</label>
          <label><input type="checkbox" name="layout" value="109키">109키</label>
          <label><input type="checkbox" name="layout" value="99키">99키</label>
          <label><input type="checkbox" name="layout" value="87키">87키</label>
          <label><input type="checkbox" name="layout" value="106키">106키</label>
        </div>

        <div class="filter-group">
          <h4>스위치</h4>
          <label><input type="checkbox" name="switch" value="무접점(광축)">무접점(광축)</label>
          <label><input type="checkbox" name="switch" value="딥 사운드축">딥 사운드축</label>
          <label><input type="checkbox" name="switch" value="딥블루 뽀송축">딥블루 뽀송축</label>
          <label><input type="checkbox" name="switch" value="저소음 피치축">저소음 피치축</label>
          <label><input type="checkbox" name="switch" value="펜타그래프">펜타그래프</label>
          <label><input type="checkbox" name="switch" value="비올라축">비올라축</label>
          <label><input type="checkbox" name="switch" value="멤브레인">멤브레인</label>
          <label><input type="checkbox" name="switch" value="저소음 머스타드축">저소음 머스타드축</label>
        </div>

        <div class="filter-group">
          <h4>키캡</h4>
          <label><input type="checkbox" name="keycap" value="PBT">PBT</label>
          <label><input type="checkbox" name="keycap" value="ABS">ABS</label>
        </div>

        <div class="filter-group">
          <h4>인터페이스</h4>
          <label><input type="checkbox" name="interface" value="유선">유선</label>
          <label><input type="checkbox" name="interface" value="유무선">유무선</label>
          <label><input type="checkbox" name="interface" value="무선">무선</label>
        </div>

        <div class="filter-group">
          <h4>응답속도</h4>
          <label><input type="checkbox" name="response" value="1ms">1ms</label>
          <label><input type="checkbox" name="response" value="3ms">3ms</label>
        </div>

        <div class="filter-group">
          <h4>하우징</h4>
          <label><input type="checkbox" name="housing" value="알루미늄">알루미늄</label>
          <label><input type="checkbox" name="housing" value="플라스틱">플라스틱</label>
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

    <!-- 상품 리스트 -->
    <section class="product-list-section">
  <div class="product-grid">
  
    <c:forEach var="p" items="${keyboardList}">
      <div class="product-card">
        <a href="${pageContext.request.contextPath}/product/sub_product?product_no=${p.product_no}">
          <img src="${pageContext.request.contextPath}/${p.product_thum}" alt="${p.product_name} 상세 이미지" />
        </a>
        <p class="product-name">${p.product_name}</p>
        <p class="product-price">${p.product_price}원</p>
        <div class="product-buttons">
  		<button class="cart-btn">장바구니</button>
  		<button class="buy-btn">구매하기</button>
		</div>
      </div>
    </c:forEach>
      </div>
    </section>

  </main>

  <jsp:include page="../common/footer.jsp" />

</body>
</html>
