<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!---------------------- Select2 CSS ------------------------------->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/@ttskch/select2-bootstrap4-theme@x.x.x/dist/select2-bootstrap4.min.css" rel="stylesheet" />
<!----------------------- Select2 JS -------------------------------->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

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
		
		<!------------------------- 사이드바 ---------------------------->
		<jsp:include page="admin_sidebar.jsp" />
		
		<!------------------------------- 메인 컨텐츠 ------------------------->
	    <div id="main-content" class="flex-1 p-6">
		       	 <!-- 기본 콘텐츠 불러오기 -->

	    </div>
	</div>
	
	<!--------------------- 풋터 -------------------------->
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>

</html>