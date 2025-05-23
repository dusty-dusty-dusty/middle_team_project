<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 메인 컨텐츠 -->
<main class="flex-1 p-8 overflow-auto">
	<div class="max-w-7xl mx-auto">
		<!-- 헤더 -->
		<header class="mb-8">
			<h1 class="text-2xl font-bold text-gray-800 mb-2">카테고리 등록</h1>
			<div class="h-0.5 bg-gray-200 w-full"></div>
		</header>
		
		<!-- 카테고리 등록 폼 -->
		<section class="bg-white rounded shadow-sm p-6">
			<form id="categoryForm" class="space-y-6">
				<div class="grid grid-cols-1 gap-6 md:grid-cols-3">
					<!-- 카테고리명 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">카테고리</label>
					</div>
					<div class="col-span-2">
						<input type="text" name="category" placeholder="카테고리 이름" 
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
					</div>
					<!-- 카테고리 상품넘버 접두어 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">PREFIX 코드</label>
					</div>
					<div class="col-span-2">
						<input type="text" name="category" placeholder="A~Z 1~2글자" 
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
					</div>
					
					<!-- 속성 헤더 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">속성</label>
					</div>
					
					<div class="col-span-2 flex justify-between items-center">
						<div class="flex-grow"></div>
						<button type="button" id="addPropertyBtn" class="text-primary hover:text-primary/80 border border-primary rounded-full w-6 h-6 flex items-center justify-center focus:outline-none focus:ring-2 focus:ring-primary">
							<span class="text-sm font-bold">+</span>
						</button>
					</div>
					
					<!-- 속성 목록 영역 -->
					<div class="col-span-1"></div>
					<div id="propertyList" class="col-span-2 space-y-3">
						<div class="property-item flex items-center">
							<input type="text" name="properties[]" placeholder="속성" 
								class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
							<button type="button" class="remove-property ml-2 text-red-500 hover:text-red-700 focus:outline-none">
								<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
									<path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
								</svg>
							</button>
						</div>
					</div>
				</div>
				
				<!-- 버튼 영역 -->
				<div class="flex justify-end mt-8 pt-4 border-t border-gray-200">
					<button type="button" class="category-cancel-btn mr-2 bg-gray-200 text-gray-700 py-2 px-6 rounded-button hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2">
						취소
					</button>
					<button type="submit" class="bg-primary text-white py-2 px-6 rounded-button hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2">
						등록
					</button>
				</div>
			</form>
		</section>
	</div>
</main>