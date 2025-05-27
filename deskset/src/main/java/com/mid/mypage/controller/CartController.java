package com.mid.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mid.mypage.repo.CartDAO;
import com.mid.mypage.model.CartVO;
import java.util.List;

@Controller
@RequestMapping("/mypage/cart")
public class CartController {
    
    @Autowired
    private CartDAO cartDAO;
    
    @GetMapping("")
    public String getCartList(@SessionAttribute("memNo") String memNo, Model model) {
        List<CartVO> cartList = cartDAO.getCartList(memNo);
        model.addAttribute("cartList", cartList);
        return "mypage/cart";
    }
    
    @PostMapping("/add")
    @ResponseBody
    public String addToCart(@RequestBody CartVO cart) {
        try {
            cartDAO.insertCart(cart);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }
    
    @PutMapping("/update")
    @ResponseBody
    public String updateCart(@RequestParam("memNo") String memNo,
                           @RequestParam("productNo") String productNo,
                           @RequestParam("quantity") int quantity) {
        try {
            cartDAO.updateCartQuantity(memNo, productNo, quantity);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }
    
    @DeleteMapping("/delete/{cartId}")
    @ResponseBody
    public String deleteCart(@PathVariable String cartId) {
        try {
            cartDAO.deleteCartById(cartId);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }
    
    @DeleteMapping("/delete")
    @ResponseBody
    public String deleteCartItem(@RequestParam("memNo") String memNo,
                               @RequestParam("productNo") String productNo) {
        try {
            cartDAO.deleteCart(memNo, productNo);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }
} 