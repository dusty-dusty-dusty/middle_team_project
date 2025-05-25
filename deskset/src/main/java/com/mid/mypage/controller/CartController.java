package com.mid.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

@Controller
@RequestMapping(value = {"/mypage/cart", "/deskset/mypage/cart"})
public class CartController {
    private static final Logger logger = LoggerFactory.getLogger(CartController.class);
    
    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String viewCart(Model model) {
        logger.info("장바구니 페이지 접속");
        return "mypage/basket";
    }
} 