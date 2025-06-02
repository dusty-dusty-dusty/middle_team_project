<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 메인 컨텐츠 -->
<main class="flex-1 p-8 overflow-auto">
    <div class="container mx-auto p-4" id="pageContainer">
        <div id="mainContent" class="bg-white p-6 rounded-lg shadow-md">
            <h1 class="text-2xl font-bold mb-6 text-center">상품 등록</h1>
            
            <div id="formMessages"></div>

            <form id="productForm" class="space-y-6">
                <!-- 카테고리 선택 -->
                <div class="mb-6">
                    <label class="block text-gray-700 text-sm font-bold mb-3">카테고리</label>
                    <div class="flex flex-wrap space-x-4">
                        <c:forEach items="${registProductCategory}" var="category">
                            <div class="flex items-center mb-2">
                                <input type="radio" id="category_${category.cate_name}" name="category" value="${category.cate_name}" class="mr-2" ${category.cate_name eq '키보드' ? 'checked' : ''}>
                                <label for="category_${category.cate_name}" class="text-gray-700">${category.cate_name}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                
                <!-- 기본 정보 (모든 카테고리 공통) -->
                <div class="border-t border-gray-200 pt-4">
                    <h2 class="text-lg font-semibold mb-4">기본 정보</h2>
                    
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="productName">상품명</label>
                        <input type="text" id="productName" name="productName" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="상품명을 입력하세요">
                    </div>
                    
                    <div class="grid grid-cols-2 gap-4">
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="price">가격</label>
                            <input type="text" id="price" name="price" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline number-format" placeholder="가격을 입력하세요">
                        </div>
                        
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="quantity">수량</label>
                            <input type="number" id="quantity" name="quantity" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="수량을 입력하세요" min="1">
                        </div>
                    </div>
                    
                    <!-- 브랜드 선택 (커스텀 셀렉트 박스) -->
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="brandInput">브랜드</label>
                        <div class="custom-select-container relative">
                            <input type="text" id="brandInput" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="브랜드명을 입력하거나 선택하세요">
                            <input type="hidden" id="brand" name="brand">
                            <div class="custom-select-dropdown absolute w-full bg-white mt-1 border border-gray-300 rounded shadow-lg z-10 max-h-60 overflow-y-auto hidden">
                                <!-- 브랜드 옵션은 JavaScript로 동적 로드 -->
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 카테고리별 추가 필드 (동적 로드) -->
                <div id="categoryFields" class="border-t border-gray-200 pt-4">
                    <!-- 여기에 카테고리별 필드가 동적으로 로드됩니다 -->
                </div>
                
                <!-- 상품 썸네일 이미지 업로드 영역 -->
                <div class="border-t border-gray-200 pt-4">
                    <h2 class="text-lg font-semibold mb-4">상품 썸네일 이미지</h2>
                    
                    <div id="dropZoneT" class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center cursor-pointer hover:border-blue-400 transition-all">
                        <div class="text-gray-500">
                            <svg class="mx-auto h-12 w-12" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                            </svg>
                            <p class="mt-1">이미지를 드래그하여 업로드하거나 클릭하여 선택하세요</p>
                            <p class="text-xs text-gray-400 mt-1">JPG, PNG 형식 (최대 20MB)</p>
                        </div>
                    </div>
                    <input type="file" id="fileInputT" class="hidden" accept="image/jpeg, image/png" >
                    <input type="hidden" id="product_thum" name="product_thum">
                    
                    <div id="uploadStatus"></div>
                    
                    <div id="previewContainerT" class="mt-4 flex flex-wrap">
                        <!-- 이미지 미리보기가 여기에 표시됩니다 -->
                    </div>
                </div>
                
                <!-- 상품 이미지 업로드 영역 -->
                <div class="border-t border-gray-200 pt-4">
                    <h2 class="text-lg font-semibold mb-4">상품 이미지</h2>
                    
                    <div id="dropZone" class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center cursor-pointer hover:border-blue-400 transition-all">
                        <div class="text-gray-500">
                            <svg class="mx-auto h-12 w-12" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                            </svg>
                            <p class="mt-1">이미지를 드래그하여 업로드하거나 클릭하여 선택하세요</p>
                            <p class="text-xs text-gray-400 mt-1">JPG, PNG 형식 (최대 20MB)</p>
                        </div>
                    </div>
                    <input type="file" id="fileInput" class="hidden" accept="image/jpeg, image/png" >
                    <input type="hidden" id="product_image" name="product_image">
                    
                    <div id="uploadStatus"></div>
                    
                    <div id="previewContainer" class="mt-4 flex flex-wrap">
                        <!-- 이미지 미리보기가 여기에 표시됩니다 -->
                    </div>
                </div>
                
                <!-- 상품상세 이미지 업로드 영역 -->
                <div class="border-t border-gray-200 pt-4">
                    <h2 class="text-lg font-semibold mb-4">상품 상세정보 이미지</h2>
                    
                    <div id="dropZoneM" class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center cursor-pointer hover:border-blue-400 transition-all">
                        <div class="text-gray-500">
                            <svg class="mx-auto h-12 w-12" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                            </svg>
                            <p class="mt-1">이미지를 드래그하여 업로드하거나 클릭하여 선택하세요</p>
                            <p class="text-xs text-gray-400 mt-1">JPG, PNG 형식 (최대 20MB)</p>
                        </div>
                    </div>
                    <input type="file" id="fileInputM" class="hidden" accept="image/jpeg, image/png" multiple>
                    <input type="hidden" id="img_path" name="img_path">
                    
                    <div id="uploadStatus"></div>
                    
                    <div id="previewContainerM" class="mt-4 flex flex-wrap">
                        <!-- 이미지 미리보기가 여기에 표시됩니다 -->
                    </div>
                </div>
                
                <!-- 제출 버튼 영역 -->
                <div class="border-t border-gray-200 pt-4 flex justify-end space-x-2">
                    <button type="button" id="cancelBtn" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        취소하기
                    </button>
                    <button type="submit" id="submitBtn" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        등록하기
                    </button>
                </div>
            </form>
        </div>
    </div>

</main>

<style>
.form-section {
    background-color: #f5f5f5;
    margin-bottom: 2px;
}
.form-label {
    width: 150px;
    padding: 10px;
    background-color: #e5e5e5;
    display: flex;
    align-items: center;
}
.form-input {
    flex: 1;
    padding: 10px;
}
.error {
    color: #e53e3e;
    font-size: 14px;
    margin-top: 4px;
}
</style>