<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- Tailwind CDN 및 스타일 설정 -->
<script src="https://cdn.tailwindcss.com/3.4.16"></script>
<script>




tailwind.config = {
        theme: {
          extend: {
            colors: { primary: "#2ebcff", secondary: "#64748B" },
            borderRadius: {
              none: "0px",
              sm: "4px",
              DEFAULT: "8px",
              md: "12px",
              lg: "16px",
              xl: "20px",
              "2xl": "24px",
              "3xl": "32px",
              full: "9999px",
              button: "8px",
            },
          },
        },
      };
      
      
      
</script>

<!-- 배너 css -->
<style>
  .banner-key img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
  }

  .banner-key {
    position: relative;
    width: 100%;
    height: 400px;
    overflow: hidden;
  }

  .banner-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    z-index: 2;
    text-align: center;
    font-size: 48px;
    font-weight: bold;
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
  }

  .banner-text h1 {
    font-size: 48px;
    margin: 0 0 10px 0;
  }
</style>

<!-- html배너  -->
<section class="key-banner">
  <div class="banner-key">
    <img src="${pageContext.request.contextPath}/resources/images/notice/noticebanner10.png" alt="마우스배너" />
    <div class="banner-text">
      <h1>Notice</h1>
    </div>
  </div>
</section>





<main class="container mx-auto px-4 py-8">
  <div class="max-w-4xl mx-auto bg-white rounded shadow-sm overflow-hidden">
    <!-- 게시글 헤더 -->
    <div class="p-6 border-b border-gray-200">
    
    	<!-- 공지사항 제목 -->
      <h1 class="text-2xl font-bold text-gray-800 mb-4">${board.notice_title}</h1>
      
       <!-- 작성자 및 작성일 정보 -->
      <div class="flex flex-wrap items-center text-sm text-gray-500 gap-6">
        <div class="flex items-center">
          <div class="w-5 h-5 flex items-center justify-center mr-1">
            <i class="ri-user-line text-gray-400"></i>
          </div>
          <span>관리자</span>
        </div>
        <div class="flex items-center">
          <div class="w-5 h-5 flex items-center justify-center mr-1">
            <i class="ri-calendar-line text-gray-400"></i>
          </div>
          <span><fmt:formatDate value="${board.notice_date}" pattern="yyyy-MM-dd" /></span>
        </div>
      </div>
    </div>

    <!-- 게시글 본문 -->
<div class="p-6">
  <label class="block text-base text-gray-700 font-semibold mb-3">내용</label>
  <div class="w-full p-8 border border-gray-300 rounded-lg text-base leading-relaxed bg-gray-50 text-gray-800 min-h-[300px] whitespace-pre-wrap shadow-sm">
    <c:out value="${board.notice_cont}" />
  </div>
</div>

    <!-- 목록 버튼 -->
    <div class="px-6 py-4 bg-gray-50 border-t border-gray-200">
      <a href="NoticeBoardList" class="inline-flex items-center px-4 py-2 bg-gray-100 text-gray-700 border border-gray-300 rounded-button hover:bg-gray-200 transition-colors">
        <i class="ri-arrow-left-line mr-1"></i>
        목록으로
      </a>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
