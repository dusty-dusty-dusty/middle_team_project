<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

	
<!-- 메인 컨텐츠 -->
<main class="flex-1 p-8 overflow-auto">
	<div class="max-w-7xl mx-auto">
		<!-- 헤더 -->
		<header class="mb-8">
			<h1 class="text-2xl font-bold text-gray-800 mb-2">관리자 등록</h1>
			<div class="h-0.5 bg-gray-200 w-full"></div>
		</header>
		
		<!-- 관리자 등록 폼 -->
		<section class="bg-white rounded shadow-sm p-6">
			<form class="space-y-6">
				<div class="grid grid-cols-1 gap-6 md:grid-cols-3">
					<!-- 관리자명 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">관리자명</label>
					</div>
					<div class="col-span-2">
						<input type="text" placeholder="관리자명을 입력하세요" 
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
					</div>
					
					<!-- 관리자 ID -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">관리자 ID</label>
					</div>
					<div class="col-span-2 flex gap-2">
						<input type="text" placeholder="아이디를 입력하세요" 
							class="flex-1 border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
						<button type="button" 
							class="bg-gray-200 text-gray-700 py-2 px-4 rounded-button hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 whitespace-nowrap">
							중복확인
						</button>
					</div>
					
					<!-- 비밀번호 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">비밀번호</label>
					</div>
					<div class="col-span-2">
						<input type="password" placeholder="비밀번호를 입력하세요" 
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">비밀번호 확인</label>
					</div>
					<div class="col-span-2">
						<input type="password" placeholder="비밀번호를 다시 입력하세요" 
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
					</div>
					
					<!-- 관리자 이메일 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">관리자 이메일</label>
					</div>
					<div class="col-span-2">
						<input type="email" placeholder="이메일을 입력하세요" 
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
					</div>
					
					<!-- 전화번호 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">전화번호</label>
					</div>
					<div class="col-span-2">
						<input type="tel" placeholder="전화번호를 입력하세요" 
							class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
					</div>
					
					<!-- 관리자 사용 여부 -->
					<div class="col-span-1">
						<label class="block font-medium text-gray-700 mb-2">관리자 사용 여부</label>
					</div>
					<div class="col-span-2">
						<select class="w-40 border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
							<option value="Y" selected>사용</option>
							<option value="N">사용안함</option>
						</select>
					</div>
				</div>
				
				<!-- 버튼 영역 -->
				<div class="flex justify-end mt-8 pt-4 border-t border-gray-200">
					<button type="button"
						class="admin_reg_cancel mr-2 bg-gray-200 text-gray-700 py-2 px-6 rounded-button hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2">
						취소
					</button>
					<button type="submit"
						class="bg-primary text-white py-2 px-6 rounded-button hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2">
						등록
					</button>
				</div>
			</form>
		</section>
	</div>
</main>
