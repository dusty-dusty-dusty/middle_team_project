$(function(){

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
	
	//-------------카테고리체크박스---------------------------------------	
		// 초기 상태 설정 (초기 생성된 요소용)
	$(document).on('change', '.toggle-checkbox', function () {
	  const $checkbox = $(this);
	  const $label = $checkbox.closest('label');
	
	  if ($checkbox.is(':checked')) {
	    $label.addClass('bg-blue-500 text-white border-blue-500');
	  } else {
	    $label.removeClass('bg-blue-500 text-white border-blue-500');
	  }
	});
	
	// 동적으로 생성된 체크박스도 포함해 처음 로딩 시 스타일 적용
	$(document).on('DOMNodeInserted', function () {
	  $('.toggle-checkbox').each(function () {
	    const $checkbox = $(this);
	    const $label = $checkbox.closest('label');
	
	    if ($checkbox.is(':checked')) {
	      $label.addClass('bg-blue-500 text-white border-blue-500');
	    } else {
	      $label.removeClass('bg-blue-500 text-white border-blue-500');
	    }
	  });
	});
	
/*  // 체크 시 AJAX로 데이터 요청
  $(document).on('change', '.toggle-checkbox', function () {
    syncCheckboxStyles();

    const $checkbox = $(this);
    const value = $checkbox.val();

    if ($checkbox.is(':checked')) {
      // AJAX 요청 (예: /get-data?value=user001)
      $.ajax({
        url: '/get-data',
        method: 'GET',
        data: { value: value },
        dataType: 'json',
        success: function (data) {
          // 예: data = { name: "홍길동", age: 25 }
          const html = `
            <div class="p-2 border rounded bg-gray-100" data-id="${value}">
              <p><strong>${data.name}</strong> (${data.age}세)</p>
            </div>
          `;
          $('#result').append(html);
        },
        error: function () {
          alert('데이터를 가져오지 못했습니다.');
        }
      });
    } else {
      // 체크 해제 시 해당 정보 제거
      $(`#result [data-id="${value}"]`).remove();
    }
  });

  // 초기 스타일 적용
  $(document).ready(function () {
    syncCheckboxStyles();
  });*/	

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
/*    // 폼 제출 이벤트
    $(document).on("submit", "#categoryForm", function(e) {
        e.preventDefault();
        console.log("폼 제출됨");
        
        // FormData 객체 생성하여 폼 데이터 수집
        const formData = new FormData(this);
        
        // AJAX로 서버에 데이터 전송
        $.ajax({
            url: '/deskset/manager/category/register', // 실제 카테고리 등록 URL로 변경해주세요
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                alert('카테고리가 성공적으로 등록되었습니다.');
                // 성공 후 상품 관리 페이지로 이동
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
            },
            error: function(error) {
                alert('카테고리 등록에 실패했습니다.');
                console.log(error);
            }
        });*/
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
			//------ 취소 버튼 클릭 시 상품 목록 페이지로 돌아가기-----
    $(document).on('click','.product_reg_cancel', function() {
        $.ajax({
            url: '/deskset/manager/admin_product',
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
