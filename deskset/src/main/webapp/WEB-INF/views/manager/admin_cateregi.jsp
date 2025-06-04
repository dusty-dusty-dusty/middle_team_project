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
						<label class="block font-medium text-gray-700 mb-2">카테고리 <span class="text-red-500">*</span></label>
					</div>
					<div class="col-span-2">
						<input type="text" name="category" placeholder="카테고리 이름" 
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary"
							required>
					</div>
					
					<!-- 카테고리 상품넘버 접두어 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">PREFIX 코드 <span class="text-red-500">*</span></label>
						<div class="text-sm text-gray-500">A~Z 1~2글자</div>
					</div>
					<div class="col-span-2">
						<input type="text" name="prefixCode" placeholder="예: A, AB, PC 등" 
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary"
							maxlength="2" style="text-transform: uppercase;" required>
						<div class="text-sm text-gray-500 mt-1">
							상품 번호 생성 시 사용되는 코드입니다. (예: A001, AB001)
						</div>
					</div>
					
					<!-- 속성 헤더 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">속성</label>
						<div class="text-sm text-gray-500">선택사항</div>
					</div>
					
					<div class="col-span-2 flex justify-between items-center">
						<div class="text-sm text-gray-500">
							카테고리에 포함될 상품의 속성을 정의합니다.
						</div>
						<button type="button" id="addPropertyBtn" 
							class="text-primary hover:text-primary/80 border border-primary rounded-full w-8 h-8 flex items-center justify-center focus:outline-none focus:ring-2 focus:ring-primary"
							title="속성 추가">
							<span class="text-lg font-bold">+</span>
						</button>
					</div>
					
					<!-- 속성 목록 영역 -->
					<div class="col-span-1"></div>
					<div id="propertyList" class="col-span-2 space-y-3">
						<div class="property-item flex items-center">
							<input type="text" name="properties[]" placeholder="예: 색상, 크기, 용량 등" 
								class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
							<button type="button" class="remove-property ml-2 text-red-500 hover:text-red-700 focus:outline-none"
								title="속성 삭제">
								<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
									<path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
								</svg>
							</button>
						</div>
					</div>
				</div>
				
				<!-- 안내 메시지 -->
				<div class="bg-blue-50 border border-blue-200 rounded-lg p-4">
					<div class="flex">
						<div class="flex-shrink-0">
							<svg class="h-5 w-5 text-blue-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
								<path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd" />
							</svg>
						</div>
						<div class="ml-3">
							<h3 class="text-sm font-medium text-blue-800">등록 안내</h3>
							<div class="mt-2 text-sm text-blue-700">
								<ul class="list-disc pl-5 space-y-1">
									<li>카테고리명과 PREFIX 코드는 필수 입력 항목입니다.</li>
									<li>PREFIX 코드는 상품 번호 생성 시 사용되며, 중복될 수 없습니다.</li>
									<li>속성은 선택사항으로, 필요에 따라 추가하거나 삭제할 수 있습니다.</li>
									<li>등록된 카테고리는 상품 등록 시 선택할 수 있습니다.</li>
								</ul>
							</div>
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

