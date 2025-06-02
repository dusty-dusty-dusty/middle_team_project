package com.mid.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.mid.mypage.model.MemberVO;
import com.mid.mypage.service.MemberService;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/mypage/profile")
public class ProfileController {

    @Autowired
    private MemberService memberService;

    // 개인정보 확인
    @GetMapping("/check-profile")
    public String checkProfile(HttpSession session, Model model) {
        // 세션에서 회원번호로 회원정보 조회
        if (session.getAttribute("memNo") == null) {
            session.setAttribute("memNo", "MEM000001");
        }
        String memNo = (String) session.getAttribute("memNo");
        System.out.println("==== [DEBUG] check-profile: memNo = " + memNo);
        MemberVO member = memberService.getMemberByNo(memNo);
        System.out.println("==== [DEBUG] check-profile: member = " + member);
        model.addAttribute("memberVO", member);
        return "mypage/check-profile";
    }

    // 개인정보 수정 폼 진입
    @GetMapping("/edit-profile")
    public String editProfileForm(HttpSession session, Model model) {
        // 세션에서 회원번호로 회원정보 조회
        if (session.getAttribute("memNo") == null) {
            session.setAttribute("memNo", "MEM000001");
        }
        String memNo = (String) session.getAttribute("memNo");
        System.out.println("==== [DEBUG] edit-profile: memNo = " + memNo);
        MemberVO member = memberService.getMemberByNo(memNo);
        System.out.println("==== [DEBUG] edit-profile: member = " + member);
        model.addAttribute("memberVO", member);
        return "mypage/edit-profile";
    }

    // 개인정보 수정 처리 (Ajax)
    @PostMapping("/edit-profile")
    @ResponseBody
    public Map<String, Object> updateProfile(
        @RequestParam("memNo") String memNo,
        @RequestParam("memId") String memId,
        @RequestParam("memName") String memName,
        @RequestParam("memPwd") String memPwd,
        @RequestParam("memEmail") String memEmail,
        @RequestParam("memAddr") String memAddr,
        @RequestParam("memTel") String memTel,
        @RequestParam("confirmPassword") String confirmPassword,
        HttpSession session
    ) {
        // 비밀번호/확인 입력 체크 및 회원정보 수정
        MemberVO memberVO = new MemberVO();
        memberVO.setMemNo(memNo);
        memberVO.setMemId(memId);
        memberVO.setMemName(memName);
        memberVO.setMemPwd(memPwd);
        memberVO.setMemEmail(memEmail);
        memberVO.setMemAddr(memAddr);
        memberVO.setMemTel(memTel);
        System.out.println("==== [DEBUG] update-profile: memberVO (RequestParam 방식) = " + memberVO);
        Map<String, Object> result = new HashMap<>();
        if (memPwd == null || memPwd.trim().isEmpty() || confirmPassword == null || confirmPassword.trim().isEmpty()) {
            result.put("success", false);
            result.put("message", "회원정보를 수정하려면 새 비밀번호와 확인을 모두 입력해야 합니다.");
            return result;
        }
        if (!memPwd.equals(confirmPassword)) {
            result.put("success", false);
            result.put("message", "비밀번호가 일치하지 않습니다.");
            return result;
        }
        try {
            int updateResult = memberService.updateMember(memberVO);
            System.out.println("==== [DEBUG] update-profile: updateResult = " + updateResult);
            result.put("success", updateResult > 0);
            if (updateResult == 0) {
                result.put("message", "수정할 정보가 없습니다.");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "수정 실패: " + e.getMessage());
        }
        return result;
    }

    // 비밀번호 변경 처리 (Ajax, 더미)
    @PostMapping("/password")
    @ResponseBody
    public String changePassword(@RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 HttpSession session) {
        // 더미 비밀번호 검증 후 성공/실패 반환
        String existingPwd = "password123";
        if (!existingPwd.equals(currentPassword)) {
            return "현재 비밀번호가 일치하지 않습니다.";
        }
        return "success";
    }

    // 비밀번호 변경 처리 (Ajax, 더미)
    @PostMapping("/change-password")
    @ResponseBody
    public String changePassword() {
        // 항상 success 반환
        return "success";
    }

    // 아이디 중복 체크 (Ajax)
    @PostMapping("/check-id")
    @ResponseBody
    public boolean checkIdDuplicate() {
        // 항상 사용 가능 반환
        return false;
    }
}
