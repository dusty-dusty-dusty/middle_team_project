$(function(){
//-------------------------------회원관리-------------------------------------------------------	
				//----회원번호 클릭 시 회원정보 열람-------
	$(document).on('click', '.admin_memcheck_btn', function(e) {
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
			//------ 확인 버튼 클릭 시 회원 목록 페이지로 돌아가기-----
    $(document).on('click','.memcheck_cancel', function() {
        $.ajax({
            url: '/deskset/manager/admin_member',
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
