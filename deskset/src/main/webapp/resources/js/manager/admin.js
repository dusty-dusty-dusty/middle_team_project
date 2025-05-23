$(function(){
//---------------------------사이드바 ajax-----------------------------------------------------
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
	// 페이지 내 관리자 등록 버튼 이벤트 초기 바인딩
	/*bindAdminEvents();
	
	// 이벤트 바인딩 함수 - 동적으로 로드된 컨텐츠에 이벤트 추가
	function bindAdminEvents() {
		// 관리자 등록 버튼 클릭 이벤트
		$('.admin-register-btn').on('click', function(e) {
			e.preventDefault(); // 링크 이동 막기
	        // 링크에서 파일 경로 가져오기
	        const url = $(this).attr('href');
			
		    $.ajax({
		        url: url,
		        method: 'GET',
		        success: function(data) {
		            $('#main-content').html(data);
		            // 페이지 로드 후 이벤트 재바인딩
		            bindAdminEvents();
		        },
		        error: function() {
		            alert('컨텐츠를 불러오는 데 실패했습니다.');
		        }
		    });
		});
	}
	*/	