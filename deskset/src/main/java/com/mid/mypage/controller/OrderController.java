package com.mid.mypage.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mid.mypage.model.OrderVO;

@Controller
@RequestMapping("/mypage/order")
public class OrderController {

    @GetMapping("/checkout")
    public String checkoutForm(
            @RequestParam(value = "cartIds", required = false) List<String> cartIds,
            HttpSession session,
            Model model) {

        if (cartIds == null || cartIds.isEmpty()) {
            return "redirect:/mypage/basket";
        }

        // CartVO 대신 빈 문자열 리스트로 대체
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
            "주문이 성공적으로 완료되었습니다. (더미 주문번호: " + orderNo + ")");
        return "redirect:/mypage/orders";
    }

    @GetMapping("/detail/{orderNo}")
    public String orderDetail(
            @PathVariable("orderNo") String orderNo,
            Model model) {

        OrderVO order = new OrderVO();
        order.setOrderNo(orderNo);
        order.setMemNo("M001");
        order.setPayNo("PAY-DUMMY");
        order.setOrderDate(new Date());
        order.setDeliveryFee(3000);
        order.setOrderStatus("주문완료(더미)");

        model.addAttribute("order", order);
        return "mypage/order/detail";
    }

    @GetMapping("/list")
    public String getOrderList(Model model) {
        List<OrderVO> orderList = new ArrayList<>();
        model.addAttribute("orderList", orderList);
        return "mypage/order/list";
    }
}
