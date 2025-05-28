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

import com.mid.mypage.model.OrderVO;
import com.mid.mypage.repo.OrderDAO;

@Controller
@RequestMapping({"/mypage", "/deskset/mypage"})
public class OrderController {

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

        // CartVO ���떊 鍮� 臾몄옄�뿴 由ъ뒪�듃濡� ��泥�
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
            "二쇰Ц�씠 �꽦怨듭쟻�쑝濡� �셿猷뚮릺�뿀�뒿�땲�떎. (�뜑誘� 二쇰Ц踰덊샇: " + orderNo + ")");
        return "redirect:/mypage/orders";
    }

    @GetMapping("/detail/{orderNo}")
    public String orderDetail(
            @PathVariable("orderNo") String orderNo,
            Model model) {

        OrderVO order = new OrderVO();
        order.setOrderNo(orderNo);
        order.setMemNo("M001");
        order.setOrderDate(new Date());
        order.setOrderStatus("二쇰Ц�셿猷�(�뜑誘�)");

        model.addAttribute("order", order);
        return "mypage/order/detail";
    }

    @GetMapping("/list")
    public String getOrderList(Model model) {
        List<OrderVO> orderList = new ArrayList<>();
        model.addAttribute("orderList", orderList);
        return "mypage/order/list";
    }

    @GetMapping("/orders")
    public String orders(HttpSession session, Model model) {
        System.out.println("====================[DEBUG] orders() 吏꾩엯====================");
        String memNo = "MEM000001";
        System.out.println("[DEBUG] Using memNo: " + memNo);
        List<OrderVO> orderList = orderDAO.getOrderList(memNo);
        System.out.println("[DEBUG] orderList size: " + (orderList != null ? orderList.size() : -1));
        if (orderList != null && !orderList.isEmpty()) {
            for (OrderVO order : orderList) {
                System.out.println("[DEBUG] order: " + order);
            }
        } else {
            System.out.println("[DEBUG] orderList is empty or null");
        }
        model.addAttribute("orderList", orderList);
        System.out.println("====================[DEBUG] orders() 醫낅즺====================");
        return "mypage/orders";
    }

    @GetMapping({"/mypage", "/deskset/mypage", "/mypage/", "/deskset/mypage/"})
    public String mypageRoot() {
        return "redirect:/mypage/order/orders";
    }
}
