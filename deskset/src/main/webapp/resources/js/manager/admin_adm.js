$(function(){

//----------------------관리자 관리-------------------------------------
			//------------등록--------------
	$(document).on('click', '.admin-register-btn', function(e) {
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
	

			//------ 취소 버튼 클릭 시 관리자 목록 페이지로 돌아가기-----
    $(document).on('click','.admin_reg_cancel', function() {
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
 			//----관리자ID클릭 관리자 정보 수정-----------
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
			//------ 취소 버튼 클릭 시 관리자 목록 페이지로 돌아가기-----
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
});		