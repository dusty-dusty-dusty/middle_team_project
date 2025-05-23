<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--------------- 사이드바 --------------------------->
<aside class="w-64 bg-white shadow-md h-full flex-shrink-0">
			<div class="p-4 border-b flex items-center">
				<div
					class="w-10 h-10 bg-primary rounded-full flex items-center justify-center text-white mr-3">
					<i class="ri-admin-fill ri-lg"></i>
				</div>
				<h1 class="text-xl font-['Pacifico'] text-gray-800">logo</h1>
			</div>
			<nav class="py-4">
				<ul>
					<li><a href="${pageContext.request.contextPath}/manager/admin_admin"
						class="sidebar-menu-item active flex items-center px-4 py-3 text-primary">
							<div class="w-6 h-6 flex items-center justify-center mr-3">
								<i class="ri-user-settings-line"></i>
							</div> <span>관리자관리</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/manager/admin_member"
						class="sidebar-menu-item flex items-center px-4 py-3 text-gray-600 hover:text-primary">
							<div class="w-6 h-6 flex items-center justify-center mr-3">
								<i class="ri-user-3-line"></i>
							</div> <span>회원관리</span>
					</a></li>
<!-- 					<li><a href="#"
						class="sidebar-menu-item flex items-center px-4 py-3 text-gray-600 hover:text-primary">
							<div class="w-6 h-6 flex items-center justify-center mr-3">
								<i class="ri-dashboard-line"></i>
							</div> <span>메인관리</span>
					</a></li> -->
					<li><a href="${pageContext.request.contextPath}/manager/admin_product"
						class="sidebar-menu-item flex items-center px-4 py-3 text-gray-600 hover:text-primary">
							<div class="w-6 h-6 flex items-center justify-center mr-3">
								<i class="ri-shopping-bag-line"></i>
							</div> <span>상품관리</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/manager/admin_notice"
						class="sidebar-menu-item flex items-center px-4 py-3 text-gray-600 hover:text-primary">
							<div class="w-6 h-6 flex items-center justify-center mr-3">
								<i class="ri-file-list-line"></i>
							</div> <span>게시판관리</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/manager/admin_order"
						class="sidebar-menu-item flex items-center px-4 py-3 text-gray-600 hover:text-primary">
							<div class="w-6 h-6 flex items-center justify-center mr-3">
								<i class="ri-file-list-line"></i>
							</div> <span>주문관리</span>
					</a></li>
				</ul>
			</nav>
		</aside>