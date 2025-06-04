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

   <form action="${pageContext.request.contextPath}/product/sub_product" method="post" class="review-form">

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

<script>
    // JSP에서 세션의 memNo 가져오기 (로그인 여부 체크)
    // 이 코드는 페이지가 처음 로드될 때 한 번 실행됩니다.
    const memNo = '${sessionScope.memNo != null ? sessionScope.memNo : ""}';
    console.log("페이지 로드 시 memNo 값:", memNo); // ★★★ 로그인 후, 문제가 발생하는 페이지에서 이 로그를 꼭 확인하세요!

    document.querySelectorAll('.cart-btn').forEach(function(btn) {
        btn.addEventListener('click', function() {
            // 현재 JavaScript 변수 memNo의 값을 기준으로 로그인 여부 판단
            if (!memNo || memNo.trim() === '' || memNo === 'null') {
                alert("회원만 가능한 서비스입니다. 로그인 페이지로 이동합니다.");
                window.location.href = '${pageContext.request.contextPath}/user/login';
            } else {
                // 상품 ID 가져오기 
                const productCard = this.closest('.product-card'); // 버튼의 가장 가까운 .product-card 조상 요소를 찾음
                let productId = null;

                if (productCard) {
                    const productLink = productCard.querySelector('a[href*="product_no="]'); // .product-card 내부에서 product_no 링크를 찾음
                    if (productLink && productLink.href) {
                        const urlParams = new URLSearchParams(productLink.search); // 링크의 쿼리 파라미터 분석
                        productId = urlParams.get('product_no');
                        
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
