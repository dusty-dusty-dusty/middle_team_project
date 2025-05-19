package com.mid.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("manager/admin")
	public void test() {
	}
	@RequestMapping("manager/admin_admin")
	public void test2() {
	}
	@RequestMapping("manager/admin_member")
	public void test3() {
	}
	@RequestMapping("manager/admin_product")
	public void test4() {
	}
	@RequestMapping("manager/admin_notice")
	public void test5() {
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
	
	
}
