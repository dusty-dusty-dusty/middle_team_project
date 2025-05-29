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

    @GetMapping("/checkout")
    public String checkoutForm(
            @RequestParam(value = "cartIds", required = false) List<String> cartIds,
            HttpSession session,
            Model model) {

        if (cartIds == null || cartIds.isEmpty()) {
            return "redirect:/mypage/basket";
        }

        // CartVO 떊 鍮 臾몄옄뿴 由ъ뒪듃濡 泥
        List<String> selectedItems = new ArrayList<>();
        model.addAttribute("cartIds", cartIds);
        model.addAttribute("selectedItems", selectedItems);

        return "mypage/order/checkout";
    }

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

    @GetMapping("/list")
    public String getOrderList(Model model) {
        // 임시로 테스트용 memId 사용
        String testMemId = "MEM000001";  // 테스트 데이터에 있는 회원 ID
        List<OrderVO> orderList = orderDAO.getOrderListByMemberId(testMemId);
        model.addAttribute("orderList", orderList);
        return "mypage/order/list";
    }

    @GetMapping("/orders")
    public String orders(Model model) {
        try {
            // 임시로 테스트용 memId 사용
            String testMemId = "MEM000001";  // 테스트 데이터에 있는 회원 ID
            log.debug("=== 주문 목록 조회 시작 ===");
            log.debug("회원 ID: {}", testMemId);
            
            // 데이터 체크
            Map<String, Object> dataCheck = orderDAO.checkOrderData(testMemId);
            log.debug("데이터 체크 결과: {}", dataCheck);
            
            // getOrderList 호출 시 회원번호 전달
            List<OrderVO> orderList = orderDAO.getOrderList(testMemId);
            log.debug("조회된 주문 목록 크기: {}", orderList != null ? orderList.size() : 0);
            
            if (orderList != null) {
                for (OrderVO order : orderList) {
                    log.debug("주문 정보 - 주문번호: {}, 주문일자: {}, 주문상태: {}, 상품명: {}, 상품가격: {}", 
                        new Object[] {
                            order.getOrderNo(), 
                            order.getOrderDate(), 
                            order.getOrderStatus(),
                            order.getProductName(),
                            order.getProductPrice()
                        });
                }
            }
            
            model.addAttribute("orderList", orderList);
            return "mypage/orders";
        } catch (Exception e) {
            log.error("주문 목록 조회 중 오류 발생", e);
            throw e;
        }
    }
}
