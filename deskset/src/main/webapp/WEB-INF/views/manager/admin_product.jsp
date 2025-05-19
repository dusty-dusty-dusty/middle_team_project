<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<!-- 메인 컨텐츠 -->
<main class="flex-1 p-8 overflow-auto">
	<div class="max-w-7xl mx-auto">
		<!-- 헤더 -->
		<header class="mb-8">
			<h1 class="text-2xl font-bold text-gray-800 mb-2">상품 관리</h1>
			<div class="h-0.5 bg-gray-200 w-full"></div>
		</header>
		<!-- 검색 섹션 -->
		<section class="bg-white rounded shadow-sm p-6 mb-8">
			<h2 class="text-lg font-semibold mb-4">카테고리</h2>
			<form action='' method=''>
				<label><input type='radio' name='' value='' />키보드</label>
				<label><input type='radio' name='' value='' />마우스</label>
				<label><input type='radio' name='' value='' />모니터</label>
			</form>
			<br/>
			<h2 class="text-lg font-semibold mb-4">상품 검색</h2>
			<div class="flex flex-wrap items-center gap-4">
				<div class="relative">
					<select
						class="border border-gray-300 rounded-button text-gray-700 py-2 pl-4 pr-10 bg-white focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
						<option>상품명</option>
						<option>제조사</option>
						<option>상품번호</option>
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
				<h2 class="text-lg font-semibold">상품 목록</h2>
				<button
					class="bg-primary text-white py-2 px-6 rounded-button hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2 whitespace-nowrap">
					등록</button>
			</div>
			<div class="overflow-x-auto">
				<table class="min-w-full divide-y divide-gray-200">
					<thead class="bg-gray-50">
						<tr>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								삼풍명</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								카테고리</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								제조사</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								상품번호</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								가격</th>
							<th scope="col"
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								관리자</th>
						</tr>
					</thead>
					<tbody class="bg-white divide-y divide-gray-200">
						<tr>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">김민준</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">admin_kim</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><a href="#"
								class="text-sm text-primary hover:underline">00000001</a></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">kim.mj@example.com</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">010-1234-5678</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">2025-05-07</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
									활성 </span></td>
						</tr>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">김민준</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">admin_kim</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><a href="#"
								class="text-sm text-primary hover:underline">00000001</a></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">kim.mj@example.com</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">010-1234-5678</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">2025-05-07</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
									활성 </span></td>
						</tr>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">김민준</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">admin_kim</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><a href="#"
								class="text-sm text-primary hover:underline">00000001</a></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">kim.mj@example.com</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">010-1234-5678</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">2025-05-07</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
									활성 </span></td>
						</tr>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">김민준</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm font-medium text-gray-900">admin_kim</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap"><a href="#"
								class="text-sm text-primary hover:underline">00000001</a></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">kim.mj@example.com</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">010-1234-5678</div>
							</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<div class="text-sm text-gray-500">2025-05-07</div>
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
