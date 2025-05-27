package com.mid.mypage.service;

import java.util.List;

import com.mid.mypage.model.CartVO;
import com.mid.mypage.model.MemberVO;
import com.mid.mypage.model.OrderVO;

public interface MypageService {
    // 회원 정보 관련 메서드
    public MemberVO getMemberInfo(String memId);
    public boolean updateMemberInfo(MemberVO member);
    public boolean checkIdDuplicate(String memId);
    
    // 주문 관련 메서드
    public List<OrderVO> getOrdersByMemNo(String memNo);
    public OrderVO getOrderByOrderNo(String orderNo);
    public List<OrderVO> getRecentOrders(String memNo, int limit);

    // 장바구니 관련 메서드
    public List<CartVO> getCartItems(String memNo);
    public void addToCart(CartVO cart);
    public void updateCartItemQuantity(CartVO cart);
    public void removeFromCart(String memNo, String productNo);
    public void clearCart(String memNo);
} 