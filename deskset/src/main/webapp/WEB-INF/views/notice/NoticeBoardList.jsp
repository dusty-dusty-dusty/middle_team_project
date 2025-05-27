
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>







<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DeskSet - 공지사항</title>
<script src="https://cdn.tailwindcss.com/3.4.16">
</script>
<script>







tailwind.config = {
  theme: {
    extend: {
      colors: { primary: "#2ebcff", secondary: "#64748b" },
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



<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css">
<style>
:where([class^="ri-"])::before { content: "\f3c2"; }
body {
font-family: 'Noto Sans KR', sans-serif;
}

.pagination-btn {
width: 36px;
height: 36px;
display: flex;
align-items: center;
justify-content: center;
 border-radius: 9999px;
}
.pagination-btn.active {
background-color: #3b82f6;
color: white;
 font-weight: 600;
}
}
select {
appearance: none;
background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%23666666'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
background-repeat: no-repeat;
background-position: right 0.5rem center;
background-size: 1rem;
}
input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
-webkit-appearance: none;
margin: 0;
}
</style>






</head>
<body class="bg-gray-50">

<!-- 메인 콘텐츠 -->
<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
<div class="bg-white rounded-lg shadow-sm p-6">
<h1 class="text-2xl font-bold text-gray-900 mb-8">공지사항</h1>
<!-- 검색 영역 -->
<div class="flex justify-between items-center mb-6 flex-wrap gap-2">
  <form action="NoticeBoardList" method="get" class="flex flex-wrap sm:flex-nowrap gap-2 w-full">
    <!-- 셀렉트 박스 -->
    <div class="relative w-fit">
  <select name="searchCondition"
          class="appearance-none border border-gray-300 rounded px-4 py-2 pr-8 bg-white text-sm 
                 focus:ring-2 focus:ring-blue-400 focus:outline-none">
    <option value="notice_title">제목</option>
    <option value="notice_cont">내용</option>
  </select>
  <div class="pointer-events-none absolute inset-y-0 right-2 flex items-center text-gray-500">
    <i class="ri-arrow-down-s-line text-lg"></i>
  </div>
</div>

    <!-- 검색어 입력창 -->
    <input type="text" name="searchKeyword"
           class="border border-gray-300 rounded px-4 py-2 text-sm flex-1 min-w-[200px]"
           placeholder="검색어를 입력하세요">

    <!-- 검색 버튼 -->
    <button type="submit"
            class="bg-primary text-white px-4 py-2 rounded hover:bg-blue-600 transition whitespace-nowrap">
      검색
    </button>
  </form>
</div>
<!-- 게시판 테이블 -->
<div class="overflow-x-auto">
<table class="min-w-full divide-y divide-gray-200">
<thead class="bg-gray-50">
<tr>
<th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 whitespace-nowrap w-16">번호</th>
<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase whitespace-nowrap">제목</th>
<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase whitespace-nowrap">내용</th>
<th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase whitespace-nowrap w-28"">작성일</th>
</tr>
</thead>
<tbody class="bg-white divide-y divide-gray-200">
  <c:forEach items="${boardList}" var="board">
    <tr class="hover:bg-gray-50">
      <!-- 번호 -->
      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-center">
        ${board.notice_no}
      </td>
      
      <!-- 제목: 클릭 시 상세 페이지 이동 -->
      <td class="px-6 py-4 text-sm text-gray-900">
        <a href="${pageContext.request.contextPath}/notice/NoticeBoard?notice_no=${board.notice_no}"
           class="text-primary hover:underline">
          ${board.notice_title}
        </a>
      </td>
      
      <!-- 내용 -->
      <td class="px-6 py-4 text-sm text-gray-500">
        ${board.notice_cont}
      </td>
      
      <!-- 작성일 -->
      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 text-center">
        <fmt:formatDate value="${board.notice_date}" pattern="yyyy-MM-dd" />
      </td>
    </tr>
  </c:forEach>
</tbody>
</tbody>
</table>
</div>
 <!-- 페이지네이션 -->
<div class="flex justify-center mt-6">
  <ul class="flex items-center space-x-2">

    <!-- 이전 버튼 -->
    <li>
      <a href="NoticeBoardList?page=${currentPage - 1}"
         class="pagination-btn border border-gray-300 hover:bg-gray-100 text-gray-600
                ${currentPage == 1 ? 'pointer-events-none opacity-50' : ''}">
        <i class="ri-arrow-left-s-line"></i>
      </a>
    </li>

    <!-- 페이지 번호 반복 -->
    <c:forEach var="i" begin="1" end="5">
      <li>
        <a href="NoticeBoardList?page=${i}"
           class="pagination-btn border 
                  ${i == currentPage 
                    ? 'active' 
                    : 'border-gray-300 hover:bg-gray-100 text-gray-700'}">
          ${i}
        </a>
      </li>
    </c:forEach>

    <!-- 다음 버튼 -->
    <li>
      <a href="NoticeBoardList?page=${currentPage + 1}"
         class="pagination-btn border border-gray-300 hover:bg-gray-100 text-gray-600
                ${currentPage == 5 ? 'pointer-events-none opacity-50' : ''}">
        <i class="ri-arrow-right-s-line"></i>
      </a>
    </li>

  </ul>
</div>

    </div>
  </div>
</div>

</main>
<!-- 푸터 -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>