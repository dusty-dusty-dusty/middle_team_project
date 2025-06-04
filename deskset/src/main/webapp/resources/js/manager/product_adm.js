$(function(){
//--------------------카테고리 체크 박스 목록 출력-------------------
    // 카테고리 체크박스 변경 이벤트
    $(document).on('change', '.toggle-checkbox', function() {
        updateCategoryVisual($(this));
        filterProductsByCategory();
    });
    
    // 카테고리 라벨 클릭 이벤트 (체크박스 토글)
    $(document).on('click', '.adm_product_category_select', function(e) {
        e.preventDefault();
        const checkbox = $(this).find('.toggle-checkbox');
        checkbox.prop('checked', !checkbox.prop('checked'));
        updateCategoryVisual(checkbox);
        filterProductsByCategory();
    });
    
    // 카테고리 시각적 업데이트
    function updateCategoryVisual(checkbox) {
        const label = checkbox.closest('label');
        if (checkbox.prop('checked')) {
            label.removeClass('border-gray-300 text-gray-700 hover:bg-gray-100')
                 .addClass('border-primary bg-primary text-white');
        } else {
            label.removeClass('border-primary bg-primary text-white')
                 .addClass('border-gray-300 text-gray-700 hover:bg-gray-100');
        }
    }
    
    // 선택된 카테고리에 따른 상품 필터링
    function filterProductsByCategory() {
        const selectedCategories = [];
        
        // 선택된 카테고리 수집
        $('.toggle-checkbox:checked').each(function() {
            const categoryName = $(this).siblings('.label-text').text();
            selectedCategories.push(categoryName);
        });
        
        // 전체 선택 또는 선택된 카테고리가 없으면 전체 상품 표시
        if (selectedCategories.length === 0) {
            loadAllProducts();
        } else {
            loadProductsByCategories(selectedCategories);
        }
    }

    // 전체 상품 로드
    function loadAllProducts() {
        $.ajax({
            url: '/deskset/manager/admin_product_list',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                updateProductTable(data);
            },
            error: function() {
                alert('상품 목록을 불러오는 데 실패했습니다.');
            }
        });
    }
    

    // 선택된 카테고리의 상품 로드
    function loadProductsByCategories(categories) {
        $.ajax({
            url: '/deskset/manager/admin_product_filter',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({categories: categories}),
            dataType: 'json',
            success: function(data) {
                updateProductTable(data);
            },
            error: function() {
                alert('상품 필터링에 실패했습니다.');
            }
        });
    }
    
    // 상품 테이블 업데이트
    function updateProductTable(products) {
        let tableHtml = `
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">상품번호</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">상품명</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">카테고리</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">제조사</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">가격</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">관리자</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">`;
        
        if (products && products.length > 0) {
            products.forEach(function(product) {
                tableHtml += `
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">${product.product_no}</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <a href="#" class="text-sm text-primary hover:underline">${product.product_name}</a>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">${product.cate_name}</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm text-gray-500">${product.product_mfc}</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm text-gray-500">${product.product_price.toLocaleString()}원</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm text-gray-500">${product.admin_name}</div>
                        </td>
                    </tr>`;
            });
        } else {
            tableHtml += `
                <tr>
                    <td colspan="6" class="px-6 py-4 text-center text-gray-500">
                        선택된 카테고리에 해당하는 상품이 없습니다.
                    </td>
                </tr>`;
        }
        
        tableHtml += `
                </tbody>
            </table>`;
        
        $('#productListADMIN').html(tableHtml);
    }
    


/*
    // 검색 기능
    $(document).on('click', '.bg-primary', function(e) {
        if ($(this).text().trim() === '검색') {
            e.preventDefault();
            performSearch();
        }
    });
    
    // 검색 실행
    function performSearch() {
        const searchType = $('select option:selected').text();
        const searchKeyword = $('input[type="text"]').val().trim();
        
        if (!searchKeyword) {
            alert('검색어를 입력해주세요.');
            return;
        }
        
        $.ajax({
            url: '/deskset/manager/admin_product_search',
            method: 'POST',
            data: {
                searchType: searchType,
                searchKeyword: searchKeyword
            },
            dataType: 'json',
            success: function(data) {
                updateProductTable(data);
                // 검색 후 카테고리 체크박스 초기화
                $('.toggle-checkbox').prop('checked', false);
                $('.cursor-pointer')
                    .removeClass('border-primary bg-primary text-white')
                    .addClass('border-gray-300 text-gray-700 hover:bg-gray-100');
            },
            error: function() {
                alert('검색에 실패했습니다.');
            }
        });
    }
*/


















//-------------------------------상품관리-------------------------------------------------------
				//----카테고리 등록-------
	$(document).on('click', '.admin_cateregi_btn', function(e) {
		e.preventDefault(); // 링크 이동 막기
        const url = $(this).attr('href');
	    $.ajax({
	        url: url,
	        method: 'GET',
	        success: function(data) {
	            $('#main-content').html(data);
	        },
	        error: function() {
	            alert('컨텐츠를 불러오는 데 실패했습니다.');
	        }
	    });
	});


//-------------------------------카테고리 등록-------------------------------------------------------
initCategoryForm();


function initCategoryForm() {
    console.log("카테고리 폼 초기화 실행");
    
    // 속성 추가 버튼 클릭 이벤트
    $(document).on("click", "#addPropertyBtn", function() {
        console.log("속성 추가 버튼 클릭됨");
        const newProperty = `
            <div class="property-item flex items-center">
                <input type="text" name="properties[]" placeholder="속성" 
                    class="w-full border border-gray-300 rounded-button py-2 px-4 text-gray-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary">
                <button type="button" class="remove-property ml-2 text-red-500 hover:text-red-700 focus:outline-none">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                </button>
            </div>
        `;
        
        $("#propertyList").append(newProperty);
    });
    
    // 속성 삭제 버튼 클릭 이벤트
    $(document).on("click", ".remove-property", function() {
        console.log("속성 삭제 버튼 클릭됨");
        $(this).closest(".property-item").remove();
    });
    
    // PREFIX 코드 중복 검사
    $(document).on("blur", "input[name='prefixCode']", function() {
        const prefixCode = $(this).val().trim();
        if (prefixCode) {
            checkPrefixDuplicate(prefixCode, $(this));
        }
    });
    
    // 카테고리 등록 폼 제출
    $(document).on("submit", "#categoryForm", function(e) {
        e.preventDefault();
        submitCategoryForm();
    });

    // 취소 버튼 클릭 시 이전 페이지로 이동
    $(document).on("click", ".category-cancel-btn", function() {
        console.log("취소 버튼 클릭됨");
        $.ajax({
            url: '/deskset/manager/admin_product', // 상품 관리 페이지 URL로 변경해주세요
            method: 'GET',
            success: function(data) {
                $('#main-content').html(data);
            },
            error: function(error) {
                alert('상품 목록을 불러오는 데 실패했습니다.');
                console.log(error);
            }
        });
    });
}    
// PREFIX 코드 중복 검사 함수
function checkPrefixDuplicate(prefixCode, inputElement) {
    // PREFIX 코드 형식 검증
    if (!prefixCode.match(/^[A-Z]{1,2}$/)) {
        showInputError(inputElement, 'PREFIX 코드는 A~Z 대문자 1~2글자로 입력해주세요.');
        return;
    }
    
    $.ajax({
        url: '/deskset/manager/check_prefix',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({prefixCode: prefixCode}),
        success: function(response) {
            if (response.available) {
                showInputSuccess(inputElement, response.message);
            } else {
                showInputError(inputElement, response.message);
            }
        },
        error: function() {
            showInputError(inputElement, 'PREFIX 코드 확인 중 오류가 발생했습니다.');
        }
    });
}

// 카테고리 등록 폼 제출 함수
function submitCategoryForm() {
    const categoryName = $("input[name='category']").val().trim();
    const prefixCode = $("input[name='prefixCode']").val().trim();
    const properties = [];
    
    // 속성 수집
    $("input[name='properties[]']").each(function() {
        const value = $(this).val().trim();
        if (value) {
            properties.push(value);
        }
    });
    
    // 입력값 검증
    if (!categoryName) {
        alert('카테고리명을 입력해주세요.');
        $("input[name='category']").focus();
        return;
    }
    
    if (!prefixCode) {
        alert('PREFIX 코드를 입력해주세요.');
        $("input[name='prefixCode']").focus();
        return;
    }
    
    if (!prefixCode.match(/^[A-Z]{1,2}$/)) {
        alert('PREFIX 코드는 A~Z 대문자 1~2글자로 입력해주세요.');
        $("input[name='prefixCode']").focus();
        return;
    }
    
    // 등록 데이터 준비
    const categoryData = {
        category: categoryName,
        prefixCode: prefixCode,
        properties: properties
    };
    
    // 로딩 상태 표시
    const submitBtn = $("#categoryForm button[type='submit']");
    const originalText = submitBtn.text();
    submitBtn.prop('disabled', true).text('등록 중...');
    
    // 카테고리 등록 요청
    $.ajax({
        url: '/deskset/manager/category_register',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(categoryData),
        success: function(response) {
            if (response.success) {
                alert(response.message);
                // 상품 관리 페이지로 이동
                $.ajax({
                    url: '/deskset/manager/admin_product',
                    method: 'GET',
                    success: function(data) {
                        $('#main-content').html(data);
                    },
                    error: function() {
                        alert('상품 목록을 불러오는 데 실패했습니다.');
                    }
                });
            } else {
                alert(response.message);
            }
        },
        error: function(xhr) {
            let errorMessage = '카테고리 등록에 실패했습니다.';
            if (xhr.responseJSON && xhr.responseJSON.message) {
                errorMessage = xhr.responseJSON.message;
            }
            alert(errorMessage);
        },
        complete: function() {
            // 로딩 상태 해제
            submitBtn.prop('disabled', false).text(originalText);
        }
    });
}

// 입력 필드 에러 표시 함수
function showInputError(inputElement, message) {
    inputElement.removeClass('border-green-500 focus:ring-green-500')
                .addClass('border-red-500 focus:ring-red-500');
    
    // 기존 메시지 제거
    inputElement.siblings('.validation-message').remove();
    
    // 에러 메시지 추가
    const errorMsg = `<div class="validation-message text-red-500 text-sm mt-1">${message}</div>`;
    inputElement.after(errorMsg);
}

// 입력 필드 성공 표시 함수
function showInputSuccess(inputElement, message) {
    inputElement.removeClass('border-red-500 focus:ring-red-500')
                .addClass('border-green-500 focus:ring-green-500');
    
    // 기존 메시지 제거
    inputElement.siblings('.validation-message').remove();
    
    // 성공 메시지 추가
    const successMsg = `<div class="validation-message text-green-500 text-sm mt-1">${message}</div>`;
    inputElement.after(successMsg);
}





//-------------------------------상품 등록-------------------------------------------------------
			//------------등록--------------
	$(document).on('click', '.admin_proregi_btn', function(e) {
		e.preventDefault(); // 링크 이동 막기
        const url = $(this).attr('href');
	    $.ajax({
	        url: url,
	        method: 'GET',
	        success: function(data) {
	            $('#main-content').html(data);
	        },
	        error: function() {
	            alert('컨텐츠를 불러오는 데 실패했습니다.');
	        }
	    });
	});

 			//----상품ID클릭 상품 정보 수정-----------
	$(document).on('click', '.admin_modify_btn', function(e) {
		e.preventDefault(); // 링크 이동 막기
        const url = $(this).attr('href');
	    $.ajax({
	        url: url,
	        method: 'GET',
	        success: function(data) {
	            $('#main-content').html(data);
	        },
	        error: function() {
	            alert('컨텐츠를 불러오는 데 실패했습니다.');
	        }
	    });
	});
			//------ 취소 버튼 클릭 시 상품 목록 페이지로 돌아가기-----
    $(document).on('click','.admin_modify_cancel', function() {
        $.ajax({
            url: '/deskset/manager/admin_admin',
            method: 'GET',
            success: function(data) {
                $('#main-content').html(data);
            },
            error: function(error) {
                alert('관리자 목록을 불러오는 데 실패했습니다.');
				console.log(error);
            }
        });
    });









	

})
