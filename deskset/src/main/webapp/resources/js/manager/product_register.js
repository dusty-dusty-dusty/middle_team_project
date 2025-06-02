$(document).ready(function() {
    // 동적 페이지 로딩 상태 관리
    let pageLoaded = false;
    let loadingIndicator = $('<div class="loading-spinner text-center py-4"><div class="spinner-border text-primary" role="status"><span class="sr-only">로딩중...</span></div></div>');
    
/*    // 초기 페이지 로딩 함수
    function initPage() {
        $('#mainContent').hide();
        $('#pageContainer').prepend(loadingIndicator);
        
        // 페이지 데이터 로딩
        $.ajax({
            url: '/api/page-data',
            type: 'GET',
            success: function(response) {
                setTimeout(function() {
                    loadingIndicator.remove();
                    $('#mainContent').fadeIn(300);
                    pageLoaded = true;
                    
                    // 초기 카테고리 필드 로딩
                    var initialCategory = $('input[name="category"]:checked').val() || '키보드';
                    loadCategoryFields(initialCategory);
                }, 500); // 로딩 효과를 위한 짧은 지연
            },
            error: function(xhr, status, error) {
                loadingIndicator.html('<div class="text-danger">페이지 로딩 중 오류가 발생했습니다. 새로고침 해주세요.</div>');
                console.error('페이지 데이터 로딩 실패:', error);
            }
        });
    }
    
    // 페이지 초기화 실행
    initPage();*/
    
    // 카테고리 변경 시 관련 필드 표시/숨김 처리 (이벤트 위임)
    $(document).on('change', 'input[name="category"]', function() {
        var selectedCategory = $('input[name="category"]:checked').val();
        
        // 카테고리 관련 옵션 표시/숨김 처리
        $('.category-specific-option').hide(); // 모든 카테고리별 옵션 숨김
        $(`.${selectedCategory}-option`).show(); // 선택된 카테고리 옵션만 표시
        
        // 로딩 인디케이터 표시
        $('#categoryFields').html('<div class="text-center py-3"><div class="spinner-border spinner-border-sm text-secondary" role="status"></div> 필드 로딩중...</div>');
        
        // 동적으로 카테고리 필드 로딩
        loadCategoryFields(selectedCategory);
    });
    
    // 카테고리별 필드 로딩 함수
    function loadCategoryFields(category) {
        $.ajax({
            url: 'category-fields',
            type: 'GET',
            data: { category: category },
            success: function(response) {
                // 필드 컨테이너 비우기
                $('#categoryFields').empty();
				console.log(response);
				console.log(response.attr_name);
                // 서버에서 받은 필드 데이터로 HTML 생성
                if (response && response.length > 0) {
                    $.each(response, function(index, field) {
                        var fieldHtml = generateFieldHtml(field);
                        $('#categoryFields').append(fieldHtml);
                    });
                    
                    // 필드에 대한 이벤트 리스너 등록
                    initializeFieldEvents();
                } else {
                    $('#categoryFields').html('<p class="text-muted">이 카테고리에는 추가 필드가 없습니다.</p>');
                }
            },
            error: function(xhr, status, error) {
                $('#categoryFields').html('<div class="alert alert-danger">필드 로딩 실패. 다시 시도해주세요.</div>');
                console.error('카테고리 필드 로딩 실패:', error);
            }
        });
    }
    
    // 필드 HTML 생성 함수 - 모든 드롭다운을 텍스트 입력으로 변경
    function generateFieldHtml(field) {
        // 모든 필드 타입을 텍스트 입력 형식으로 변환
        return `
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="${field.attr_id}">${field.attr_name}</label>
                <input type="text" id="${field.attr_id}" name="${field.attr_name}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="${field.attr_name || ''}">
            </div>`;
    }
    
    // 필드 이벤트 초기화 함수
    function initializeFieldEvents() {
        // 필드별 이벤트 리스너 등록 (필요시)
    }
    
    // 파일 업로드 기능
    var dropZoneT = $('#dropZoneT');
    var dropZone = $('#dropZone');
    var dropZoneM = $('#dropZoneM');
    var fileInputT = $('#fileInputT');
    var fileInput = $('#fileInput');
    var fileInputM = $('#fileInputM');
    
    // 드래그 앤 드롭 이벤트 (이벤트 위임)
    $(document).on('dragover', '#dropZoneT', function(e) {
        e.preventDefault();
        $(this).addClass('border-blue-500');
    });
    
    $(document).on('dragleave', '#dropZoneT', function(e) {
        e.preventDefault();
        $(this).removeClass('border-blue-500');
    });
    
    $(document).on('drop', '#dropZoneT', function(e) {
        e.preventDefault();
        $(this).removeClass('border-blue-500');
        
        var files = e.originalEvent.dataTransfer.files;
        handleFilesT(files);
    });

    $(document).on('dragover', '#dropZone', function(e) {
        e.preventDefault();
        $(this).addClass('border-blue-500');
    });
    
    $(document).on('dragleave', '#dropZone', function(e) {
        e.preventDefault();
        $(this).removeClass('border-blue-500');
    });
    
    $(document).on('drop', '#dropZone', function(e) {
        e.preventDefault();
        $(this).removeClass('border-blue-500');
        
        var files = e.originalEvent.dataTransfer.files;
        handleFiles(files);
    });

    $(document).on('dragover', '#dropZoneM', function(e) {
        e.preventDefault();
        $(this).addClass('border-blue-500');
    });
    
    $(document).on('dragleave', '#dropZoneM', function(e) {
        e.preventDefault();
        $(this).removeClass('border-blue-500');
    });
    
    $(document).on('drop', '#dropZoneM', function(e) {
        e.preventDefault();
        $(this).removeClass('border-blue-500');
        
        var files = e.originalEvent.dataTransfer.files;
        handleFilesM(files);
    });
    
    // 클릭하여 파일 선택
    $(document).on('click', '#dropZoneT', function() {
        $('#fileInputT').click();
    });
    $(document).on('click', '#dropZone', function() {
        $('#fileInput').click();
    });
    $(document).on('click', '#dropZoneM', function() {
        $('#fileInputM').click();
    });
    
    $(document).on('change', '#fileInputT', function() {
        var files = this.files;
        handleFilesT(files);
    });
    $(document).on('change', '#fileInput', function() {
        var files = this.files;
        handleFiles(files);
    });
    $(document).on('change', '#fileInputM', function() {
        var files = this.files;
        handleFilesM(files);
    });
    
    // 파일 처리 함수T
    function handleFilesT(files) {
        // 로딩 인디케이터 표시
        $('#uploadStatus').html('<div class="my-2 text-blue-500">파일 처리중...</div>');
        
     	if (files.length > 1) {
        	$('#uploadStatus').html('<div class="my-2 text-red-500">이미지는 하나만 업로드 가능합니다.</div>');
       	 return;
   		}

	    const file = files[0];
	    if (validateFile(file)) {
	        $('#previewContainerT').empty(); // 기존 미리보기 제거 (선택)
	        previewFileT(file);
	        uploadFileT(file);
	    }


        // 처리 완료 메시지 표시 후 삭제
        setTimeout(function() {
            $('#uploadStatus').empty();
        }, 2000);
    }
    // 파일 처리 함수
    function handleFiles(files) {
        // 로딩 인디케이터 표시
        $('#uploadStatus').html('<div class="my-2 text-blue-500">파일 처리중...</div>');
        
     	if (files.length > 1) {
        	$('#uploadStatus').html('<div class="my-2 text-red-500">이미지는 하나만 업로드 가능합니다.</div>');
       	 return;
   		}

	    const file = files[0];
	    if (validateFile(file)) {
	        $('#previewContainer').empty(); // 기존 미리보기 제거 (선택)
	        previewFile(file);
	        uploadFile(file);
	    }


        // 처리 완료 메시지 표시 후 삭제
        setTimeout(function() {
            $('#uploadStatus').empty();
        }, 2000);
    }

    // 파일 처리 함수M
    function handleFilesM(files) {
        // 로딩 인디케이터 표시
        $('#uploadStatus').html('<div class="my-2 text-blue-500">파일 처리중...</div>');
        
		for (var i = 0; i < files.length; i++) {
            if (validateFile(files[i])) {
                previewFileM(files[i]);
                uploadFileM(files[i]);
            }
        }

        // 처리 완료 메시지 표시 후 삭제
        setTimeout(function() {
            $('#uploadStatus').empty();
        }, 2000);
    }
    
    // 파일 유효성 검사
    function validateFile(file) {
        // 파일 타입 검사
        var validTypes = ['image/jpeg', 'image/png'];
        if (validTypes.indexOf(file.type) === -1) {
            $('#uploadStatus').html('<div class="my-2 text-red-500">JPG, PNG 이미지만 업로드 가능합니다.</div>');
            return false;
        }
        
        // 파일 크기 검사 (최대 20MB)
        if (file.size > 20 * 1024 * 1024) {
            $('#uploadStatus').html('<div class="my-2 text-red-500">파일 크기는 20MB 이하여야 합니다.</div>');
            return false;
        }
        
        return true;
    }
    
    // 파일 미리보기T
    function previewFileT(file) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var preview = `
                <div class="relative inline-block mr-2 mb-2">
                    <img src="${e.target.result}" class="w-32 h-32 object-cover rounded" />
                    <button type="button" class="remove-preview absolute top-1 right-1 bg-red-500 text-white rounded-full w-6 h-6 flex items-center justify-center">×</button>
                    <div class="text-xs mt-1 text-center text-gray-500">${file.name}</div>
                </div>
            `;
            $('#previewContainerT').append(preview);
        };
        reader.readAsDataURL(file);
    }
    // 파일 미리보기
    function previewFile(file) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var preview = `
                <div class="relative inline-block mr-2 mb-2">
                    <img src="${e.target.result}" class="w-32 h-32 object-cover rounded" />
                    <button type="button" class="remove-preview absolute top-1 right-1 bg-red-500 text-white rounded-full w-6 h-6 flex items-center justify-center">×</button>
                    <div class="text-xs mt-1 text-center text-gray-500">${file.name}</div>
                </div>
            `;
            $('#previewContainer').append(preview);
        };
        reader.readAsDataURL(file);
    }
    // 파일 미리보기M
    function previewFileM(file) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var preview = `
                <div class="relative inline-block mr-2 mb-2">
                    <img src="${e.target.result}" class="w-32 h-32 object-cover rounded" />
                    <button type="button" class="remove-preview absolute top-1 right-1 bg-red-500 text-white rounded-full w-6 h-6 flex items-center justify-center">×</button>
                    <div class="text-xs mt-1 text-center text-gray-500">${file.name}</div>
                </div>
            `;
            $('#previewContainerM').append(preview);
        };
        reader.readAsDataURL(file);
    }
    
    // 미리보기 삭제 (이벤트 위임)
    $(document).on('click', '.remove-preview', function() {
        $(this).parent().remove();
    });
    
    // 파일 업로드T (AJAX)
    function uploadFileT(file) {
        var formData = new FormData();
        formData.append('file', file);
        $.ajax({
            url: '/imguploadT',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener('progress', function(evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = evt.loaded / evt.total * 100;
                        // 진행률 표시 (필요시)
                    }
                }, false);
                return xhr;
            },
            success: function(response) {
                console.log('파일 업로드 성공:', response);
                // 업로드 성공 시 hidden input에 파일 ID 추가 (필요시)
                if (response.filePath) {
                    var product_thum = $('#product_thum').val();
                    product_thum = product_thum ? product_thum + ',' + response.filePath : response.filePath;
                    $('#product_thum').val(product_thum);
                }
            },
            error: function(xhr, status, error) {
                $('#uploadStatus').html('<div class="my-2 text-red-500">파일 업로드 실패. 다시 시도해주세요.</div>');
                console.error('파일 업로드 실패:', error);
            }
        });
    }
    // 파일 업로드 (AJAX)
    function uploadFile(file) {
        var formData = new FormData();
        formData.append('file', file);
        $.ajax({
            url: '/imgupload',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener('progress', function(evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = evt.loaded / evt.total * 100;
                        // 진행률 표시 (필요시)
                    }
                }, false);
                return xhr;
            },
            success: function(response) {
                console.log('파일 업로드 성공:', response);
                // 업로드 성공 시 hidden input에 파일 ID 추가 (필요시)
                if (response.fileId) {
                    var fileIds = $('#fileIds').val();
                    fileIds = fileIds ? fileIds + ',' + response.fileId : response.fileId;
                    $('#fileIds').val(fileIds);
                }
            },
            error: function(xhr, status, error) {
                $('#uploadStatus').html('<div class="my-2 text-red-500">파일 업로드 실패. 다시 시도해주세요.</div>');
                console.error('파일 업로드 실패:', error);
            }
        });
    }
    
    // 파일 업로드M (AJAX)
    function uploadFileM(file) {
        var formData = new FormData();
        formData.append('file', file);
        formData.append('imgOrder', imgOrder);
        $.ajax({
            url: '/imgupload',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener('progress', function(evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = evt.loaded / evt.total * 100;
                        // 진행률 표시 (필요시)
                    }
                }, false);
                return xhr;
            },
            success: function(response) {
                console.log('파일 업로드 성공:', response);
                // 업로드 성공 시 hidden input에 파일 ID 추가 (필요시)
                if (response.fileId) {
                    var fileIds = $('#fileIds').val();
                    fileIds = fileIds ? fileIds + ',' + response.fileId : response.fileId;
                    $('#fileIds').val(fileIds);
                }
            },
            error: function(xhr, status, error) {
                $('#uploadStatus').html('<div class="my-2 text-red-500">파일 업로드 실패. 다시 시도해주세요.</div>');
                console.error('파일 업로드 실패:', error);
            }
        });
    }
    
    // 폼 유효성 검사 및 제출 (이벤트 위임)
    $(document).on('submit', '#productForm', function(e) {
        e.preventDefault();
        
		// 기본 폼 데이터 수집
    	var formData = new FormData();
        
        // 제출 전 로딩 인디케이터 표시
        $('#submitBtn').prop('disabled', true).html('<span class="spinner-border spinner-border-sm mr-2" role="status" aria-hidden="true"></span> 처리중...');
        
        // 서버 전송
        $.ajax({
            url: '/api/products',
            type: 'POST',
            data: formData,
            success: function(response) {
                // 성공 메시지 표시
                $('#formMessages').html('<div class="alert alert-success">상품이 성공적으로 등록되었습니다.</div>');
                
                // 리디렉션 전 잠시 대기
                setTimeout(function() {
        		    $.ajax({
				        url: "admin_product",
				        method: 'GET',
				        success: function(data) {
				            $('#main-content').html(data);
				        },
				        error: function() {
				            alert('컨텐츠를 불러오는 데 실패했습니다.');
				        }
				    });
                }, 1000);
            },
            error: function(xhr, status, error) {
                // 오류 메시지 표시
                $('#formMessages').html('<div class="alert alert-danger">상품 등록에 실패했습니다. 다시 시도해주세요.</div>');
                
                // 제출 버튼 복원
                $('#submitBtn').prop('disabled', false).html('등록하기');
                
                console.error('상품 등록 실패:', error);
            }
        });
    });
    
    // 폼 유효성 검사 추가 설정
    if ($.validator) {
        $('#productForm').validate({
            rules: {
                productName: {
                    required: true,
                    minlength: 2
                },
                price: {
                    required: true,
                    min: 0
                },
                quantity: {
                    required: true,
                    number: true,
                    min: 1
                }
            },
            messages: {
                productName: {
                    required: "상품명을 입력해주세요.",
                    minlength: "상품명은 최소 2자 이상이어야 합니다."
                },
                price: {
                    required: "가격을 입력해주세요.",
                    min: "0 이상의 값을 입력하세요."
                },
                quantity: {
                    required: "수량을 입력해주세요.",
                    number: "숫자만 입력 가능합니다.",
                    min: "최소 1개 이상의 수량이 필요합니다."
                }
            },
            errorElement: 'div',
            errorPlacement: function(error, element) {
                error.addClass('text-red-500 text-xs mt-1');
                error.insertAfter(element);
            },
            highlight: function(element) {
                $(element).addClass('border-red-500').removeClass('border-gray-300');
            },
            unhighlight: function(element) {
                $(element).removeClass('border-red-500').addClass('border-gray-300');
            }
        });
    }
    
    // 취소 버튼 클릭 이벤트 (이벤트 위임)
    $(document).on('click', '#cancelBtn', function() {
        if (confirm('작성 중인 내용이 저장되지 않습니다. 정말 취소하시겠습니까?')) {
		    $.ajax({
		        url: "admin_product",
		        method: 'GET',
		        success: function(data) {
		            $('#main-content').html(data);
		        },
		        error: function() {
		            alert('컨텐츠를 불러오는 데 실패했습니다.');
		        }
		    });
        }
    });
    
    // 숫자 입력 필드 포맷팅 (이벤트 위임)
    $(document).on('input', '.number-format', function() {
        // 숫자만 남기고 제거
        var value = $(this).val().replace(/[^0-9]/g, '');
        
        // 천 단위 콤마 추가
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        
        // 포맷된 값으로 설정
        $(this).val(value);
    });
    
    // 창 종료 전 경고
    $(window).on('beforeunload', function() {
        if (pageLoaded && formChanged()) {
            return '변경사항이 저장되지 않았습니다. 페이지를 떠나시겠습니까?';
        }
    });
    
    // 폼 변경 감지
    let formChanged = function() {
        // 폼 내 모든 입력값이 초기값과 다른지 확인하는 로직
        return $('#productForm').find('input, select, textarea').filter(function() {
            return $(this).val() !== this.defaultValue;
        }).length > 0;
    };
});