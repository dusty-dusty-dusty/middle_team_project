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
import java.util.Map;
import java.util.HashMap;
import com.mid.login.model.UserInfoVO;

/**
 * 장바구니(Cart) 관련 기능을 담당하는 컨트롤러
 * - 장바구니 목록 조회, 추가, 수량 변경, 삭제, 총액 계산 등
 */
@Controller
@RequestMapping({"/mypage/cart", "/deskset/mypage/cart"})
public class CartController {

    private static final Logger logger = LoggerFactory.getLogger(CartController.class);

    @Autowired
    private CartService cartService;

    /**
     * 장바구니(카트) 페이지 진입 및 페이징 처리
     * - 세션에서 회원번호를 가져와 해당 회원의 장바구니 목록을 조회
     * - 페이징 정보와 함께 cartList를 모델에 담아 cart.jsp로 전달
     */
    @GetMapping({"", "/cart"})
    public String cart(@RequestParam(required = false, defaultValue = "1") int page, Model model, HttpSession session) {
        UserInfoVO user = (UserInfoVO) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/user/login";
        }
        String memNo = user.getMemNo();
        logger.info("=== 장바구니 페이지 접속 ===");
        // 페이징 계산
        int pageSize = 20;
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;
        int totalCount = cartService.getCartCount(memNo);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        logger.info("장바구니 페이징 - page: {}, startRow: {}, endRow: {}, totalCount: {}, totalPages: {}", new Object[]{page, startRow, endRow, totalCount, totalPages});
        // 장바구니 목록 조회
        List<CartVO> cartList = cartService.getCartListPaged(memNo, startRow, endRow);
        // 모델에 데이터 담기
        model.addAttribute("cartList", cartList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("pageSize", pageSize);
        return "mypage/cart";
    }

    /**
     * 장바구니에 상품 추가(중복시 수량 증가)
     * - 이미 담긴 상품이면 수량만 증가
     * - 없으면 새로 추가
     * - 프론트엔드에 성공/실패 메시지 반환 (모달 안내용)
     */
    @PostMapping("/add")
    @ResponseBody
    public Map<String, Object> addToCart(@RequestParam("productNo") String productNo,
                                         @RequestParam(value = "quantity", defaultValue = "1") int quantity,
                                         HttpSession session) {
        UserInfoVO user = (UserInfoVO) session.getAttribute("loggedInUser");
        Map<String, Object> result = new HashMap<>();
        if (user == null) {
            result.put("success", false);
            result.put("message", "로그인이 필요합니다.");
            return result;
        }
        String memNo = user.getMemNo();
        // 이미 담긴 상품이면 수량만 증가, 없으면 새로 추가
        if (cartService.existsCartItem(memNo, productNo)) {
            cartService.increaseCartQuantity(memNo, productNo, quantity);
            result.put("success", true);
            result.put("message", "이미 담긴 상품입니다. 수량이 증가했습니다.");
            return result;
        }
        cartService.addToCart(memNo, productNo, quantity);
        result.put("success", true);
        result.put("message", "장바구니에 담겼습니다.");
        return result;
    }

    /**
     * 장바구니 항목 수량 변경(Ajax)
     */
    @PostMapping("/updateCartQuantity")
    @ResponseBody
    public Map<String, Object> updateCartQuantity(@RequestParam("cartId") String cartId,
                                                 @RequestParam("quantity") int quantity) {
        // 수량 유효성 검사 및 변경
        Map<String, Object> map = new HashMap<>();
        try {
            if (quantity < 1 || quantity > 99) {
                map.put("success", false);
                map.put("message", "수량은 1~99개만 가능합니다.");
                return map;
            }
            int result = cartService.updateCartQuantity(cartId, quantity);
            map.put("success", result > 0);
            return map;
        } catch (Exception e) {
            map.put("success", false);
            map.put("message", "서버 오류: " + e.getMessage());
            return map;
        }
    }

    /**
     * 장바구니 전체 목록 반환(Ajax)
     */
    @GetMapping("/list")
    public ResponseEntity<List<CartVO>> getCartList(HttpSession session) {
        UserInfoVO user = (UserInfoVO) session.getAttribute("loggedInUser");
        if (user == null) {
            return ResponseEntity.status(401).build();
        }
        String memNo = user.getMemNo();
        List<CartVO> cartList = cartService.getCartList(memNo);
        return ResponseEntity.ok(cartList);
    }

    /**
     * 선택된 장바구니 항목들 삭제
     */
    @PostMapping("/deleteSelected")
    @ResponseBody
    public String deleteSelectedCartItems(@RequestParam("cartIds") List<String> cartIds) {
        // 선택된 cartId 리스트 삭제
        int result = cartService.deleteCartByIds(cartIds);
        return result > 0 ? "{\"success\": true}" : "{\"success\": false}";
    }

    /**
     * 장바구니 항목 단건 삭제(REST, cartId)
     */
    @DeleteMapping("/delete/{cartId}")
    @ResponseBody
    public String deleteCart() {
        // 항상 성공 반환 (구현 필요시 수정)
        return "success";
    }

    /**
     * 장바구니 항목 단건 삭제(REST, 파라미터 없이)
     */
    @DeleteMapping("/delete")
    @ResponseBody
    public String deleteCartItem() {
        // 항상 성공 반환 (구현 필요시 수정)
        return "success";
    }

    /**
     * 장바구니 항목 수정(REST, PUT)
     */
    @PutMapping("/update")
    @ResponseBody
    public String updateCart() {
        // 항상 성공 반환 (구현 필요시 수정)
        return "success";
    }

    /**
     * 선택된 cartId 전체의 총액 계산(Ajax)
     * - 여러 페이지에 걸쳐 선택된 상품의 총액을 서버에서 계산해 반환
     */
    @PostMapping("/totalPrice")
    @ResponseBody
    public Map<String, Object> getTotalPrice(@RequestBody Map<String, List<String>> body) {
        // 선택된 cartId로 총액 계산
        List<String> cartIds = body.get("cartIds");
        int totalPrice = 0;
        if (cartIds != null && !cartIds.isEmpty()) {
            totalPrice = cartService.getTotalPriceByCartIds(cartIds);
        }
        Map<String, Object> result = new HashMap<>();
        result.put("totalPrice", totalPrice);
        return result;
    }

    // 장바구니에서 선택상품 주문/삭제 처리
    @PostMapping("/cartAction.do")
    public String cartAction(@RequestParam("action") String action,
                               @RequestParam(value = "selectedItems", required = false) List<String> selectedItems) {
        // action이 order면 주문, 아니면 장바구니로 리다이렉트
        if ("order".equals(action) && selectedItems != null && !selectedItems.isEmpty()) {
            return "redirect:/mypage/order/checkout?cartIds=" + String.join(",", selectedItems);
        }
        return "redirect:/mypage/cart";
    }
}
