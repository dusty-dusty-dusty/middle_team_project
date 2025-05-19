$(function(){
	
	$('.sidebar-menu-item').on('click', function(e) {
		e.preventDefault(); // 링크 이동 막기
        // 링크에서 파일 경로 가져오기
        const url = $(this).attr('href');
		
		// active 클래스 변경
        $('.sidebar-menu-item').removeClass('active text-primary');
        $('.sidebar-menu-item').addClass('hover:text-primary');
        
		$(this).removeClass('text-gray-600');
		$(this).addClass('active text-primary');

/*		        // 본문 영역에 ajax로 로드
		        $('#main-content').load(url);*/

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

})