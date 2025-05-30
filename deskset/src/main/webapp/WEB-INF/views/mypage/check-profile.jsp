<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 확인</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/mypage.css'/>" />
    <style>
    .container {
        width: 1200px;
        margin: 0 auto;
        padding: 20px;
        display: flex;
        gap: 20px;
    }

    .main-content {
        flex: 1;
        padding: 30px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    
    .page-title {
        margin-bottom: 30px;
        font-size: 28px;
        color: #333;
        font-weight: 600;
        position: relative;
        padding-bottom: 15px;
    }
    
    .page-title:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 3px;
        background-color: #00a8e8;
    }

    .edit-profile-container {
        max-width: 550px;
        margin: 0 auto;
    }

    .form-group {
        margin-bottom: 28px;
        position: relative;
    }
    
    .form-group label {
        display: block;
        margin-bottom: 10px;
        font-weight: 500;
        color: #444;
        font-size: 16px;
    }

    .form-group input {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
        font-size: 16px;
        transition: all 0.3s;
        box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        background-color: #fff;
        color: #555;
    }

    .form-group input:focus {
        border-color: #00a8e8;
        box-shadow: 0 0 0 3px rgba(0,168,232,0.2);
        outline: none;
    }

    .button-group {
        display: flex;
        justify-content: center;
        margin-top: 40px;
        width: 100%;
    }

    .save-button {
        flex: 0 0 auto;
        padding: 15px 40px;
        background-color: #00a8e8;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: all 0.3s;
        box-shadow: 0 2px 5px rgba(0,168,232,0.3);
    }
    
    .save-button:hover {
        background-color: #0091c8;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,168,232,0.4);
    }
    
    .profile-data {
        position: relative;
    }
    
    .profile-value-label {
        position: absolute;
        top: 5px;
        left: 15px;
        font-size: 12px;
        color: #999;
        background-color: #f9f9f9;
        padding: 0 5px;
        transition: all 0.3s;
    }
    
    .form-group:hover .profile-value-label {
        color: #00a8e8;
    }
    </style>
</head>
<body>
    <!-- 공통 헤더 포함 -->
    <jsp:include page="../common/header.jsp" />

    <div class="container">
        <!-- 공통 사이드바 포함 -->
        <jsp:include page="./mypage-sidebar.jsp" />

        <div class="main-content">
            <h2 class="page-title">개인정보 확인</h2>
            <div class="edit-profile-container">
                <div class="edit-profile-form">
                    <div class="form-group">
                        <label for="name">회원 이름</label>
                        <div class="profile-data">
                            <input type="text" id="name" value="${memberVO.memName}" readonly class="form-control">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="userId">아이디</label>
                        <div class="profile-data">
                            <input type="text" id="userId" value="${memberVO.memId}" readonly class="form-control">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <div class="profile-data">
                            <input type="email" id="email" value="${memberVO.memEmail}" readonly class="form-control">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">휴대폰 번호</label>
                        <div class="profile-data">
                            <input type="tel" id="phone" value="${memberVO.memTel}" readonly class="form-control">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="address">주소</label>
                        <div class="profile-data">
                            <input type="text" id="address" value="${memberVO.memAddr}" readonly class="form-control">
                        </div>
                    </div>
                    
                    <div class="button-group">
                        <button type="button" class="save-button" onclick="location.href='<c:url value='/mypage/edit-profile'/>';">
                            수정하기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 공통 푸터 포함 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html> 