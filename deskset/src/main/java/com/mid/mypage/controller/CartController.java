package com.mid.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping({"/mypage/cart", "/deskset/mypage/cart"})
public class CartController {

    @GetMapping("")
    public String getCartList(Model model) {
        // 모델 작업도 없다가정 → 뷰에서 빈 리스트 처리
        return "mypage/cart";
    }

    @PostMapping("/add")
    @ResponseBody
    public String addToCart() {
        // 항상 성공
        return "success";
    }

    @PutMapping("/update")
    @ResponseBody
    public String updateCart() {
        // 항상 성공
        return "success";
    }

    @DeleteMapping("/delete/{cartId}")
    @ResponseBody
    public String deleteCart() {
        // 항상 성공
        return "success";
    }

    @DeleteMapping("/delete")
    @ResponseBody
    public String deleteCartItem() {
        // 항상 성공
        return "success";
    }

    @GetMapping("basket")
    public String basket(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        model.addAttribute("currentPage", page);
        return "mypage/basket";
    }

    @PostMapping("/updateCartQuantity")
    @ResponseBody
    public String updateCartQuantity() {
        return "{\"success\": true}";
    }
}
