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
import java.util.Map;

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
	    UserInfoVO userInfo = userDAO.getUserInfo(memId, memPwd); 
	    System.out.println("입력 비밀번호: " + memPwd);
	    System.out.println("DB 비밀번호: " + (userInfo != null ? userInfo.getMemPwd() : "null"));
	    if (userInfo != null && memPwd.equals(userInfo.getMemPwd())) {
	        HttpSession session = request.getSession();
	        session.setAttribute("loggedInUser", userInfo);
	        model.addAttribute("userName", userInfo.getMemName());
	        model.addAttribute("loginSuccess", "true");
	        return "main/main_page"; // 濡쒓렇�씤 �꽦怨� �떆 諛붾줈 login_success_start.jsp濡� �씠�룞
	    } else {
	        request.setAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        return "login/login";
	    }
	}

	@GetMapping("/register")
	public String registerForm() {
		return "login/register";
	}

	@PostMapping("/register")
	@ResponseBody
	public Map<String, Object> register(
			@RequestParam("memName") String memName,
			@RequestParam("memEmail") String memEmail,
			@RequestParam("memId") String memId,
			@RequestParam("memPwd") String memPwd,
			@RequestParam("memAddr") String memAddr,
			@RequestParam("memTel") String memTel,
			HttpServletRequest request,
			Model model) {
		Map<String, Object> result = new java.util.HashMap<>();
		UserInfoVO userInfoVO = new UserInfoVO();
		userInfoVO.setMemName(memName);
		userInfoVO.setMemEmail(memEmail);
		userInfoVO.setMemId(memId);
		userInfoVO.setMemPwd(memPwd);
		userInfoVO.setMemAddr(memAddr);
		userInfoVO.setMemTel(memTel);
		try {
			int insertResult = userDAO.insertUser(userInfoVO);
			if (insertResult > 0) {
				// 자동 로그인 제거: 세션에 로그인 정보 저장하지 않음
				result.put("success", true);
			} else {
				result.put("success", false);
				result.put("message", "회원 가입에 실패했습니다.");
			}
		} catch (Exception e) {
			String errorMsg = e.getMessage();
			System.out.println("[DEBUG][register] 회원가입 예외 발생: " + errorMsg);
			e.printStackTrace();
			System.out.println("[DEBUG][register] userInfoVO: " + userInfoVO);
			if (errorMsg != null && errorMsg.contains("UQ_MEMBER_EMAIL")) {
				result.put("success", false);
				result.put("message", "이미 등록된 이메일입니다. 다른 이메일을 입력해 주세요.");
			} else if (errorMsg != null && errorMsg.contains("unique constraint") && errorMsg.contains("EMAIL")) {
				result.put("success", false);
				result.put("message", "이 이메일은 이미 사용 중입니다.");
			} else if (errorMsg != null && (errorMsg.contains("UQ_MEMBER_TEL") || (errorMsg.contains("unique constraint") && errorMsg.toUpperCase().contains("TEL")))) {
				result.put("success", false);
				result.put("message", "이미 등록된 휴대폰 번호입니다. 다른 번호를 입력해 주세요.");
			} else {
				result.put("success", false);
				result.put("message", "회원가입 중 오류가 발생했습니다.");
			}
		}
		return result;
	}

	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("memId") String memId) {
		int result = userDAO.idCheck(memId);
		return (result > 0) ? "fail" : "success";
	}

	@GetMapping("/main")
	public String main() {
		return "main/main_page"; // main_page.jsp로 이동
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
	@GetMapping("/mypage/cart")
	public String cart() {
	    return "mypage/cart"; // /WEB-INF/views/mypage/cart.jsp로 이동
	}


}

