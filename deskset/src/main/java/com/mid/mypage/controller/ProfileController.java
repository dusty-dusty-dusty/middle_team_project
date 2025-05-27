package com.mid.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mid.mypage.service.MypageService;
import com.mid.mypage.model.MemberVO;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage/profile")
public class ProfileController {
    
    @Autowired
    private MypageService mypageService;
    
    @GetMapping("")
    public String viewProfile(HttpSession session, Model model) {
        String memId = (String) session.getAttribute("memId");
        MemberVO member = mypageService.getMemberInfo(memId);
        model.addAttribute("member", member);
        return "mypage/profile";
    }
    
    @GetMapping("/edit")
    public String editProfileForm(HttpSession session, Model model) {
        String memId = (String) session.getAttribute("memId");
        MemberVO member = mypageService.getMemberInfo(memId);
        model.addAttribute("member", member);
        return "mypage/edit-profile";
    }
    
    @PostMapping("/edit")
    public String updateProfile(@ModelAttribute MemberVO member, 
                              HttpSession session, 
                              RedirectAttributes rttr) {
        try {
            boolean result = mypageService.updateMemberInfo(member);
            if (result) {
                rttr.addFlashAttribute("message", "프로필이 성공적으로 수정되었습니다.");
            } else {
                rttr.addFlashAttribute("error", "프로필 수정에 실패했습니다.");
            }
        } catch (Exception e) {
            rttr.addFlashAttribute("error", "프로필 수정 중 오류가 발생했습니다.");
        }
        return "redirect:/mypage/profile";
    }
    
    @PostMapping("/password")
    @ResponseBody
    public String changePassword(@RequestParam String currentPassword,
                               @RequestParam String newPassword,
                               HttpSession session) {
        try {
            String memId = (String) session.getAttribute("memId");
            MemberVO member = mypageService.getMemberInfo(memId);
            
            if (!member.getMemPwd().equals(currentPassword)) {
                return "현재 비밀번호가 일치하지 않습니다.";
            }
            
            member.setMemPwd(newPassword);
            boolean result = mypageService.updateMemberInfo(member);
            
            if (result) {
                return "success";
            } else {
                return "비밀번호 변경에 실패했습니다.";
            }
        } catch (Exception e) {
            return "비밀번호 변경 중 오류가 발생했습니다.";
        }
    }
} 