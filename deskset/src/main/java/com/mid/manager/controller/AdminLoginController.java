package com.mid.manager.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mid.common.model.AdminVO;
import com.mid.manager.service.AdminLoginService;

@Controller
public class AdminLoginController {
	
	@Autowired
	private AdminLoginService adminLoginServiceImpl;
	
	@RequestMapping("manager/aadminlogin")
	public String login(AdminVO vo, HttpSession session) {
		AdminVO result = adminLoginServiceImpl.loginCheck(vo);
		if(result==null) {
			return "manager/admin_login";
		}else {
			session.setAttribute("admin_no", result.getAdmin_no());
			session.setAttribute("admin_name", result.getAdmin_name());
			return "manager/admin";
		}
	}
}
