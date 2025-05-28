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
                    
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="productCode">상품번호</label>
                        <input type="text" id="productCode" name="productCode" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="상품번호를 입력하세요">
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
                
                <!-- 이미지 업로드 영역 -->
                <div class="border-t border-gray-200 pt-4">
                    <h2 class="text-lg font-semibold mb-4">상품 이미지</h2>
                    
                    <div id="dropZone" class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center cursor-pointer hover:border-blue-400 transition-all">
                        <div class="text-gray-500">
                            <svg class="mx-auto h-12 w-12" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                            </svg>
                            <p class="mt-1">이미지를 드래그하여 업로드하거나 클릭하여 선택하세요</p>
                            <p class="text-xs text-gray-400 mt-1">JPG, PNG 형식 (최대 5MB)</p>
                        </div>
                    </div>
                    <input type="file" id="fileInput" class="hidden" accept="image/jpeg, image/png" multiple>
                    <input type="hidden" id="fileIds" name="fileIds">
                    
                    <div id="uploadStatus"></div>
                    
                    <div id="previewContainer" class="mt-4 flex flex-wrap">
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















<%-- 
	<!-- 상품등록 폼 -->
<div class="container mx-auto py-6">
    <h1 class="text-2xl font-bold mb-6">상품등록</h1>
    
    <form id="productForm" class="bg-white shadow-md rounded-lg overflow-hidden">
        <!-- 담당 관리자 -->
        <div class="form-section flex">
            <div class="form-label">관리자NO.</div>
            <div class="form-input">
                <input type="text" id="proregi_admin_no" name="proregi_admin_no" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="ADM001" disabled>
            </div>
        </div>
        <!-- 카테고리 -->
        <div class="form-section flex">
            <div class="form-label">카테고리</div>
            <div class="form-input flex items-center space-x-4">
	            <c:forEach items="${registProductCategory}" var="category">
	                <div class="flex items-center">
	                    <input type="radio" id="${category.cate_name}" name="category" value="${category.cate_name}" class="mr-2">
	                    <label for="product_r_c">${category.cate_name}</label>
	                </div>
				</c:forEach>
            </div>
        </div>
        
        <!-- 상품명 -->
        <div class="form-section flex">
            <div class="form-label">상품명</div>
            <div class="form-input">
                <input type="text" id="productName" name="productName" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="K480 무선 키보드 기계식">
            </div>
        </div>
        
        <!-- 가격 -->
        <div class="form-section flex">
            <div class="form-label">가격</div>
            <div class="form-input">
                <input type="text" id="price" name="price" class="w-full border border-gray-300 rounded px-3 py-2 number-format" placeholder="89,000원">
            </div>
        </div>
        
        <!-- 수량 -->
        <div class="form-section flex">
            <div class="form-label">수량</div>
            <div class="form-input">
                <input type="number" id="quantity" name="quantity" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="99">
            </div>
        </div>

        <!-- 속성 1 -->
        <div class="form-section flex">
            <div class="form-label">속성 1 : 동작 원리</div>
            <div class="form-input">
                <input type="text" id="mechanism" name="mechanism" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="기계식, 멤브레인, 무접점 등">
            </div>
        </div>
        
        <!-- 속성 2 -->
        <div class="form-section flex">
            <div class="form-label">속성 2 : 브랜드</div>
            <div class="form-input">
                <input type="text" id="brand" name="brand" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="로지텍, 앱코, 삼성전자, 레오폴드 등">
            </div>
        </div>
        
        <!-- 속성 3 -->
        <div class="form-section flex">
            <div class="form-label">속성 3 : 스위치</div>
            <div class="form-input">
                <input type="text" id="switch" name="switch" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="청축, 갈축, 적축, 흑축, 은축 등">
            </div>
        </div>
        
        <!-- 속성 4 -->
        <div class="form-section flex">
            <div class="form-label">속성 4 : LED 여부</div>
            <div class="form-input">
                <input type="text" id="ledType" name="ledType" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="RGB, 단색, 없음 등">
            </div>
        </div>
        
        <!-- 속성 5 -->
        <div class="form-section flex">
            <div class="form-label">속성 5 : 소재</div>
            <div class="form-input">
                <input type="text" id="material" name="material" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="플라스틱, 알루미늄, 나무 등">
            </div>
        </div>
        
        <!-- 속성 6 -->
        <div class="form-section flex">
            <div class="form-label">속성 6 : 컬러</div>
            <div class="form-input">
                <input type="text" id="color" name="color" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="블랙, 화이트, 그레이 등">
            </div>
        </div>
        
        <!-- 속성 7 -->
        <div class="form-section flex">
            <div class="form-label">속성 7 : 유선/무선</div>
            <div class="form-input">
                <input type="text" id="connectionType" name="connectionType" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="유선, 무선, 블루투스 등">
            </div>
        </div>
        
        <!-- 상세이미지 -->
        <div class="form-section flex">
            <div class="form-label">상세이미지</div>
            <div class="form-input">
                <div class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center">
                    <div id="dropZone" class="cursor-pointer">
                        <div class="mb-2">
                            <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48">
                                <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                        </div>
                        <p class="text-gray-500">파일을 드래그하여 업로드하세요.</p>
                        <p class="text-gray-500 text-sm">JPG, PNG 이미지만 업로드 가능</p>
                        <p class="text-gray-500 text-sm">권장 사이즈: 800 x 1200px</p>
                    </div>
                    <input id="fileInput" type="file" class="hidden" accept="image/*" multiple>
                </div>
                <div id="previewContainer" class="mt-4 grid grid-cols-3 gap-2"></div>
                <div id="uploadStatus" class="mt-2"></div>
            </div>
        </div>
        
        <!-- 태그 -->
        <div class="form-section flex">
            <div class="form-label">태그</div>
            <div class="form-input">
                <input type="text" id="shortKeywords" name="shortKeywords" class="w-full border border-gray-300 rounded px-3 py-2" placeholder="#할인행사 #PC방납품 #인기제품">
                <div class="text-sm text-gray-500 mt-1">* 한 최대 15개까지 설정 가능합니다.</div>
            </div>
        </div>
        
        <!-- 메시지 영역 -->
        <div id="formMessages" class="px-6"></div>
        
        <!-- 버튼 섹션 -->
        <div class="py-4 px-6 flex justify-end space-x-4">
            <button type="button" id="cancelBtn" class="px-4 py-2 bg-gray-300 text-gray-700 rounded">취소</button>
            <button type="submit" id="submitBtn" class="px-4 py-2 bg-blue-600 text-white rounded">등록하기</button>
        </div>
    </form>
</div>

 --%>


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