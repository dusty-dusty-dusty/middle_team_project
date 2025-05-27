<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/mypage.css'/>" />
    <style>
    .basket-list {
        margin-bottom: 30px;
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
    
    .total-price, .shipping-fee, .final-price {
        font-weight: 500;
        font-size: 17px;
    }
    
    .final-price {
        color: #00a8e8;
        font-size: 20px;
        font-weight: bold;
    }
    </style>
</head>
<body>
    <!-- 공통 헤더 포함 -->
    <jsp:include page="../common/header.jsp" />

    <div class="container">
        <!-- 공통 사이드바 포함 -->
        <jsp:include page="./mypage-sidebar.jsp" />

        <div class="main-content">
            <h2>장바구니</h2>

            <!-- form 시작 -->
            <form action="basketAction.do" method="post">
                <div class="basket-header">
                    <div class="select-all">
                        <input type="checkbox" id="selectAll" />
                        <label for="selectAll">전체선택</label>
                        <button type="submit" name="action" value="delete" class="btn-secondary">선택삭제</button>
                    </div>
                </div>

                <div class="basket-list">
                    <!-- 더미 데이터 2개 -->
                    <div class="basket-item">
                        <div class="item-checkbox">
                            <input type="checkbox" class="item-select" name="selectedItems" value="1" data-price="189000" />
                        </div>
                        <div class="product-info">
                            <img src="https://via.placeholder.com/100x100" alt="기계식 키보드" class="product-thumb" />
                            <div class="product-details">
                                <h3>기계식 키보드 K1</h3>
                                <p class="price">189,000원</p>
                                <div class="quantity-control">
                                    <button type="button" class="decrease">-</button>
                                    <input type="number" value="1" min="1" max="99" class="quantity-input" />
                                    <button type="button" class="increase">+</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="basket-item">
                        <div class="item-checkbox">
                            <input type="checkbox" class="item-select" name="selectedItems" value="2" data-price="99000" />
                        </div>
                        <div class="product-info">
                            <img src="https://via.placeholder.com/100x100" alt="게이밍 마우스" class="product-thumb" />
                            <div class="product-details">
                                <h3>게이밍 마우스 M1</h3>
                                <p class="price">99,000원</p>
                                <div class="quantity-control">
                                    <button type="button" class="decrease">-</button>
                                    <input type="number" value="1" min="1" max="99" class="quantity-input" />
                                    <button type="button" class="increase">+</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 페이지네이션 -->
                <div class="pagination">
                    <a href="?page=1" class="active">1</a>
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

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const selectAll = document.getElementById('selectAll');
        const checkboxes = document.querySelectorAll('.item-select');
        
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
                const input = this.parentNode.querySelector('input');
                let v = parseInt(input.value);
                if (this.classList.contains('increase') && v < 99) input.value = v + 1;
                if (this.classList.contains('decrease') && v > 1) input.value = v - 1;
                
                // TODO: DB 연동 시 수정 필요 - 수량 변경 시 개별 상품 가격 업데이트
                // 아래 코드 추가 필요:
                // 1. 현재 상품의 기본 단가 가져오기
                // 2. 수량을 곱해서 해당 상품의 총 금액 계산
                // 3. 계산된 금액으로 화면에 표시된 가격 업데이트
                const basketItem = this.closest('.basket-item');
                const checkbox = basketItem.querySelector('.item-select');
                const unitPrice = parseInt(checkbox.getAttribute('data-price'));
                const qty = parseInt(input.value);
                const totalItemPrice = unitPrice * qty;
                basketItem.querySelector('.price').textContent = totalItemPrice.toLocaleString() + '원';
                
                updateTotalPrice();
            });
        });

        // 총액 계산 함수
        function updateTotalPrice() {
            let total = 0;
            checkboxes.forEach(cb => {
                if (cb.checked) {
                    const price = parseInt(cb.getAttribute('data-price'));
                    const qty = parseInt(cb.closest('.basket-item').querySelector('.quantity-input').value);
                    total += price * qty;
                }
            });
            
            document.querySelector('.total-price').textContent = total.toLocaleString() + '원';
            const shippingFee = total > 0 ? 3000 : 0;
            document.querySelector('.shipping-fee').textContent = shippingFee.toLocaleString() + '원';
            document.querySelector('.final-price').textContent = (total + shippingFee).toLocaleString() + '원';
        }

        // 페이지네이션 클릭 이벤트
        document.querySelectorAll('.pagination a').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                
                document.querySelectorAll('.pagination a').forEach(a => {
                    a.classList.remove('active');
                });
                
                if (!this.textContent.includes('>')) {
                    this.classList.add('active');
                }
                
                const page = this.getAttribute('href').split('=')[1];
                
                if (this.textContent === '>') {
                    const currentActive = document.querySelector('.pagination a.active');
                    const nextPage = currentActive.nextElementSibling;
                    if (nextPage && !nextPage.textContent.includes('>')) {
                        currentActive.classList.remove('active');
                        nextPage.classList.add('active');
                    }
                }
                
                const url = new URL(window.location.href);
                url.searchParams.set('page', page);
                window.history.pushState({}, '', url);
            });
        });
    });
    </script>
</body>
</html>
