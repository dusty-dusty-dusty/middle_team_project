package com.mid.mypage.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mid.mypage.model.OrderVO;
import com.mid.mypage.repo.OrderDAO;

@Controller
@RequestMapping("/mypage")
public class OrderController {

    private static final Logger log = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderDAO orderDAO;

    /**
     * 주문 결제 폼 진입
     * - 선택된 cartIds를 받아 결제 페이지로 이동
     * - cartIds가 없으면 장바구니로 리다이렉트
     */
    @GetMapping("/checkout")
    public String checkoutForm(
            @RequestParam(value = "cartIds", required = false) List<String> cartIds,
            HttpSession session,
            Model model) {
        if (cartIds == null || cartIds.isEmpty()) {
            return "redirect:/mypage/cart";
        }
        // CartVO 떊 鍮 臾몄옄뿴 由ъ뒪듃濡 泥
        List<String> selectedItems = new ArrayList<>();
        model.addAttribute("cartIds", cartIds);
        model.addAttribute("selectedItems", selectedItems);
        return "mypage/order/checkout";
    }

    /**
     * 주문 처리 (결제 완료)
     * - 주문이 성공적으로 완료되면 주문목록으로 리다이렉트
     */
    @PostMapping("/place")
    public String placeOrder(
            @RequestParam("cartIds") List<String> cartIds,
            @RequestParam("paymentMethod") String paymentMethod,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        String orderNo = "ORD" + UUID.randomUUID().toString().substring(0, 10);
        redirectAttributes.addFlashAttribute("message",
            "주문이 성공적으로 완료되었습니다. (임시 주문번호: " + orderNo + ")");
        return "redirect:/mypage/orders";
    }

    /**
     * 주문 상세 페이지 진입
     */
    @GetMapping("/detail/{orderNo}")
    public String orderDetail(
            @PathVariable("orderNo") String orderNo,
            Model model) {
        OrderVO order = new OrderVO();
        order.setOrderNo(orderNo);
        order.setOrderDate(new Date());
        order.setOrderStatus("주문완료(임시)");
        model.addAttribute("order", order);
        return "mypage/order/detail";
    }

    /**
     * 주문 목록(테스트용)
     * - 임시 회원번호로 주문목록 조회
     */
    @GetMapping("/list")
    public String getOrderList(Model model) {
        // 임시로 테스트용 memId 사용
        String testMemId = "MEM000001";  // 테스트 데이터에 있는 회원 ID
        List<OrderVO> orderList = orderDAO.getOrderListByMemberId(testMemId);
        model.addAttribute("orderList", orderList);
        return "mypage/order/list";
    }

    /**
     * 주문 목록/배송조회 메인
     * - 임시 회원번호로 주문목록, 데이터 체크, 로그 출력
     */
    @GetMapping("/orders")
    public String orders(Model model, HttpSession session) {
        if (session.getAttribute("memNo") == null) {
            session.setAttribute("memNo", "MEM000001");
        }
        String memNo = (String) session.getAttribute("memNo");
        try {
            // getOrderList 호출 시 회원번호 전달
            Map<String, Object> dataCheck = orderDAO.checkOrderData(memNo);
            List<OrderVO> orderList = orderDAO.getOrderList(memNo);
            model.addAttribute("orderList", orderList);
            return "mypage/orders";
        } catch (Exception e) {
            log.error("주문 목록 조회 중 오류 발생", e);
            throw e;
        }
    }
}
