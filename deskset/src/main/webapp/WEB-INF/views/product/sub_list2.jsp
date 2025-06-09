<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
    <img src="${pageContext.request.contextPath}/resources/images/sub_list/mouse_banner.png" alt="마우스배너">
    <div class="banner-text">
      <h1>마우스</h1>
    </div>
  </div>
</section>

<main class="product-page">

 <form action="${pageContext.request.contextPath}/product/sub_list2" method="get">
  <section class="filter-bar">
    <div class="filter-group">
      <h4>무게</h4>
      <label><input type="checkbox" name="weight" value="60g">60g</label>
      <label><input type="checkbox" name="weight" value="85g">85g</label>
      <label><input type="checkbox" name="weight" value="81.5g">81.5g</label>
      <label><input type="checkbox" name="weight" value="54g">54g</label>
      <label><input type="checkbox" name="weight" value="68g">68g</label>
      <label><input type="checkbox" name="weight" value="88g">88g</label>
      <label><input type="checkbox" name="weight" value="89g">89g</label>
      <label><input type="checkbox" name="weight" value="101g">101g</label>
      <label><input type="checkbox" name="weight" value="135g">135g</label>
    </div>

    <div class="filter-group">
       <h4>DPI(최대)</h4>
      <label><input type="checkbox" name="dpi" value="32000DPI">32000DPI</label>
      <label><input type="checkbox" name="dpi" value="8000DPI">8000DPI</label>
      <label><input type="checkbox" name="dpi" value="3200DPI">3200DPI</label>
      <label><input type="checkbox" name="dpi" value="35000DPI">35000DPI</label>
      <label><input type="checkbox" name="dpi" value="26000DPI">26000DPI</label>
      <label><input type="checkbox" name="dpi" value="25600DPI">25600DPI</label>
      <label><input type="checkbox" name="dpi" value="20000DPI">20000DPI</label>
      <label><input type="checkbox" name="dpi" value="4000DPI">4000DPI</label>
    </div>

    <div class="filter-group">
      <h4>응답속도</h4>
      <label><input type="checkbox" name="response" value="2000Hz">2000Hz</label>
      <label><input type="checkbox" name="response" value="1000Hz">1000Hz</label>
      <label><input type="checkbox" name="response" value="8000Hz">8000Hz</label>
      <label><input type="checkbox" name="response" value="4000Hz">4000Hz</label>
    </div>
    <div class="filter-group">
      <h4>센서</h4>
      <label><input type="checkbox" id="mou_response1">125Hz폴링레이트</label>
      <label><input type="checkbox" id="mou_response2">250Hz폴링레이트</label>
      <label><input type="checkbox" id="mou_response3">1000Hz폴링레이트</label>
    </div>
    <div class="filter-group">
      <h4>센서</h4>
     <label><input type="checkbox" name="sensor" value="HERO 2">HERO 2</label>
      <label><input type="checkbox" name="sensor" value="Optical">Optical</label>
      <label><input type="checkbox" name="sensor" value="Focus Pro 35K">Focus Pro 35K</label>
      <label><input type="checkbox" name="sensor" value="PAW-3395">PAW-3395</label>
      <label><input type="checkbox" name="sensor" value="HERO 25K">HERO 25K</label>
      <label><input type="checkbox" name="sensor" value="Focus+">Focus+</label>
    </div>
    <div class="filter-group">
      <h4>스위치</h4>
      <label><input type="checkbox" name="switch" value="LIGHTFORCE">LIGHTFORCE</label>
      <label><input type="checkbox" name="switch" value="일반">일반</label>
      <label><input type="checkbox" name="switch" value="저소음">저소음</label>
      <label><input type="checkbox" name="switch" value="3세대 옵티컬">3세대 옵티컬</label>
      <label><input type="checkbox" name="switch" value="카일">카일</label>
      <label><input type="checkbox" name="switch" value="Razer">Razer</label>
    </div>
    <div class="filter-group">
      <h4>인터페이스</h4>
      <label><input type="checkbox" name="interface" value="유선">유선</label>
      <label><input type="checkbox" name="interface" value="무선">무선</label>
      <label><input type="checkbox" name="interface" value="유무선">유무선</label>
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
	

<!-- 마우스 상품 리스트 -->
<section class="product-list-section">
    <div class="product-grid">
      
        <c:forEach var="product" items="${mouseList}">
  <div class="product-card">
    <a href="${pageContext.request.contextPath}/product/sub_product?product_no=${product.product_no}">
      <img src="${pageContext.request.contextPath}/${product.product_thum}" alt="${product.product_name} 상세 이미지" />
    </a>
    <p class="product-name">${product.product_name}</p>
    <p class="product-price">${product.product_price}원</p>
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


<script>
    
   
    const memNo = '${sessionScope.memNo != null ? sessionScope.memNo : ""}';
    console.log("페이지 로드 시 memNo 값:", memNo); 

    document.querySelectorAll('.cart-btn').forEach(function(btn) {
        btn.addEventListener('click', function() {
            // 현재 JavaScript 변수 memNo의 값을 기준으로 로그인 여부 판단
            if (!memNo || memNo.trim() === '' || memNo === 'null') {
                alert("회원만 가능한 서비스입니다. 로그인 페이지로 이동합니다.");
                window.location.href = '${pageContext.request.contextPath}/user/login';
            } else {
               
                const productCard = this.closest('.product-card'); // 버튼의 가장 가까운 .product-card 조상 요소를 찾음
                let productId = null;

                if (productCard) {
                    const productLink = productCard.querySelector('a[href*="product_no="]'); // .product-card 내부에서 product_no 링크를 찾음
                    if (productLink && productLink.href) {
                        const urlParams = new URLSearchParams(productLink.search); // 링크의 쿼리 파라미터 분석
                        productId = urlParams.get('product_no');
                        // 또는 이전처럼 split 사용: productId = productLink.href.split('product_no=')[1].split('&')[0];
                    }
                }
                
              

                if (!productId) {
                    alert("상품 정보를 찾을 수 없습니다. HTML 구조나 productId 추출 로직을 확인해주세요.");
                    console.error("클릭된 버튼:", this);
                    if(productCard) console.error("찾은 productCard:", productCard); else console.error(".product-card를 찾지 못했습니다.");
                    return;
                }
                
                console.log("장바구니 추가 시도 - productId:", productId); // ★★★ productId 값 확인용 로그
                
                // 실제 장바구니에 상품 담기
                addToCart(productId);
            }
        });
    });
    
    // 장바구니에 상품을 담는 함수
    function addToCart(productId) {
        // AJAX로 서버에 장바구니 담기 요청
        fetch('${pageContext.request.contextPath}/mypage/cart/add', { // 서버 CartController의 매핑 경로
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8', // CartController가 @RequestParam을 사용하므로
                'X-Requested-With': 'XMLHttpRequest'
            },
            body: new URLSearchParams({ // URLSearchParams 사용
                'productNo': productId,
                'quantity': 1 // 목록 페이지에서는 보통 1개로 고정
            })
        })
        .then(response => {
            if (!response.ok) {
                // 서버에서 에러 응답(4xx, 5xx)을 보낸 경우
                return response.json().then(err => { throw err; }) // 서버가 JSON 에러 메시지를 보냈다고 가정
                                 .catch(() => { throw new Error(`서버 응답 오류 (${response.status})`);}); // JSON 파싱 실패 또는 다른 에러
            }
            return response.json(); // 성공 응답은 JSON으로 기대
        })
        .then(data => {
            console.log("서버 응답 데이터:", data);
            if (data.success) {
                // 성공적으로 장바구니에 담긴 경우
                if (confirm(data.message || "장바구니에 담겼습니다. 장바구니 페이지로 이동하시겠습니까?")) {
                    window.location.href = '${pageContext.request.contextPath}/mypage/cart'; // 장바구니 페이지 이동 URL
                }
                // 아니오를 선택하면 현재 페이지 유지
            } else {
                alert(data.message || "장바구니 담기에 실패했습니다.");
            }
        })
        .catch(error => {
            console.error('장바구니 추가 최종 오류:', error);
            let errorMessage = "오류가 발생했습니다. 다시 시도해주세요.";
            if (error && error.message) {
                errorMessage = error.message; // 서버에서 보낸 메시지 또는 JavaScript Error 메시지
            }
            alert(errorMessage);
        });
    }
</script>
</body>
</html>
