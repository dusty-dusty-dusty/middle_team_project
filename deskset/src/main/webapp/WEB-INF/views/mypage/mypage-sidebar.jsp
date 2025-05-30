<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    // 현재 페이지의 URI를 가져와서 어떤 메뉴가 활성화되어야 하는지 결정하는 변수
    String currentPage = request.getRequestURI();
%>

<!-- 마이페이지 사이드바 컨테이너 시작 - 전체 사이드바 영역을 정의함 -->
<div class="sidebar">
    <h2 class="sidebar-title">마이 쇼핑</h2>
    <ul class="sidebar-menu">
        <!-- 주문 목록 및 배송 조회 메뉴 아이템 - 사용자의 주문 내역을 볼 수 있는 페이지로 연결 -->
        <li>
            <a href="<c:url value='/mypage/orders'/>" 
               class="${fn:endsWith(currentPage, '/orders.jsp') ? 'active' : ''}">
               주문목록/배송조회
            </a>
        </li>
        <!-- 장바구니 메뉴 아이템 - 사용자의 장바구니 페이지로 연결 -->
        <li>
            <a href="<c:url value='/mypage/cart'/>" 
               class="${fn:endsWith(currentPage, '/cart.jsp') ? 'active' : ''}">
               장바구니
            </a>
        </li>
        <!-- 마이정보 카테고리 헤더 -->
        <li class="category-header">마이정보</li>
        <!-- 개인정보 확인 메뉴 아이템 - 사용자 정보를 확인할 수 있는 페이지로 연결 -->
        <li>
            <a href="<c:url value='/mypage/check-profile'/>" 
               class="${fn:endsWith(currentPage, '/check-profile.jsp') ? 'active' : ''}">
               개인정보 확인
            </a>
        </li>
        <!-- 개인정보 수정 메뉴 아이템 - 사용자 정보를 수정할 수 있는 페이지로 연결 -->
        <li>
            <a href="<c:url value='/mypage/edit-profile'/>" 
               class="${fn:endsWith(currentPage, '/edit-profile.jsp') ? 'active' : ''}">
               개인정보 수정
            </a>
        </li>
    </ul>
</div>

<!-- 사이드바 스타일 정의 시작 - 인라인 CSS로 스타일 정의 (외부 파일로 분리하지 않고 JSP 내에 직접 정의) -->
<style>
/* 사이드바 기본 스타일 설정 - 사이드바의 기본 크기와 여백 정의 */
.sidebar {
    width: 200px;
    margin-right: 40px;
    padding-top: 10px;
    padding-bottom: 215px;
}

/* 메인 컨테이너 레이아웃 설정 - 사이드바와 컨텐츠 영역을 감싸는 컨테이너 스타일 */
.container {
    display: flex;
    align-items: flex-start;
    min-height: 100vh;
}

/* 사이드바 제목 스타일 설정 - '마이 쇼핑' 텍스트 스타일 */
.sidebar-title {
    font-size: 20px;
    font-weight: bold;
    color: #333;
    margin: 0 0 25px 0;
    padding-left: 15px;
}

/* 사이드바 메뉴 리스트 스타일 설정 - 메뉴 항목을 담는 ul 요소 스타일 */
.sidebar-menu {
    list-style: none;
    padding: 0;
    margin: 0;
}

/* 사이드바 메뉴 항목 간격 설정 - 각 메뉴 항목(li) 사이 간격 */
.sidebar-menu li {
    margin-bottom: 8px;
}

/* 카테고리 헤더 스타일 설정 - '마이정보'와 같은 카테고리 구분 제목 스타일 */
.category-header {
    color: #333;
    font-size: 15px;
    font-weight: 600;
    padding: 20px 15px 10px 15px;
    margin-top: 5px;
}

/* 메뉴 링크 스타일 설정 - 각 메뉴 항목의 a 태그 스타일 */
.sidebar-menu a {
    display: block;
    text-decoration: none;
    color: #666;
    font-size: 14px;
    padding: 10px 15px;
    transition: all 0.2s ease;
    position: relative;
    line-height: 1.4;
}

/* 메뉴 링크 호버 효과 설정 - 마우스를 올렸을 때 스타일 변화 */
.sidebar-menu a:hover {
    color: #333;
    background-color: #f8f9fa;
}

/* 현재 선택된 메뉴 스타일 설정 - 현재 페이지에 해당하는 메뉴 강조 표시 */
.sidebar-menu a.active {
    color: #333;
    font-weight: 700;
    background-color: #f8f9fa;
}

/* 선택된 메뉴 앞에 점 표시하는 설정 - 현재 페이지 메뉴 앞에 작은 점 표시 */
.sidebar-menu a.active::before {
    content: "";
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    width: 4px;
    height: 4px;
    background-color: #333;
    border-radius: 50%;
}
</style>
<!-- 사이드바 끝 -->