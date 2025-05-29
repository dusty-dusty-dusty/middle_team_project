package com.mid.login.controller;

import com.mid.login.model.UserInfoVO;
import com.mid.login.repo.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDAO userDAO;

	// Spring MVC�뿉�꽌�뒗 JSP �뙆�씪�쓣 吏곸젒 URL濡� �젒洹쇳븯吏� �븡怨�,
	// 諛섎뱶�떆 而⑦듃濡ㅻ윭 留ㅽ븨 URL(�삁: /user/start)濡� �젒洹쇳빐�빞 �빀�땲�떎.

	@GetMapping("/login")
	public String loginForm() {
		return "login/login"; // /WEB-INF/views/login/login.jsp
	}

	@PostMapping("/login")
	public String login(@RequestParam("memId") String memId,
	                    @RequestParam("memPwd") String memPwd,
	                    HttpServletRequest request, Model model) {
	    // 임시 회원번호 MEM000001 사용
	    UserInfoVO userInfo = new UserInfoVO();
	    userInfo.setMemNo("MEM000001");
	    userInfo.setMemId(memId);
	    userInfo.setMemPwd(memPwd);
	    userInfo.setMemName("임시회원");
	    userInfo.setMemEmail("temp@example.com");
	    userInfo.setMemAddr("임시주소");
	    userInfo.setMemTel("010-0000-0000");
	    userInfo.setMemRegdate(new Date());
	    
	    HttpSession session = request.getSession();
	    session.setAttribute("loggedInUser", userInfo);
	    model.addAttribute("userName", userInfo.getMemName());
	    model.addAttribute("loginSuccess", "true");
	    return "login/login_success_start";
	}

	@GetMapping("/register")
	public String registerForm() {
		return "login/register";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute UserInfoVO userInfoVO, Model model) {
		int result = userDAO.insertUser(userInfoVO);
		if (result > 0) {
			return "redirect:/user/login";
		} else {
			model.addAttribute("registerError", "회원 가입에 실패했습니다.");
			return "login/register";
		}
	}

	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("memId") String memId) {
		int result = userDAO.idCheck(memId);
		return (result > 0) ? "fail" : "success";
	}

	@GetMapping("/main")
	public String main() {
		return "login/main";
	}

	@GetMapping("/start")
	public String start(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserInfoVO userInfo = (UserInfoVO) session.getAttribute("loggedInUser");
		if (userInfo != null) {
			model.addAttribute("userName", userInfo.getMemName());
			model.addAttribute("loginSuccess", "true");
			return "start"; // /WEB-INF/views/start.jsp
		}
		return "redirect:/user/login";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/user/login";
	}
}

