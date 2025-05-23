<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<!-- 메인 컨텐츠 -->
<main class="flex-1 p-8 overflow-auto">
	<div class="max-w-7xl mx-auto">
		<!-- 헤더 -->
		<header class="mb-8">
			<h1 class="text-2xl font-bold text-gray-800 mb-2">관리자</h1>
			<div class="h-0.5 bg-gray-200 w-full"></div>
		</header>
		<!-- 검색 섹션 -->
		<section class="bg-white rounded shadow-sm p-6 mb-8">
			<h2 class="text-lg font-medium mb-4">관리자 검색</h2>
			<div class="flex flex-wrap items-center gap-4">
				<div class="relative">
					<select
						class="border border-gray-300 rounded-button text-gray-700 py-2 pl-4 pr-10 bg-white focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
						<option>관리자명</option>
						<option>관리자ID</option>
						<option>상태</option>
					</select>
				</div>
				<div class="flex-1 min-w-[200px]">
					<div class="relative">
						<input type="text" placeholder="검색어를 입력하세요"
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
					</div>
				</div>
				<button
					class="bg-primary text-white py-2 px-6 rounded-button hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2 whitespace-nowrap">
					검색</button>
			</div>
		</section>
		<!-- 관리자 목록 -->
		<section class="bg-white rounded shadow-sm p-6">
			<div class="flex justify-between items-center mb-6">
				<h2 class="text-lg font-medium">관리자 목록</h2>
				<a 
				href='${pageContext.request.contextPath}/manager/admin_register'
				class="admin-register-btn bg-primary text-white py-2 px-6 rounded-button hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2 whitespace-nowrap">
					등록</a>
			</div>
			<div class="overflow-x-auto">
				<table class="min-w-full divide-y divide-gray-200">
					<thead class="bg-gray-50">
						<tr>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								관리자명</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								관리자ID</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								관리자이메일</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								관리자연락처</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								상태</th>
						</tr>
					</thead>
					<tbody class="bg-white divide-y divide-gray-200">
						<tr>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">김민준</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><a href="${pageContext.request.contextPath}/manager/admin_modify"
								class="admin_modify_btn text-sm text-primary hover:underline">admin_kim</a></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">kim.mj@example.com</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">010-1234-5678</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
									활성 </span></td>
						</tr>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">이서연</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><a href="#"
								class="text-sm text-primary hover:underline">admin_lee</a></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">lee.sy@example.com</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">010-2345-6789</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
									활성 </span></td>
						</tr>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">박지훈</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><a href="#"
								class="text-sm text-primary hover:underline">admin_park</a></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">park.jh@example.com</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">010-3456-7890</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
									대기 </span></td>
						</tr>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">최수아</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><a href="#"
								class="text-sm text-primary hover:underline">admin_choi</a></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">choi.sa@example.com</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">010-4567-8901</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">
									비활성 </span></td>
						</tr>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">정도윤</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><a href="#"
								class="text-sm text-primary hover:underline">admin_jung</a></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">jung.dy@example.com</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">010-5678-9012</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
									활성 </span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>
	</div>
</main>