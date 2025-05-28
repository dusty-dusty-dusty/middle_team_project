package com.mid.mypage.controller;

import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping({"/mypage", "/deskset/mypage"})
public class MypageController {
    private static final String TEST_MEMBER_ID = "hong123";

    @GetMapping("")
    public String myPage(HttpSession session) {
        if (session.getAttribute("memId") == null) {
            session.setAttribute("memId", TEST_MEMBER_ID);
        }
        return "redirect:/deskset/mypage/orders";
    }

    @GetMapping("/basket")
    public String basket(@RequestParam(value = "page", defaultValue = "1") int page,
                         Model model) {
        // 빈 뷰로 이동 (cartList, paging 정보는 뷰에서 기본값 처리)
        model.addAttribute("currentPage", page);
        return "mypage/basket";
    }

    @GetMapping("/check-profile")
    public String checkProfile() {
        return "mypage/check-profile";
    }

    @GetMapping("/edit-profile")
    public String editProfileForm() {
        return "mypage/edit-profile";
    }

    @PostMapping("/edit-profile")
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

    @PostMapping("/basketAction.do")
    public String basketAction(@RequestParam("action") String action,
                               @RequestParam(value = "selectedItems", required = false) List<String> selectedItems) {
        if ("order".equals(action) && selectedItems != null && !selectedItems.isEmpty()) {
            return "redirect:/order/checkout?cartIds=" + String.join(",", selectedItems);
        }
        return "redirect:/mypage/basket";
    }

    @PostMapping("/updateCartQuantity")
    @ResponseBody
    public String updateCartQuantity() {
        return "{\"success\": true}";
    }
} 