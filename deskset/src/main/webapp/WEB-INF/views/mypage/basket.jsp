<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage.css'/>" />
    <style>
    .container {
        width: 1200px;
        margin: 0 auto;
        padding: 15px;
        display: flex;
        gap: 15px;
    }
    
    .main-content {
        flex: 1;
        padding: 12px 20px 20px 20px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .page-title {
        margin-top: 0;
        margin-bottom: 12px;
        font-size: 28px;
        color: #333;
        font-weight: 600;
        position: relative;
        padding-bottom: 10px;
    }
    
    .page-title:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 30%;
        width: 188px;
        height: 3px;
        background-color: #00a8e8;
    }
    
    .basket-list {
        margin-bottom: 15px;
    }
    
    .basket-item {
        display: flex;
        align-items: center;
        padding: 25px 20px;
        border-bottom: 1px solid #eee;
        transition: all 0.2s;
        border-radius: 8px;
        margin-bottom: 15px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.03);
    }
    
    .basket-item:hover {
        background-color: #f9f9f9;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    }
    
    .item-checkbox {
        margin-right: 25px;
    }
    
    .item-checkbox input[type="checkbox"] {
        width: 20px;
        height: 20px;
        cursor: pointer;
        accent-color: #00a8e8;
    }
    
    .product-info {
        display: flex;
        flex: 1;
        align-items: center;
    }
    
    .product-thumb {
        width: 120px;
        height: 120px;
        object-fit: cover;
        margin-right: 25px;
        border-radius: 6px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .product-details {
        flex: 1;
    }
    
    .product-details h3 {
        margin: 0 0 12px 0;
        font-size: 18px;
        color: #333;
    }
    
    .price {
        font-weight: bold;
        color: #111;
        margin: 0 0 15px 0;
        font-size: 17px;
    }
    
    .quantity-control {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .quantity-control button {
        width: 36px;
        height: 36px;
        border: 1px solid #ddd;
        background: #f8f8f8;
        border-radius: 4px;
        cursor: pointer;
        font-size: 18px;
        font-weight: bold;
        color: #444;
        transition: all 0.2s;
    }
    
    .quantity-control button:hover {
        background: #e9e9e9;
        color: #00a8e8;
    }
    
    .quantity-input {
        width: 60px;
        height: 36px;
        text-align: center;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 16px;
    }
    
    .pagination {
        display: flex;
        justify-content: center;
        gap: 8px;
        margin: 30px 0;
    }
    
    .pagination a {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 32px;
        height: 32px;
        padding: 0 6px;
        border: 1px solid #ddd;
        border-radius: 4px;
        color: #666;
        text-decoration: none;
        transition: all 0.2s;
    }
    
    .pagination a:hover {
        background-color: #f8f9fa;
        color: #333;
    }
    
    .pagination a.active {
        background-color: #00a8e8;
        border-color: #00a8e8;
        color: white;
    }
    
    .basket-header {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        justify-content: space-between;
        background-color: #f8f9fa;
        padding: 15px;
        border-radius: 8px;
    }
    
    .select-all {
        display: flex;
        align-items: center;
        gap: 20px;
    }
    
    .select-all label {
        margin-right: 15px;
        font-weight: 500;
    }
    
    .btn-secondary {
        background-color: #6c757d;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        transition: all 0.2s;
    }
    
    .btn-secondary:hover {
        background-color: #5a6268;
    }
    
    .basket-summary {
        background-color: #f8f9fa;
        padding: 25px;
        border-radius: 8px;
        margin-top: 30px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }
    
    .summary-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        padding-bottom: 15px;
        border-bottom: 1px solid #eee;
        font-size: 16px;
    }
    
    .summary-item.total {
        border-bottom: none;
        font-weight: bold;
        font-size: 18px;
        margin-top: 20px;
        padding-top: 20px;
        border-top: 2px solid #ddd;
        margin-bottom: 25px;
    }
    
    .btn-primary {
        background-color: #00a8e8;
        color: white;
        border: none;
        padding: 15px 30px;
        border-radius: 4px;
        font-size: 16px;
        font-weight: 500;
        width: 100%;
        cursor: pointer;
        transition: all 0.2s;
        box-shadow: 0 2px 5px rgba(0,168,232,0.3);
    }
    
    .btn-primary:hover {
        background-color: #0091c8;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,168,232,0.4);
    }
    
    .btn-primary:disabled {
        background-color: #cccccc;
        transform: none;
        box-shadow: none;
        cursor: not-allowed;
    }
    
    .total-price, .shipping-fee, .final-price {
        font-weight: 500;
        font-size: 17px;
    }
    
    .final-price {
        color: #00a8e8;
        font-size: 20px;
        font-weight: bold;
    }
    
    .alert {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid transparent;
        border-radius: 4px;
    }
    
    .alert-success {
        background-color: #d4edda;
        border-color: #c3e6cb;
        color: #155724;
    }
    
    .alert-danger {
        background-color: #f8d7da;
        border-color: #f5c6cb;
        color: #721c24;
    }
    
    .hidden {
        display: none;
    }
    </style>
</head>
<body>
    <!-- 공통 헤더 포함 -->
    <jsp:include page="../common/header.jsp" />

    <div class="container">
        <!-- 공통 사이드바 포함 -->
        <jsp:include page="/WEB-INF/views/mypage/mypage-sidebar.jsp" />

        <div class="main-content">
            <h2 class="page-title">장바구니</h2>
            
            <!-- 알림 메시지 표시 -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <!-- form 시작 -->
            <form action="basketAction.do" method="post" id="basketForm">
                <div class="basket-header">
                    <div class="select-all">
                        <input type="checkbox" id="selectAll" />
                        <label for="selectAll">전체선택</label>
                        <button type="submit" name="action" value="delete" class="btn-secondary">선택삭제</button>
                    </div>
                    <div>
                        <!-- 수량 변경 저장 버튼 제거 -->
                    </div>
                </div>

                <div class="basket-list">
                    <!-- 장바구니 아이템 반복 -->
                    <c:forEach var="cart" items="${cartList}" varStatus="status">
                        <div class="basket-item">
                            <div class="item-checkbox">
                                <input type="checkbox" class="item-select" name="selectedItems" 
                                       value="${cart.memNo}_${cart.productNo}" data-price="${cart.productPrice}" />
                            </div>
                            <div class="product-info">
                                <img src="<c:url value='/resources/images/products/${cart.productThum}'/>" 
                                     onerror="this.src='https://via.placeholder.com/100x100'" 
                                     alt="${cart.productName}" class="product-thumb" />
                                <div class="product-details">
                                    <h3>${cart.productName}</h3>
                                    <p class="price"><fmt:formatNumber value="${cart.productPrice * cart.cartQuantity}" pattern="#,###" />원</p>
                                    <div class="quantity-control">
                                        <button type="button" class="decrease">-</button>
                                        <input type="number" value="${cart.cartQuantity}" min="1" max="99" class="quantity-input" 
                                               name="quantities[${status.index}]" 
                                               data-memno="${cart.memNo}" 
                                               data-productno="${cart.productNo}" />
                                        <input type="hidden" name="memNos[${status.index}]" value="${cart.memNo}" />
                                        <input type="hidden" name="productNos[${status.index}]" value="${cart.productNo}" />
                                        <button type="button" class="increase">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    
                    <!-- 장바구니가 비어있는 경우 -->
                    <c:if test="${empty cartList}">
                        <div style="text-align: center; padding: 50px 0;">
                            <p style="font-size: 18px; color: #666;">장바구니가 비어있습니다.</p>
                        </div>
                    </c:if>
                </div>

                <!-- 페이지네이션 -->
                <div class="pagination">
                    <c:if test="${totalPages > 1}">
                        <c:if test="${currentPage > 1}">
                            <a href="?page=1">&laquo;</a>
                            <a href="?page=${currentPage - 1}">&lt;</a>
                        </c:if>
                        
                        <c:set var="beginPage" value="${(currentPage > 2) ? (currentPage - 2) : 1}" />
                        <c:set var="endPage" value="${(currentPage + 2 < totalPages) ? (currentPage + 2) : totalPages}" />
                        
                        <c:forEach var="i" begin="${beginPage}" end="${endPage}">
                            <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                        </c:forEach>
                        
                        <c:if test="${currentPage < totalPages}">
                            <a href="?page=${currentPage + 1}">&gt;</a>
                            <a href="?page=${totalPages}">&raquo;</a>
                        </c:if>
                    </c:if>
                </div>

                <div class="basket-summary">
                    <div class="summary-item"><span>총 상품금액</span><span class="total-price">0원</span></div>
                    <div class="summary-item"><span>배송비</span><span class="shipping-fee">3,000원</span></div>
                    <div class="summary-item total"><span>결제예정금액</span><span class="final-price">0원</span></div>
                    <button type="submit" name="action" value="order" class="btn-primary">주문하기</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 공통 푸터 포함 -->
    <jsp:include page="../common/footer.jsp" />
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const selectAll = document.getElementById('selectAll');
        const checkboxes = document.querySelectorAll('.item-select');
        const basketForm = document.getElementById('basketForm');
        
        // 엔터키로 인한 삭제 방지
        basketForm.addEventListener('keydown', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                return false;
            }
        });
        
        // 전체 선택 기능
        selectAll.addEventListener('change', function() {
            checkboxes.forEach(cb => {
                cb.checked = this.checked;
                updateTotalPrice();
            });
        });

        // 개별 체크박스 변경 시 총액 업데이트
        checkboxes.forEach(cb => {
            cb.addEventListener('change', updateTotalPrice);
        });

        // 수량 조절 버튼
        const qtyButtons = document.querySelectorAll('.quantity-control button');
        qtyButtons.forEach(btn => {
            btn.addEventListener('click', function() {
                const input = this.parentNode.querySelector('input.quantity-input');
                const memNo = input.getAttribute('data-memno');
                const productNo = input.getAttribute('data-productno');
                const oldValue = parseInt(input.value);
                let newValue = oldValue;
                
                // 수량 증가/감소
                if (this.classList.contains('increase') && oldValue < 99) {
                    newValue = oldValue + 1;
                }
                if (this.classList.contains('decrease') && oldValue > 1) {
                    newValue = oldValue - 1;
                }
                
                // 값이 변경된 경우에만 처리
                if (newValue !== oldValue) {
                    // 입력값 업데이트
                    input.value = newValue;
                    
                    // 클라이언트 측에서 가격 업데이트 (실시간 표시용)
                    const basketItem = this.closest('.basket-item');
                    const priceElem = basketItem.querySelector('.price');
                    const checkbox = basketItem.querySelector('.item-select');
                    const unitPrice = parseInt(checkbox.getAttribute('data-price'));
                    const newTotal = unitPrice * newValue;
                    
                    // 가격 표시 업데이트
                    priceElem.textContent = new Intl.NumberFormat('ko-KR').format(newTotal) + '원';
                    
                    // 총액 업데이트
                    updateTotalPrice();
                    
                    // 서버에 바로 업데이트
                    updateCartQuantityInDB(memNo, productNo, newValue);
                }
            });
        });

        // 수량 입력값이 직접 변경되었을 때도 업데이트
        const qtyInputs = document.querySelectorAll('.quantity-input');
        qtyInputs.forEach(input => {
            input.addEventListener('change', function() {
                const memNo = this.getAttribute('data-memno');
                const productNo = this.getAttribute('data-productno');
                let newValue = parseInt(this.value);
                
                // 값 범위 확인
                if (isNaN(newValue) || newValue < 1) newValue = 1;
                if (newValue > 99) newValue = 99;
                
                // 입력값 보정
                this.value = newValue;
                
                // 클라이언트 측에서 가격 업데이트
                const basketItem = this.closest('.basket-item');
                const priceElem = basketItem.querySelector('.price');
                const checkbox = basketItem.querySelector('.item-select');
                const unitPrice = parseInt(checkbox.getAttribute('data-price'));
                const newTotal = unitPrice * newValue;
                
                // 가격 표시 업데이트
                priceElem.textContent = new Intl.NumberFormat('ko-KR').format(newTotal) + '원';
                
                // 총액 업데이트
                updateTotalPrice();
                
                // 서버에 바로 업데이트
                updateCartQuantityInDB(memNo, productNo, newValue);
            });
        });
        
        // 서버에 장바구니 수량 업데이트 함수
        function updateCartQuantityInDB(memNo, productNo, quantity) {
            console.log('API 호출: memNo=' + memNo + ', productNo=' + productNo + ', quantity=' + quantity);
            
            const requestUrl = '<c:url value="/mypage/updateCartQuantity"/>';
            const requestBody = 'memNo=' + encodeURIComponent(memNo) + 
                                '&productNo=' + encodeURIComponent(productNo) + 
                                '&quantity=' + encodeURIComponent(quantity);
            
            console.log('요청 URL:', requestUrl);
            console.log('요청 본문:', requestBody);
            
            fetch(requestUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: requestBody
            })
            .then(response => {
                console.log('응답 상태:', response.status);
                return response.json();
            })
            .then(data => {
                console.log('응답 데이터:', data);
                if (data.success) {
                    console.log('수량 업데이트 성공:', data.message);
                    showUpdateMessage('수량이 변경되었습니다.');
                } else {
                    console.error('수량 업데이트 실패:', data.message);
                    showUpdateMessage('수량 변경에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('수량 업데이트 중 오류 발생:', error);
                showUpdateMessage('수량 변경 중 오류가 발생했습니다.');
            });
        }

        // 일시적인 업데이트 메시지 표시
        function showUpdateMessage(message) {
            // 함수가 아무것도 하지 않도록 수정 (녹색 알림창 비활성화)
            return;
        }

        // 총 가격 업데이트 함수
        function updateTotalPrice() {
            let totalPrice = 0;
            let shippingFee = 3000; // 기본 배송비
            
            // 선택된 항목만 계산
            checkboxes.forEach(cb => {
                if (cb.checked) {
                    const basketItem = cb.closest('.basket-item');
                    const price = parseInt(cb.getAttribute('data-price'));
                    const qty = parseInt(basketItem.querySelector('.quantity-input').value);
                    totalPrice += price * qty;
                }
            });
            
            // 배송비 조건 (10만원 이상 무료)
            if (totalPrice >= 100000 || totalPrice === 0) {
                shippingFee = 0;
            }
            
            // 화면에 표시
            document.querySelector('.total-price').textContent = new Intl.NumberFormat('ko-KR').format(totalPrice) + '원';
            document.querySelector('.shipping-fee').textContent = new Intl.NumberFormat('ko-KR').format(shippingFee) + '원';
            document.querySelector('.final-price').textContent = new Intl.NumberFormat('ko-KR').format(totalPrice + shippingFee) + '원';
            
            // 총액이 0원이면 주문 버튼 비활성화
            const orderButton = document.querySelector('button[name="action"][value="order"]');
            if (orderButton) {
                orderButton.disabled = totalPrice === 0;
                if (totalPrice === 0) {
                    orderButton.classList.add('disabled');
                } else {
                    orderButton.classList.remove('disabled');
                }
            }
        }
        
        // 초기 총액 계산
        updateTotalPrice();
        
        // 알림 메시지 자동 제거
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert:not(.update-message)');
            alerts.forEach(alert => {
                alert.style.opacity = '0';
                alert.style.transition = 'opacity 0.5s ease';
                setTimeout(() => alert.remove(), 500);
            });
        }, 3000);
    });
    </script>
</body>
</html>
