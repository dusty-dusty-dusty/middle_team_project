<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>쇼핑몰 공지사항</title>
<script src="https://cdn.tailwindcss.com/3.4.16"></script>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css">
<script>
tailwind.config = {
  theme: {
    extend: {
      colors: {
        primary: "#4a90e2",
        secondary: "#f5f5f5",
      },
      borderRadius: {
        button: "8px",
      },
    },
  },
};
</script>
<style>
body {
  font-family: 'Noto Sans KR', sans-serif;
}
.sidebar-menu-item.active {
  background-color: #f0f7ff;
  color: #4a90e2;
  font-weight: 600;
  border-left: 3px solid #4a90e2;
}
.table-row:nth-child(even) {
  background-color: #f9f9f9;
}
.table-row:hover {
  background-color: #f0f7ff;
}
.pagination-item.active {
  background-color: #4a90e2;
  color: white;
}


</style>
</head>
<body class="bg-white">

<div class="container mx-auto px-4 py-8 max-w-7xl">
  <div class="flex flex-col md:flex-row gap-6">
    <!-- 사이드바 -->
    <div class="w-full md:w-64 flex-shrink-0">
      <h2 class="text-xl font-bold mb-4">공지사항</h2>
      <div class="bg-white rounded shadow">
        <ul class="divide-y divide-gray-200">
          <li class="sidebar-menu-item active px-4 py-3 cursor-pointer">공지사항</li>
          <li class="sidebar-menu-item px-4 py-3 cursor-pointer">Q&A</li>
          <li class="sidebar-menu-item px-4 py-3 cursor-pointer">이벤트</li>
        </ul>
      </div>
    </div>










    <!-- 컨텐츠 영역 -->
    <div class="flex-1">
      <!-- 검색 영역 -->
      <div class="flex justify-between items-center mb-6 gap-4">
        <form action="NoticeBoardList" method="get" class="flex gap-4 flex-1">
          <select name="searchCondition" class="px-3 py-2 border border-gray-300 rounded">
            <option value="NOTICE_TITLE">제목</option>
            <option value="NOTICE_CONTENT">내용</option>
          </select>
          <input type="text" name="searchKeyword" class="flex-1 px-4 py-2 border border-gray-300 rounded" placeholder="검색어를 입력하세요">
          <button type="submit" class="px-4 py-2 bg-primary text-white rounded-button">검색</button>
        </form>
      </div>

      <!-- 공지사항 목록 -->
      <div class="bg-white rounded shadow overflow-x-auto">
        <table class="w-full min-w-full">
          <thead>
            <tr class="bg-gray-100 text-left">
              <th class="px-4 py-3 text-center w-16">번호</th>
              <th class="px-4 py-3">제목</th>
              <th class="px-4 py-3 text-center w-32">내용</th>
              <th class="px-4 py-3 text-center w-32">작성일</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${boardList}" var="board">
              <tr class="table-row border-t border-gray-200">
                <td class="px-4 py-3 text-center">${board.NOTICE_NO}</td>
                <td class="px-4 py-3 font-medium">
                  <a href="${pageContext.request.contextPath}/board/NoticeBoard?NOTICE_NO=${board.NOTICE_NO}" 
  					class="hover:text-primary">
   						${board.NOTICE_TITLE}
							</a>
                </td>
                <td class="px-4 py-3 text-center">${board.NOTICE_CONTENT}</td>
                <td class="px-4 py-3 text-center">
                  <fmt:formatDate value="${board.NOTICE_DATE}" pattern="yyyy-MM-dd"/>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <!-- 페이지네이션 -->
<div class="flex justify-center mt-6">
  <nav class="inline-flex rounded-md shadow">

    <!--  이전 페이지 -->
    <a href="NoticeBoardList?page=${currentPage - 1}" 
       class="px-3 py-2 border border-gray-300 bg-white text-gray-500 hover:bg-gray-50 rounded-l-md"
       style="${currentPage == 1 ? 'pointer-events:none;opacity:0.5;' : ''}">
       <i class="ri-arrow-left-s-line"></i>
    </a>

    <!--  페이지 번호 반복 (1 ~ 5) -->
    <c:forEach var="i" begin="1" end="5">
      <a href="NoticeBoardList?page=${i}"
         class="pagination-item px-3 py-2 border border-gray-300 border-l-0
               ${i == currentPage ? 'active bg-blue-500 text-white' : 'bg-white text-gray-700 hover:bg-gray-50'}">
        ${i}
      </a>
    </c:forEach>

    <!--  다음 페이지 -->
    <a href="NoticeBoardList?page=${currentPage + 1}" 
       class="px-3 py-2 border border-gray-300 border-l-0 bg-white text-gray-500 hover:bg-gray-50 rounded-r-md">
       <i class="ri-arrow-right-s-line"></i>
    </a>

  </nav>
</div>

    </div>
  </div>
</div>





</body>
</html>
