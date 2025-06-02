package com.mid.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.mid.mypage.model.MemberVO;
import com.mid.mypage.service.MemberService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    private static final String TEST_MEMBER_ID = "hong123";

    @Autowired
    private MemberService memberService;

    /**
     * 마이페이지 메인 진입
     * - 세션에 memId가 없으면 테스트용 ID를 세팅
     * - 기본적으로 주문목록/배송조회로 리다이렉트
     */
    @GetMapping({"", "/"})
    public String myPage(HttpSession session) {
        // 세션에 memId가 없으면 테스트용 ID를 세팅
        if (session.getAttribute("memId") == null) {
            session.setAttribute("memId", TEST_MEMBER_ID);
        }
        return "redirect:/mypage/orders";
    }

    /**
     * 개인정보 확인 페이지 진입 (DB에서 회원정보 조회해서 JSP에 전달)
     */
    @GetMapping("/check-profile")
    public String checkProfile(HttpSession session, Model model) {
        // 세션에서 회원번호로 회원정보 조회
        if (session.getAttribute("memNo") == null) {
            session.setAttribute("memNo", "MEM000001");
        }
        String memNo = (String) session.getAttribute("memNo");
        MemberVO member = memberService.getMemberByNo(memNo);
        model.addAttribute("memberVO", member);
        return "mypage/check-profile";
    }

    /**
     * 개인정보 수정 폼 진입
     */
    @GetMapping("/edit-profile")
    public String editProfileForm(HttpSession session, Model model) {
        // 세션에서 회원번호로 회원정보 조회
        if (session.getAttribute("memNo") == null) {
            session.setAttribute("memNo", "MEM000001");
        }
        String memNo = (String) session.getAttribute("memNo");
        MemberVO member = memberService.getMemberByNo(memNo);
        model.addAttribute("memberVO", member);
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
        // 비밀번호/확인 입력 체크 및 회원정보 수정
        java.util.Map<String, Object> result = new java.util.HashMap<>();
        try {
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
            int updated = memberService.updateMember(memberVO);
            result.put("success", updated > 0);
            result.put("message", updated > 0 ? "수정 성공" : "수정 실패");
        } catch (Exception e) {
            e.printStackTrace(); // 콘솔에 에러 출력
            result.put("success", false);
            result.put("message", e.getMessage()); // 에러 메시지 반환
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
        // action이 order면 주문, 아니면 장바구니로 리다이렉트
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