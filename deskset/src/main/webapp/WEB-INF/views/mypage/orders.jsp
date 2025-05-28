<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문목록/배송조회</title>
<link rel="stylesheet" href="<c:url value='/resources/css/mypage/mypage.css'/>" />
<style>
.container {
	width: 1200px;
	margin: 0 auto;
	padding: 20px;
	display: flex;
	gap: 20px;
}

.main-content {
	flex: 1;
	padding: 20px;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.page-title {
	margin-bottom: 20px;
	font-size: 24px;
	color: #333;
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

.table-container {
	width: 100%;
	margin-bottom: 20px;
}

.order-table {
	width: 100%;
	table-layout: fixed;
	border-collapse: collapse;
}

.order-table th {
	background-color: #f8f9fa;
	font-weight: 600;
	padding: 15px;
	text-align: center;
	border-top: 1px solid #dee2e6;
	border-bottom: 1px solid #dee2e6;
}

.order-table td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #dee2e6;
	vertical-align: middle;
}

/* 각 열의 너비 설정 */
.order-table th:nth-child(1), .order-table td:nth-child(1) {
	width: 140px; /* 주문번호 */
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.order-table th:nth-child(2), .order-table td:nth-child(2) {
	width: 340px; /* 상품명 */
	text-align: left;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	padding-left: 40px; /* 패딩 값을 20px에서 40px로 늘려 더 오른쪽으로 이동 */
}

.order-table th:nth-child(3), .order-table td:nth-child(3) {
	width: 140px; /* 주문 현황 */
}

.order-table th:nth-child(4), .order-table td:nth-child(4) {
	width: 140px; /* 주문 날짜 */
	white-space: nowrap;
}

.order-table th:nth-child(5), .order-table td:nth-child(5) {
	width: 140px; /* 총 금액 */
	text-align: center; /* 오른쪽 정렬에서 가운데 정렬로 변경 */
	white-space: nowrap;
	padding-right: 30px; /* 오른쪽 패딩 추가하여 전체 열을 왼쪽으로 이동 */
}

.order-table tr {
	display: none;
}

.order-table tr.active-page {
	display: table-row;
}

.order-table thead tr {
	display: table-row;
}

.order-table tbody tr:hover {
	background-color: #f8f9fa;
}

.status {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 4px;
	font-size: 14px;
	min-width: 90px;
}

.status.배송완료 {
	background-color: #e8f5e9;
	color: #2e7d32;
}

.status.배송중 {
	background-color: #e3f2fd;
	color: #1976d2;
}

.status.배송준비중 {
	background-color: #fff3e0;
	color: #f57c00;
}

.pagination {
	display: flex;
	justify-content: center;
	gap: 8px;
	margin-top: 30px;
	padding: 10px 0;
}

.pagination a {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	min-width: 32px;
	height: 32px;
	padding: 0 6px;
	border: 1px solid #dee2e6;
	border-radius: 4px;
	color: #666;
	text-decoration: none;
	transition: all 0.2s;
	cursor: pointer;
}

.pagination a:hover {
	background-color: #f8f9fa;
	color: #333;
	border-color: #00a8e8;
}

.pagination a.active {
	background-color: #00a8e8;
	border-color: #00a8e8;
	color: white;
}

/* 반응형 스타일 */
@media ( max-width : 1200px) {
	.container {
		flex-direction: column;
	}
	.main-content {
		margin: 0;
	}
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
			<h2 class="page-title">주문목록/배송조회</h2>

			<div class="table-container">
				<table class="order-table">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>상품명</th>
							<th>주문현황</th>
							<th>주문날짜</th>
							<th>총 금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="order" varStatus="status">
							<tr class="${status.index < 15 ? 'active-page' : ''}">
								<td>${order.orderNo}</td>
								<td>${order.productName}</td>
								<td><span class="status ${order.orderStatus}">${order.orderStatus}</span>
								</td>
								<td><fmt:formatDate value="${order.orderDate}"
										pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatNumber value="${order.productPrice}"
										pattern="#,###" />원</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- 페이지네이션 -->
			<div class="pagination">
				<a href="?page=1" class="active">1</a>
			</div>
		</div>
	</div>

	<!-- 공통 푸터 포함 -->
	<jsp:include page="../common/footer.jsp" />

	<script>
    document.addEventListener('DOMContentLoaded', function() {
        console.log("스크립트 실행됨");
        const ITEMS_PER_PAGE = 15; // 페이지당 표시할 항목 수를 15개로 변경
        const orderRows = document.querySelectorAll('.order-table tbody tr');
        console.log("총 행 수:", orderRows.length);
        const totalPages = Math.ceil(orderRows.length / ITEMS_PER_PAGE);
        console.log("총 페이지 수:", totalPages);
        
        // 페이지네이션 초기 설정 - 바로 호출
        function updatePagination() {
            const pagination = document.querySelector('.pagination');
            pagination.innerHTML = '';
            
            for(let i = 1; i <= totalPages; i++) {
                const link = document.createElement('a');
                link.href = `?page=${i}`;
                link.textContent = i;
                if(i === 1) link.classList.add('active');
                
                // 클릭 이벤트 직접 추가
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const page = i;
                    showPage(page);
                    
                    // 모든 페이지 번호에서 active 클래스 제거
                    document.querySelectorAll('.pagination a').forEach(a => {
                        a.classList.remove('active');
                    });
                    
                    // 클릭된 페이지 번호에 active 클래스 추가
                    this.classList.add('active');
                });
                
                pagination.appendChild(link);
            }
        }
        
        // 특정 페이지의 데이터 표시
        function showPage(pageNum) {
            console.log("페이지 표시:", pageNum);
            const start = (pageNum - 1) * ITEMS_PER_PAGE;
            const end = start + ITEMS_PER_PAGE;
            
            // 모든 행 숨기기
            orderRows.forEach((row, index) => {
                row.style.display = 'none';
                row.classList.remove('active-page');
            });
            
            // 현재 페이지 행만 표시
            for(let i = start; i < Math.min(end, orderRows.length); i++) {
                orderRows[i].style.display = 'table-row';
                orderRows[i].classList.add('active-page');
                console.log("표시된 행:", i);
            }
        }
        
        // 초기화
        updatePagination();
        showPage(1);
    });
    </script>
</body>
</html>
