package com.mid.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mid.mypage.model.MemberVO;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping({"/mypage/profile", "/deskset/mypage/profile"})
public class ProfileController {

    @GetMapping("")
    public String viewProfile(HttpSession session, Model model) {
        // 세션에서 memId 가져오기 (더미)
        String memId = (String) session.getAttribute("memId");
        
        // 더미 MemberVO 생성
        MemberVO member = new MemberVO();
        member.setMemId(memId != null ? memId : "dummyUser");
        member.setMemName("홍길동");
        member.setMemEmail("hong@example.com");
        member.setMemPwd("password123");
        
        model.addAttribute("member", member);
        return "mypage/profile";
    }

    @GetMapping("/edit")
    public String editProfileForm(HttpSession session, Model model) {
        // 세션에서 memId 가져오기 (더미)
        String memId = (String) session.getAttribute("memId");
        
        // 더미 MemberVO 생성
        MemberVO member = new MemberVO();
        member.setMemId(memId != null ? memId : "dummyUser");
        member.setMemName("홍길동");
        member.setMemEmail("hong@example.com");
        member.setMemPwd("password123");
        
        model.addAttribute("member", member);
        return "mypage/edit-profile";
    }

    @PostMapping("/edit")
    public String updateProfile(@ModelAttribute MemberVO member,
                                HttpSession session,
                                RedirectAttributes rttr) {
        // DB 업데이트 로직 제거 → 무조건 성공 메시지
        rttr.addFlashAttribute("message", "프로필이 성공적으로 수정되었습니다. (더미)");
        return "redirect:/mypage/profile";
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

    @GetMapping("edit-profile")
    public String editProfileForm() {
        return "mypage/edit-profile";
    }

    @GetMapping("check-profile")
    public String checkProfile() {
        return "mypage/check-profile";
    }

    @PostMapping("edit-profile")
    @ResponseBody
    public java.util.Map<String, Object> updateProfile(@ModelAttribute com.mid.mypage.model.MemberVO memberVO) {
        java.util.Map<String, Object> result = new java.util.HashMap<>();
        try {
            // TODO: 실제 DB 업데이트 로직 추가
            // 예시: memberService.update(memberVO);
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "수정 실패: " + e.getMessage());
        }
        return result;
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
