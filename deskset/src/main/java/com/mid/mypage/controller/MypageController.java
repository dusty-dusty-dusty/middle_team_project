package com.mid.mypage.controller; // 컨트롤러 클래스가 위치한 패키지 선언

import java.util.List; // 자바 리스트 자료구조 import
import java.util.Date; // Date 클래스 import
import java.util.ArrayList; // ArrayList import
import java.util.HashMap; // HashMap import
import java.util.Map; // Map import
import java.lang.StringBuilder;
import java.util.Collections;

import javax.servlet.http.HttpSession; // HTTP 세션 관리를 위한 클래스 import

import org.springframework.beans.factory.annotation.Autowired; // 의존성 주입을 위한 어노테이션
import org.springframework.stereotype.Controller; // 스프링 MVC 컨트롤러 어노테이션 import
import org.springframework.ui.Model; // 뷰에 데이터를 전달하기 위한 모델 객체 import
import org.springframework.web.bind.annotation.GetMapping; // HTTP GET 요청 매핑 어노테이션 import
import org.springframework.web.bind.annotation.PostMapping; // HTTP POST 요청 매핑 어노테이션 import
import org.springframework.web.bind.annotation.RequestMapping; // 요청 URL 매핑 어노테이션 import
import org.springframework.web.bind.annotation.RequestParam; // 요청 파라미터 바인딩 어노테이션 import
import org.springframework.web.bind.annotation.ResponseBody; // HTTP 응답 본문에 직접 데이터를 반환하는 어노테이션 import
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes; // 리다이렉트 시 데이터를 전달하는 객체 import
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mid.mypage.model.CartVO;
import com.mid.mypage.model.MemberVO;
import com.mid.mypage.model.OrderVO;
import com.mid.mypage.repo.CartDAO;
import com.mid.mypage.repo.MemberDAO;
import com.mid.mypage.repo.OrderDAO;
import com.mid.mypage.service.MypageService;

@Controller // 이 클래스가 스프링 MVC 컨트롤러임을 명시
@RequestMapping({"/mypage", "/deskset/mypage"})
public class MypageController { // 마이페이지 관련 요청을 처리하는 컨트롤러 클래스 시작
    private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
    private static final String TEST_MEMBER_ID = "hong123";

    @Autowired
    private OrderDAO orderDAO; // OrderDAO 의존성 주입
    
    @Autowired
    private CartDAO cartDAO; // CartDAO 의존성 주입
    
    @Autowired
    private MemberDAO memberDAO;  // MemberDAO 추가
    
    @Autowired
    private MypageService mypageService;
    
    // 기본 경로 처리
    @GetMapping("")
    public String myPage(HttpSession session) {
        if (session.getAttribute("memId") == null) {
            session.setAttribute("memId", TEST_MEMBER_ID);
            logger.info("세션에 테스트 회원 ID 설정: {}", TEST_MEMBER_ID);
        }
        return "redirect:/deskset/mypage/orders";
    }

    @GetMapping("/orders")
    public String orders(HttpSession session, Model model) {
        try {
            String memId = (String) session.getAttribute("memId");
            if (memId == null) {
                memId = TEST_MEMBER_ID;
                session.setAttribute("memId", memId);
                logger.info("세션에 테스트 회원 ID 설정: {}", memId);
            }
            logger.info("주문 목록 조회 - memId: {}", memId);
            
            // 회원ID로 주문 목록 조회
            List<OrderVO> orderListById = orderDAO.getOrderListByMemberId(memId);
            
            // 회원번호로도 주문 목록 조회 (M001)
            List<OrderVO> orderListByNo = orderDAO.getOrderList("M001");
            
            // 두 리스트 합치기 (중복 제거)
            List<OrderVO> combinedList = new ArrayList<>();
            combinedList.addAll(orderListById);
            for (OrderVO order : orderListByNo) {
                boolean isDuplicate = false;
                for (OrderVO existingOrder : combinedList) {
                    if (existingOrder.getOrderNo().equals(order.getOrderNo())) {
                        isDuplicate = true;
                        break;
                    }
                }
                if (!isDuplicate) {
                    combinedList.add(order);
                }
            }
            
            // 주문일자 기준 내림차순 정렬
            Collections.sort(combinedList, (o1, o2) -> o2.getOrderDate().compareTo(o1.getOrderDate()));
            
            model.addAttribute("orderList", combinedList);
            return "mypage/orders";
        } catch (Exception e) {
            logger.error("주문 목록 조회 중 오류", e);
            model.addAttribute("errorMessage", "주문 목록을 가져오는 중 오류가 발생했습니다.");
            return "mypage/orders";
        }
    }

    @GetMapping("/basket")
    public String basket(HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        String memId = (String) session.getAttribute("memId");
        if (memId == null) {
            memId = TEST_MEMBER_ID;
            session.setAttribute("memId", memId);
            logger.info("세션에 테스트 회원 ID 설정: {}", memId);
        }
        logger.info("장바구니 조회 - memId: {}", memId);
        
        try {
            // 회원 정보 조회
            MemberVO member = mypageService.getMemberInfo(memId);
            if (member == null) {
                model.addAttribute("errorMessage", "회원 정보를 찾을 수 없습니다.");
                return "mypage/basket";
            }
            
            String memNo = member.getMemNo();
            int pageSize = 10;
            
            // 회원번호로 장바구니 조회
            List<CartVO> cartList = cartDAO.getCartList(memNo);
            logger.info("장바구니 조회 결과 - 항목 수: {}", cartList != null ? cartList.size() : 0);
            
            // 페이징 처리
            int totalItems = cartList != null ? cartList.size() : 0;
            int totalPages = (totalItems + pageSize - 1) / pageSize;
            if (totalPages < 1) totalPages = 1;
            
            if (page < 1) page = 1;
            if (page > totalPages) page = totalPages;
            
            // 현재 페이지에 해당하는 항목들만 선택
            int start = (page - 1) * pageSize;
            int end = Math.min(start + pageSize, totalItems);
            List<CartVO> pagedList = cartList != null ? cartList.subList(start, end) : new ArrayList<>();
            
            model.addAttribute("cartList", pagedList);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("member", member);
        
            return "mypage/basket";
        } catch (Exception e) {
            logger.error("장바구니 조회 중 오류", e);
            model.addAttribute("errorMessage", "장바구니 정보를 가져오는 중 오류가 발생했습니다.");
            return "mypage/basket";
        }
    }

    @GetMapping("/check-profile")
    public String checkProfile(HttpSession session, Model model) {
        if (session.getAttribute("memId") == null) {
            session.setAttribute("memId", TEST_MEMBER_ID);
            logger.info("세션에 테스트 회원 ID 설정: {}", TEST_MEMBER_ID);
        }
        
        String memId = (String) session.getAttribute("memId");
        logger.info("프로필 확인 - memId: {}", memId);
        
        try {
            MemberVO member = mypageService.getMemberInfo(memId);
            logger.info("회원 정보 조회 결과: {}", member);
            
            if (member == null) {
                logger.warn("회원 정보를 찾을 수 없음: {}", memId);
                model.addAttribute("errorMessage", "회원 정보를 찾을 수 없습니다.");
                return "mypage/check-profile";
            }

            model.addAttribute("member", member);
            return "mypage/check-profile";
        } catch (Exception e) {
            logger.error("회원 정보 조회 중 오류", e);
            model.addAttribute("errorMessage", "회원 정보 조회 중 오류가 발생했습니다.");
            return "mypage/check-profile";
        }
    }

    @GetMapping("/edit-profile")
    public String editProfileForm(HttpSession session, Model model) {
        String memId = (String) session.getAttribute("memId");
        MemberVO member = mypageService.getMemberInfo(memId);
        model.addAttribute("member", member);
        return "mypage/edit-profile";
    }
    
    @PostMapping("/edit-profile")
    public String updateProfile(@ModelAttribute MemberVO member, HttpSession session, RedirectAttributes rttr) {
        try {
            boolean result = mypageService.updateMemberInfo(member);
            if (result) {
                rttr.addFlashAttribute("message", "회원정보가 성공적으로 수정되었습니다.");
            } else {
                rttr.addFlashAttribute("error", "회원정보 수정에 실패했습니다.");
            }
        } catch (Exception e) {
            logger.error("회원정보 수정 중 오류", e);
            rttr.addFlashAttribute("error", "회원정보 수정 중 오류가 발생했습니다.");
        }
        return "redirect:/deskset/mypage/check-profile";
    }

    @PostMapping("/change-password")
    @ResponseBody
    public ResponseEntity<String> changePassword(
            @RequestParam String currentPassword,
            @RequestParam String newPassword,
            HttpSession session) {
        try {
            String memId = (String) session.getAttribute("memId");
            MemberVO member = mypageService.getMemberInfo(memId);
            
            if (!member.getMemPwd().equals(currentPassword)) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body("현재 비밀번호가 일치하지 않습니다.");
            }
            
            memberDAO.updatePassword(member.getMemNo(), newPassword);
            return ResponseEntity.ok("비밀번호가 성공적으로 변경되었습니다.");
        } catch (Exception e) {
            logger.error("비밀번호 변경 중 오류", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("비밀번호 변경 중 오류가 발생했습니다.");
        }
    }

    @PostMapping("/check-id")
    @ResponseBody
    public boolean checkIdDuplicate(String memId) {
        return mypageService.checkIdDuplicate(memId);
    }

    @PostMapping("/basketAction.do")
    public String basketAction(
        @RequestParam("action") String action,
        @RequestParam(value = "selectedItems", required = false) List<String> selectedItems,
        @RequestParam(value = "memNos", required = false) List<String> memNos,
        @RequestParam(value = "productNos", required = false) List<String> productNos,
        @RequestParam(value = "quantities", required = false) List<Integer> quantities,
        @RequestParam(value = "cartIds", required = false) List<String> cartIds,
        HttpSession session,
        RedirectAttributes redirectAttributes
    ) {
        // 테스트를 위해 고정된 회원번호 사용
        String memNo = "M001";

        if ("delete".equals(action)) { // 액션이 "delete"인 경우 (선택 상품 삭제)
            if (selectedItems == null || selectedItems.isEmpty()) {
                redirectAttributes.addFlashAttribute("errorMessage", "선택된 상품이 없습니다.");
                return "redirect:/mypage/basket"; // 장바구니 페이지로 리다이렉트
            }
            
            // 선택한 상품 삭제 처리
            try {
                for (String item : selectedItems) {
                    // 장바구니 ID가 있는 경우 ID로 삭제, 없으면 memNo_productNo 형식으로 분리하여 삭제
                    if (item.contains("_")) {
                        String[] parts = item.split("_");
                        if (parts.length == 2) {
                            String itemMemNo = parts[0];
                            String itemProductNo = parts[1];
                            cartDAO.deleteCart(itemMemNo, itemProductNo);
                        }
                    } else {
                        // 장바구니 ID로 직접 삭제
                        cartDAO.deleteCartById(item);
                    }
                }
                redirectAttributes.addFlashAttribute("successMessage", "선택한 상품이 장바구니에서 삭제되었습니다.");
            } catch (Exception e) {
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("errorMessage", "상품 삭제 중 오류가 발생했습니다.");
            }
        } else if ("update".equals(action)) { // 액션이 "update"인 경우 (수량 변경 저장)
            if (memNos == null || memNos.isEmpty() || productNos == null || productNos.isEmpty() || 
                quantities == null || quantities.isEmpty() || 
                memNos.size() != productNos.size() || memNos.size() != quantities.size()) {
                redirectAttributes.addFlashAttribute("errorMessage", "수량 업데이트 정보가 올바르지 않습니다.");
                return "redirect:/mypage/basket";
            }
            
            try {
                // 모든 장바구니 항목의 수량 한 번에 업데이트
                for (int i = 0; i < memNos.size(); i++) {
                    String itemMemNo = memNos.get(i);
                    String itemProductNo = productNos.get(i);
                    int quantity = quantities.get(i);
                    
                    // 수량 범위 검증 (1-99)
                    if (quantity < 1) quantity = 1;
                    if (quantity > 99) quantity = 99;
                    
                    // 수량 업데이트
                    cartDAO.updateCartQuantity(itemMemNo, itemProductNo, quantity);
                }
                redirectAttributes.addFlashAttribute("successMessage", "장바구니 수량이 업데이트되었습니다.");
            } catch (Exception e) {
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("errorMessage", "수량 업데이트 중 오류가 발생했습니다.");
            }
        } else if ("order".equals(action)) { // 액션이 "order"인 경우
            if (selectedItems == null || selectedItems.isEmpty()) {
                redirectAttributes.addFlashAttribute("errorMessage", "선택된 상품이 없습니다.");
                return "redirect:/mypage/basket"; // 장바구니 페이지로 리다이렉트
            }
            
            // cartIds 목록 생성 (memNo_productNo 형식을 cartId로 조회해야 하는 경우를 처리)
            List<String> orderCartIds = new ArrayList<>();
            for (String item : selectedItems) {
                if (item.contains("_")) {
                    // 향후 구현: memNo_productNo 형식을 cartId로 변환하는 로직 (현재는 그대로 전달)
                    orderCartIds.add(item);
                } else {
                    // 이미 cartId인 경우
                    orderCartIds.add(item);
                }
            }
            
            // 주문 처리
            return "redirect:/order/checkout?cartIds=" + String.join(",", orderCartIds);
        }

        return "redirect:/mypage/basket"; // 장바구니 페이지로 리다이렉트
    }

    @PostMapping("/updateCartQuantity")
    @ResponseBody
    public String updateCartQuantity(
            @RequestParam("memNo") String memNo,
            @RequestParam("productNo") String productNo,
            @RequestParam("quantity") int cartQuantity,
            HttpSession session) {
        
        try {
            // 수량 범위 검증
            if (cartQuantity < 1 || cartQuantity > 99) {
                return "{\"success\": false, \"message\": \"수량은 1에서 99 사이여야 합니다.\"}";
            }
            
            // 수량 업데이트 (먼저 수행)
            cartDAO.updateCartQuantity(memNo, productNo, cartQuantity);
            
            // 테스트를 위해 고정된 회원번호는 이미 memNo로 받음
            
            // 장바구니 항목 정보 조회 시도 (선택적)
            StringBuilder jsonResponse = new StringBuilder();
            jsonResponse.append("{\"success\": true, \"message\": \"수량이 업데이트되었습니다.\"");
            
            try {
                List<CartVO> cartList = cartDAO.getCartList(memNo);
                
                CartVO cartItem = null;
                for (CartVO item : cartList) {
                    if (item.getProductNo().equals(productNo)) {
                        cartItem = item;
                        break;
                    }
                }
                
                if (cartItem != null) {
                    int unitPrice = cartItem.getProductPrice();
                    int totalPrice = unitPrice * cartQuantity;
                    
                    jsonResponse.append(", \"unitPrice\": ").append(unitPrice);
                    jsonResponse.append(", \"totalPrice\": ").append(totalPrice);
                    jsonResponse.append(", \"formattedTotalPrice\": \"").append(String.format("%,d원", totalPrice)).append("\"");
                }
            } catch (Exception e) {
                // 조회 실패해도 업데이트는 성공했으므로 무시
                e.printStackTrace();
            }
            
            jsonResponse.append("}");
            return jsonResponse.toString();
            
        } catch (Exception e) {
            e.printStackTrace(); // 서버 로그에만 출력
            return "{\"success\": false, \"message\": \"수량 업데이트 중 오류가 발생했습니다.\"}";
        }
    }
} // 컨트롤러 클래스 종료