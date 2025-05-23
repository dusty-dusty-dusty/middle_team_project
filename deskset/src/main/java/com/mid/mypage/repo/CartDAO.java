package com.mid.mypage.repo;

import java.util.List;
import com.mid.mypage.model.CartVO;

public interface CartDAO {
    List<CartVO> getCartList(String memId);
    List<CartVO> getCartListPaged(String memId, int page, int pageSize);
    int getCartCount(String memId);
    void insertCart(CartVO cart);
    void deleteCart(String memNo, String productNo);
    void deleteCartByProductNo(String memNo, String productNo);
    void updateCartQuantity(String memNo, String productNo, int cartQuantity);
    void updateCartQuantityByProduct(String memNo, String productNo, int cartQuantity);
    
    // 장바구니 ID로 항목 삭제
    void deleteCartById(String cartId);
    
    // 장바구니 ID로 항목 조회
    CartVO getCartById(String cartId);
    
    // 회원 ID로 장바구니 조회
    List<CartVO> getCartListByMemberId(String memId);
} 