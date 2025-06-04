package com.mid.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	//페이지이동 requestResponse 
	//관리자 페이지 로그인창 
	@RequestMapping("manager/admin_login")
	public void adminLogin() {
	}
	//관리자 페이지
	@RequestMapping("manager/admin")
	public void adminPage() {
	}
	//관리자 페이지
	@RequestMapping("manager/admin_dashboard")
	public void adminDashBoard() {
	}
//-------------------------------------------------------
	//관리자 페이지-관리자 관리
	@RequestMapping("manager/admin_admin")
	public void adminAdministration() {
	}
	//관리자 페이지-관리자 관리-관리자 등록
	@RequestMapping("manager/admin_register")
	public void adminRegister() {
	}
	//관리자 페이지-관리자 관리-관리자 수정
	@RequestMapping("manager/admin_modify")
	public void adminModify() {
	}
//---------------------------------------------------------
	//관리자 페이지-회원 관리
	@RequestMapping("manager/admin_member")
	public void memberAdministration() {
	}
	//관리자 페이지-회원 관리-회원 정보 열람
	@RequestMapping("manager/admin_memcheck")
	public void memberCheck() {
	}


//-------------------------------------------------------
	//관리자 페이지-게시판 관리
	@RequestMapping("manager/admin_notice")
	public void noticeAdministration() {
	}
//---------------------------------------------------------
	//관리자 페이지-주문 관리
	@RequestMapping("manager/admin_order")
	public void orderAdministration() {
	}
	
	
}




//	@RequestMapping("manager/admin_admin")
//	public String adminPage(HttpServletRequest request) {
//	    // AJAX 요청인지 확인
//	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
//
//	    if (isAjax) {
//	        return "manager/admin_admin"; // 본문만 반환하는 JSP
//	    } else {
//	        return "manager/admin"; // 전체 페이지 렌더링
//	    }
//	}

//	@RequestMapping("manager/admin_member")
//	public String adminPage2(HttpServletRequest request) {
//	    // AJAX 요청인지 확인
//	    boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
//
//	    if (isAjax) {
//	        return "manager/admin_member"; // 본문만 반환하는 JSP
//	    } else {
//	        return "manager/admin"; // 전체 페이지 렌더링
//	    }
//	}