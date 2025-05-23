<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메인 컨텐츠 -->
<main class="flex-1 p-8 overflow-auto">
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
                <div class="flex items-center">
                    <input type="radio" id="keyboard" name="category" value="키보드" class="mr-2" checked>
                    <label for="keyboard">키보드</label>
                </div>
                <div class="flex items-center">
                    <input type="radio" id="monitor" name="category" value="모니터" class="mr-2">
                    <label for="monitor">모니터</label>
                </div>
                <div class="flex items-center">
                    <input type="radio" id="mouse" name="category" value="마우스" class="mr-2">
                    <label for="mouse">마우스</label>
                </div>
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