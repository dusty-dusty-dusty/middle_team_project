package com.mid.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @GetMapping("/check-profile")
    public String checkProfile(HttpSession session, Model model) {
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

    @GetMapping("/edit-profile")
    public String editProfileForm(HttpSession session, Model model) {
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

    @PostMapping("/edit-profile")
    @ResponseBody
    public Map<String, Object> updateProfile(
            @ModelAttribute MemberVO memberVO,
            @RequestParam(value = "confirmPassword", required = false) String confirmPassword,
            HttpSession session) {
        if (session.getAttribute("memNo") == null) {
            session.setAttribute("memNo", "MEM000001");
        }
        String memNo = (String) session.getAttribute("memNo");
        System.out.println("==== [DEBUG] update-profile: memNo = " + memNo);
        System.out.println("==== [DEBUG] update-profile: memberVO(before set) = " + memberVO);
        memberVO.setMemNo(memNo);
        System.out.println("==== [DEBUG] update-profile: memberVO(after set) = " + memberVO);
        Map<String, Object> result = new HashMap<>();
        String pwd = memberVO.getMemPwd();
        if (pwd == null || pwd.trim().isEmpty() || confirmPassword == null || confirmPassword.trim().isEmpty()) {
            result.put("success", false);
            result.put("message", "회원정보를 수정하려면 새 비밀번호와 확인을 모두 입력해야 합니다.");
            return result;
        }
        if (!pwd.equals(confirmPassword)) {
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

    @PostMapping("/password")
    @ResponseBody
    public String changePassword(@RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 HttpSession session) {
        // 더미 기존 비밀번호 (실제로는 세션·서비스에서 가져와야 함)
        String existingPwd = "password123";

        // 현재 비밀번호 검증
        if (!existingPwd.equals(currentPassword)) {
            return "현재 비밀번호가 일치하지 않습니다.";
        }

        // 비밀번호 변경 로직 제거 → 무조건 성공
        return "success";
    }

    @PostMapping("/change-password")
    @ResponseBody
    public String changePassword() {
        // 항상 success
        return "success";
    }

    @PostMapping("/check-id")
    @ResponseBody
    public boolean checkIdDuplicate() {
        // 항상 사용 가능
        return false;
    }
}
