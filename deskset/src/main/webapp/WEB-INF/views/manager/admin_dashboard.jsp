<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<!----------------------- JQuery ----------------------------->
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src='/deskset/resources/js/manager/admin.js' type="text/javascript"></script>
<script src='/deskset/resources/js/manager/admin_adm.js' type="text/javascript"></script>
<script src='/deskset/resources/js/manager/member_adm.js' type="text/javascript"></script>
<script src='/deskset/resources/js/manager/product_adm.js' type="text/javascript"></script>
<script src='/deskset/resources/js/manager/product_register.js' type="text/javascript"></script>
<!----------------------- tailwindcss ----------------------------->
<script src="https://cdn.tailwindcss.com/3.4.16"></script>
<script>tailwind.config={theme:{extend:{colors:{primary:'#2dbbfe',secondary:'#2dbbfe'},borderRadius:{'none':'0px','sm':'4px',DEFAULT:'8px','md':'12px','lg':'16px','xl':'20px','2xl':'24px','3xl':'32px','full':'9999px','button':'8px'}}}}</script>
<!----------------------- remixicon ----------------------------->
<link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css" rel="stylesheet">
<!----------------------- Chart JS -------------------------------->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>


<style>
	:where([class^="ri-"])::before {
		content: "\f3c2";
	}
	
	.sidebar-menu-item:hover {
		background-color: #e1eff5;
	}
	
	.sidebar-menu-item.active {
		background-color: #e1eff5;
		border-left: 3px solid #2dbbfe;
	}
	
	select {
		appearance: none;
		background-image:
			url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%236b7280'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
		background-position: right 0.5rem center;
		background-repeat: no-repeat;
		background-size: 1.5em 1.5em;
	}
	
	input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
		{
		-webkit-appearance: none;
		margin: 0;
	}
	
	table tbody tr:hover {
		background-color: #e1eff5;
	}
	.logo img {
	    height: 215px;
	    width: auto;
	    display: block;
	  }
	.headerJSP {
	  background-color: #d9d9d9;
	  }

</style>

<!-- 확인작업 -->

</head>

<body class="bg-gray-50">
 	<!-------------------- 헤더 ------------------------------->
 	<header>
		<jsp:include page="admin_header.jsp" />
	</header>

	<div class="flex min-h-[calc(100vh-120px)]">
	<canvas id="myChart" width="400" height="200"></canvas>
	</div>
	
	<!--------------------- 풋터 -------------------------->
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>
<script>
    // JSTL로 전달받은 데이터 출력
    const labels = [<c:forEach var="label" items="${labels}">"${label}",</c:forEach>];
    const data = [<c:forEach var="value" items="${values}">${value},</c:forEach>];
 
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'bar', // bar, line, pie, doughnut, etc.
        data: {
            labels: labels,
            datasets: [{
                label: '월별 통계',
                data: data,
                backgroundColor: 'rgba(54, 162, 235, 0.5)', // 막대 색상
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</html>