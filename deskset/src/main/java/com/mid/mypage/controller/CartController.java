package com.mid.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.mid.mypage.model.CartVO;
import com.mid.mypage.service.CartService;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpSession;
import org.springframework.http.ResponseEntity;

@Controller
@RequestMapping({"/mypage/cart", "/deskset/mypage/cart"})
public class CartController {

    private static final Logger logger = LoggerFactory.getLogger(CartController.class);

    @Autowired
    private CartService cartService;

    @GetMapping({"", "/basket"})
    public String basket(@RequestParam(required = false, defaultValue = "1") int page, Model model, HttpSession session) {
        logger.info("=== 장바구니 페이지 접속 ===");
        
        // 세션에서 회원번호 가져오기
        String memNo = (String) session.getAttribute("memNo");
        logger.info("세션에서 가져온 회원번호: {}", memNo);
        
        // 세션에 회원번호가 없으면 임시 회원번호 사용
        if (memNo == null || memNo.trim().isEmpty()) {
            memNo = "MEM000001";
            logger.info("세션에 회원번호가 없어 임시 회원번호 사용: {}", memNo);
        }
        
        // 장바구니 목록 조회
        logger.info("장바구니 목록 조회 시작 - 회원번호: {}", memNo);
        List<CartVO> cartList = cartService.getCartList(memNo);
        logger.info("장바구니 목록 조회 완료 - 조회된 상품 수: {}", cartList != null ? cartList.size() : 0);
        
        if (cartList != null) {
            for (CartVO cart : cartList) {
                String logMessage = String.format("장바구니 상품 - ID: %s, 상품명: %s, 가격: %d, 수량: %d",
                    cart.getCartId(),
                    cart.getProductName(),
                    cart.getProductPrice(),
                    cart.getCartQuantity());
                logger.info(logMessage);
            }
        }
        
        model.addAttribute("cartList", cartList);
        model.addAttribute("currentPage", page);
        return "mypage/basket";
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

    @PostMapping("/updateCartQuantity")
    @ResponseBody
    public String updateCartQuantity() {
        return "{\"success\": true}";
    }

    @GetMapping("/list")
    public ResponseEntity<List<CartVO>> getCartList(HttpSession session) {
        String memNo = (String) session.getAttribute("memNo");
        if (memNo == null) {
            memNo = "MEM000001"; // Fallback to temporary member number if not logged in
            logger.info("No session member number found in API call, using temporary member number: {}", memNo);
        }
        
        List<CartVO> cartList = cartService.getCartList(memNo);
        logger.info("API call - Retrieved cart list for member {}: {} items", memNo, cartList != null ? cartList.size() : 0);
        return ResponseEntity.ok(cartList);
    }
}
