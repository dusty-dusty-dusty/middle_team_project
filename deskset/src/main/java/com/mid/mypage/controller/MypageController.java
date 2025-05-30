package com.mid.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/mypage")
public class MypageController {
    private static final String TEST_MEMBER_ID = "hong123";

    /**
     * 마이페이지 메인 진입
     * - 세션에 memId가 없으면 테스트용 ID를 세팅
     * - 기본적으로 주문목록/배송조회로 리다이렉트
     */
    @GetMapping({"", "/"})
    public String myPage(HttpSession session) {
        if (session.getAttribute("memId") == null) {
            session.setAttribute("memId", TEST_MEMBER_ID);
        }
        return "redirect:/mypage/orders";
    }

    /**
     * 개인정보 확인 페이지 진입
     */
    @GetMapping("/check-profile")
    public String checkProfile() {
        return "mypage/check-profile";
    }

    /**
     * 개인정보 수정 폼 진입
     */
    @GetMapping("/edit-profile")
    public String editProfileForm() {
        return "mypage/edit-profile";
    }

    /**
     * 개인정보 수정 처리 (Ajax)
     */
    @PostMapping("/edit-profile")
    @ResponseBody
    public java.util.Map<String, Object> updateProfile(
            @ModelAttribute com.mid.mypage.model.MemberVO memberVO,
            @RequestParam(value = "confirmPassword", required = false) String confirmPassword) {
        java.util.Map<String, Object> result = new java.util.HashMap<>();
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
            // TODO: 실제 DB 업데이트 로직 (서비스/매퍼 호출)
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "수정 실패: " + e.getMessage());
        }
        return result;
    }

    /**
     * 비밀번호 변경 처리 (Ajax)
     */
    @PostMapping("/change-password")
    @ResponseBody
    public String changePassword() {
        // 항상 success
        return "success";
    }

    /**
     * 아이디 중복 체크 (Ajax)
     */
    @PostMapping("/check-id")
    @ResponseBody
    public boolean checkIdDuplicate() {
        // 항상 사용 가능
        return false;
    }

    /**
     * 장바구니에서 선택상품 주문/삭제 처리
     * - action: order(주문), delete(삭제)
     * - selectedItems: 선택된 cartId 리스트
     */
    @PostMapping("/cartAction.do")
    public String cartAction(@RequestParam("action") String action,
                               @RequestParam(value = "selectedItems", required = false) List<String> selectedItems) {
        if ("order".equals(action) && selectedItems != null && !selectedItems.isEmpty()) {
            return "redirect:/mypage/order/checkout?cartIds=" + String.join(",", selectedItems);
        }
        return "redirect:/mypage/cart";
    }

    /**
     * 장바구니 수량 변경 (Ajax)
     */
    @PostMapping("/updateCartQuantity")
    @ResponseBody
    public String updateCartQuantity() {
        return "{\"success\": true}";
    }
} 