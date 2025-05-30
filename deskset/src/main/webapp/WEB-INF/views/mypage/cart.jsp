<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/mypage.css'/>" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-minimal/minimal.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
    
    .page-title {
        margin-bottom: 30px;
        font-size: 28px;
        color: #333;
        font-weight: 600;
        position: relative;
        padding-bottom: 15px;
    }
    .page-title:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 3px;
        background-color: #00a8e8;
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
            <h2 class="page-title">장바구니</h2>

            <!-- form 시작 -->
            <form action="basketAction.do" method="post">
                <div class="basket-header">
                    <div class="select-all">
                        <input type="checkbox" id="selectAll" />
                        <label for="selectAll">전체선택</label>
                        <button type="submit" name="action" value="delete" class="btn-secondary">선택삭제</button>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${empty cartList}">
                        <div class="empty-cart-message">장바구니가 비어 있습니다.</div>
                    </c:when>
                    <c:otherwise>
                        <div class="basket-list">
                            <c:forEach items="${cartList}" var="cart">
                                <div class="basket-item">
                                    <div class="item-checkbox">
                                        <input type="checkbox" class="item-select" name="selectedItems" value="${cart.cartId}" data-price="${cart.productPrice}" />
                                    </div>
                                    <div class="product-info">
                                        <img src="<c:url value='/${cart.productThum}'/>" alt="${cart.productName}" class="product-thumb" />
                                        <div class="product-details">
                                            <h3>${cart.productName}</h3>
                                            <p class="price">
                                                <fmt:formatNumber value="${cart.productPrice * cart.cartQuantity}" type="number" groupingUsed="true"/>원
                                            </p>
                                            <div class="quantity-control">
                                                <button type="button" class="decrease">-</button>
                                                <input type="number" value="${cart.cartQuantity}" min="1" max="99" class="quantity-input" />
                                                <button type="button" class="increase">+</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- 페이지네이션 -->
                <div class="pagination">
                    <c:if test="${totalPages > 1}">
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                        </c:forEach>
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

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const selectAll = document.getElementById('selectAll');
        const checkboxes = document.querySelectorAll('.item-select');
        
        // --- localStorage 기반 선택 상태 저장/복원 함수 추가 ---
        function saveSelectedCartIds() {
            const selected = Array.from(document.querySelectorAll('.item-select:checked')).map(cb => cb.value);
            localStorage.setItem('selectedCartIds', JSON.stringify(selected));
        }
        function restoreSelectedCartIds() {
            const selected = JSON.parse(localStorage.getItem('selectedCartIds') || '[]');
            document.querySelectorAll('.item-select').forEach(cb => {
                cb.checked = selected.includes(cb.value);
            });
        }
        // 체크박스 변경 시 저장
        checkboxes.forEach(cb => {
            cb.addEventListener('change', saveSelectedCartIds);
        });
        // 페이지 로드 시 복원
        restoreSelectedCartIds();
        // 전체선택 체크박스 동작 및 저장 (누적/제거 방식)
        selectAll.addEventListener('change', function() {
            let selected = JSON.parse(localStorage.getItem('selectedCartIds') || '[]');
            checkboxes.forEach(cb => {
                cb.checked = this.checked;
                if (this.checked) {
                    // 체크: 중복 없이 추가
                    if (!selected.includes(cb.value)) selected.push(cb.value);
                } else {
                    // 해제: 해당 cartId만 제거
                    selected = selected.filter(id => id !== cb.value);
                }
            });
            localStorage.setItem('selectedCartIds', JSON.stringify(selected));
            updateTotalPrice();
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
                let v = parseInt(input.value, 10);
                if (this.classList.contains('increase') && v < 99) v += 1;
                if (this.classList.contains('decrease') && v > 1) v -= 1;
                if (isNaN(v) || v < 1) {
                    v = 1;
                    input.value = v;
                    Swal.fire({
                        title: '최소 수량 미만',
                        text: '최소 수량은 1개입니다.',
                        icon: 'warning',
                        confirmButtonText: '확인',
                        confirmButtonColor: '#00a8e8'
                    });
                    return;
                }
                if (v > 99) {
                    v = 99;
                    input.value = v;
                    Swal.fire({
                        title: '최대 수량 초과',
                        text: '최대 수량은 99개입니다.',
                        icon: 'warning',
                        confirmButtonText: '확인',
                        confirmButtonColor: '#00a8e8'
                    });
                    return;
                }
                input.value = v;
                input.dispatchEvent(new Event('input', { bubbles: true }));

                const basketItem = this.closest('.basket-item');
                const checkbox = basketItem.querySelector('.item-select');
                const unitPrice = parseInt(checkbox.getAttribute('data-price'), 10);
                const totalItemPrice = unitPrice * v;
                basketItem.querySelector('.price').textContent = totalItemPrice.toLocaleString() + '원';

                fetch('<c:url value="/mypage/cart/updateCartQuantity"/>', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'cartId=' + encodeURIComponent(checkbox.value) + '&quantity=' + v
                })
                .then(res => res.json())
                .then(data => {
                    if (!data.success) {
                        alert('수량 변경에 실패했습니다.');
                    }
                })
                .catch(() => {
                    alert('서버와 통신 중 오류가 발생했습니다.');
                });
                updateTotalPrice();
            });
        });

        // 수량 input에 blur 이벤트 추가
        document.querySelectorAll('input.quantity-input').forEach(input => {
            input.addEventListener('blur', function() {
                let v = parseInt(this.value, 10);
                if (isNaN(v) || v < 1) {
                    v = 1;
                    this.value = v;
                    Swal.fire({
                        title: '최소 수량 미만',
                        text: '최소 수량은 1개입니다.',
                        icon: 'warning',
                        confirmButtonText: '확인',
                        confirmButtonColor: '#00a8e8'
                    });
                    return;
                }
                if (v > 99) {
                    v = 99;
                    this.value = v;
                    Swal.fire({
                        title: '최대 수량 초과',
                        text: '최대 수량은 99개입니다.',
                        icon: 'warning',
                        confirmButtonText: '확인',
                        confirmButtonColor: '#00a8e8'
                    });
                    return;
                }
                this.value = v;

                const basketItem = this.closest('.basket-item');
                const checkbox = basketItem.querySelector('.item-select');
                const cartId = checkbox.value;

                fetch('<c:url value="/mypage/cart/updateCartQuantity"/>', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: 'cartId=' + encodeURIComponent(cartId) + '&quantity=' + v
                })
                .then(res => res.json())
                .then(data => {
                    if (!data.success) {
                        alert('수량 변경에 실패했습니다.');
                    }
                })
                .catch(() => {
                    alert('서버와 통신 중 오류가 발생했습니다.');
                });
            });
        });

        // 총액 계산 함수 (모든 페이지 선택 기준)
        function updateTotalPrice() {
            const selectedCartIds = JSON.parse(localStorage.getItem('selectedCartIds') || '[]');
            if (selectedCartIds.length === 0) {
                document.querySelector('.total-price').textContent = '0원';
                document.querySelector('.final-price').textContent = '0원';
                document.querySelector('.shipping-fee').textContent = '0원';
                return;
            }
            fetch('<c:url value="/mypage/cart/totalPrice"/>', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ cartIds: selectedCartIds })
            })
            .then(res => res.json())
            .then(data => {
                document.querySelector('.total-price').textContent = data.totalPrice.toLocaleString() + '원';
                const shippingFee = data.totalPrice > 0 ? 3000 : 0;
                document.querySelector('.shipping-fee').textContent = shippingFee.toLocaleString() + '원';
                document.querySelector('.final-price').textContent = (data.totalPrice + shippingFee).toLocaleString() + '원';
            });
        }
        // 페이지 로드 시, 체크박스 변경 시, 전체선택 시 총액 갱신
        updateTotalPrice();
        checkboxes.forEach(cb => {
            cb.addEventListener('change', updateTotalPrice);
        });
        selectAll.addEventListener('change', updateTotalPrice);

        // Enter 키로 폼 submit(선택삭제) 방지
        const basketForm = document.querySelector('form[action="basketAction.do"]');
        basketForm.addEventListener('keydown', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
            }
        });

        // 선택삭제 버튼 Ajax 처리
        const deleteBtn = document.querySelector('button[name="action"][value="delete"]');
        deleteBtn.addEventListener('click', function(e) {
            e.preventDefault();
            const selectedCartIds = JSON.parse(localStorage.getItem('selectedCartIds') || '[]');
            if (selectedCartIds.length === 0) {
                Swal.fire({
                    title: '선택 없음',
                    text: '삭제할 상품을 선택하세요.',
                    icon: 'warning',
                    confirmButtonText: '확인',
                    confirmButtonColor: '#00a8e8'
                });
                return;
            }
            Swal.fire({
                title: '선택 삭제',
                text: '선택한 상품을 장바구니에서 삭제하시겠습니까?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: '삭제',
                cancelButtonText: '취소',
                confirmButtonColor: '#00a8e8',
                cancelButtonColor: '#6c757d'
            }).then(result => {
                if (result.isConfirmed) {
                    fetch('<c:url value="/mypage/cart/deleteSelected"/>', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                        body: 'cartIds=' + selectedCartIds.map(encodeURIComponent).join('&cartIds=')
                    })
                    .then(res => res.json())
                    .then(data => {
                        if (data.success) {
                            Swal.fire({
                                title: '삭제 완료',
                                text: '선택한 상품이 삭제되었습니다.',
                                icon: 'success',
                                confirmButtonText: '확인',
                                confirmButtonColor: '#00a8e8',
                                timer: 1200,
                                showConfirmButton: false
                            }).then(() => {
                                localStorage.removeItem('selectedCartIds');
                                location.reload();
                            });
                        } else {
                            Swal.fire({
                                title: '삭제 실패',
                                text: '삭제에 실패했습니다.',
                                icon: 'error',
                                confirmButtonText: '확인',
                                confirmButtonColor: '#00a8e8'
                            });
                        }
                    })
                    .catch(() => {
                        Swal.fire({
                            title: '오류',
                            text: '서버와 통신 중 오류가 발생했습니다.',
                            icon: 'error',
                            confirmButtonText: '확인',
                            confirmButtonColor: '#00a8e8'
                        });
                    });
                }
            });
        });

        // 주문 버튼 클릭 시 localStorage 초기화(필요시 추가)
        const orderBtn = document.querySelector('button[name="action"][value="order"]');
        if (orderBtn) {
            orderBtn.addEventListener('click', function() {
                localStorage.removeItem('selectedCartIds');
            });
        }
    });
    </script>
</body>
</html>
