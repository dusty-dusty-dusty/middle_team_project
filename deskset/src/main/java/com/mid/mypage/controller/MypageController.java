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

    @GetMapping("/orders")
    public String orders() {
        // 빈 뷰로 이동 (orderList 모델은 JSP/타일즈에서 없을 때도 처리하도록)
        return "mypage/orders";
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
    public String updateProfile(RedirectAttributes rttr) {
        // 항상 성공 메시지 없이 리다이렉트
        return "redirect:/deskset/mypage/check-profile";
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
