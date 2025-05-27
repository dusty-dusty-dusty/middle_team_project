package com.mid.mypage.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mid.mypage.model.CartVO;
import com.mid.mypage.model.OrderVO;
import com.mid.mypage.repo.CartDAO;
import com.mid.mypage.repo.OrderDAO;

@Controller
@RequestMapping("/mypage/order")
public class OrderController {

    @Autowired
    private OrderDAO orderDAO;
    
    @Autowired
    private CartDAO cartDAO;
    
    @GetMapping("/checkout")
    public String checkoutForm(
            @RequestParam(value = "cartIds", required = false) List<String> cartIds,
            HttpSession session, 
            Model model) {
        
        // 테스트를 위해 고정된 회원번호 사용
        String memNo = "M001";
        
        // 선택된 장바구니 항목이 없는 경우
        if (cartIds == null || cartIds.isEmpty()) {
            return "redirect:/mypage/basket";
        }
        
        // 선택한 장바구니 항목 조회 로직 
        List<CartVO> selectedItems = new ArrayList<>();
        for (String cartId : cartIds) {
            CartVO cartItem = cartDAO.getCartById(cartId);
            if (cartItem != null) {
                selectedItems.add(cartItem);
            }
        }
        
        // 결제 정보를 모델에 추가
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
        
        // 테스트를 위해 고정된 회원번호 사용
        String memNo = "M001";
        
        try {
            // 주문번호 생성 (실제로는 더 안전한 방식 사용 필요)
            String orderNo = "ORD" + UUID.randomUUID().toString().substring(0, 10);
            
            // 결제번호 생성 (실제로는 결제 시스템에서 생성)
            String payNo = "PAY" + UUID.randomUUID().toString().substring(0, 10);
            
            // 주문 객체 생성
            OrderVO order = new OrderVO();
            order.setOrderNo(orderNo);
            order.setMemNo(memNo);
            order.setPayNo(payNo);
            order.setOrderDate(new Date());
            order.setDeliveryFee(3000);  // 기본 배송비
            order.setOrderStatus("주문완료");
            
            // 주문 저장
            orderDAO.insertOrder(order);
            
            // 주문 완료 후 장바구니 아이템 삭제
            for (String cartId : cartIds) {
                cartDAO.deleteCartById(cartId);
            }
            
            redirectAttributes.addFlashAttribute("message", "주문이 성공적으로 완료되었습니다.");
            return "redirect:/mypage/orders";
            
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "주문 처리 중 오류가 발생했습니다.");
            return "redirect:/mypage/order/checkout?cartIds=" + String.join(",", cartIds);
        }
    }
    
    @GetMapping("/detail/{orderNo}")
    public String orderDetail(@PathVariable("orderNo") String orderNo, Model model) {
        OrderVO order = orderDAO.getOrder(orderNo);
        
        if (order == null) {
            return "redirect:/mypage/orders";
        }
        
        model.addAttribute("order", order);
        return "mypage/order/detail";
    }
    
    @GetMapping("/list")
    public String getOrderList(Model model) {
        String memNo = "M001"; // 테스트용 회원번호
        List<OrderVO> orderList = orderDAO.getOrderList(memNo);
        model.addAttribute("orderList", orderList);
        return "mypage/order/list";
    }
} 