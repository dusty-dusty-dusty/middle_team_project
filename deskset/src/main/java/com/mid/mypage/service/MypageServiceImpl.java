package com.mid.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mid.mypage.model.CartVO;
import com.mid.mypage.model.MemberVO;
import com.mid.mypage.model.OrderVO;
import com.mid.mypage.repo.CartDAO;
import com.mid.mypage.repo.MemberDAO;
import com.mid.mypage.repo.OrderDAO;

@Service
public class MypageServiceImpl implements MypageService {
    private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);

    @Autowired
    private MemberDAO memberDAO;
    
    @Autowired
    private OrderDAO orderDAO;
    
    @Autowired
    private CartDAO cartDAO;

    @Override
    public MemberVO getMemberInfo(String memId) {
        logger.info("getMemberInfo 호출 - memId: {}", memId);
        try {
            MemberVO member = memberDAO.getMember(memId);
            logger.info("getMemberInfo 결과: {}", member);
            return member;
        } catch (Exception e) {
            logger.error("getMemberInfo 에러", e);
            throw e;
        }
    }

    @Override
    public boolean updateMemberInfo(MemberVO member) {
        try {
            memberDAO.updateMember(member);
            return true;
        } catch (Exception e) {
            logger.error("updateMemberInfo 에러", e);
            return false;
        }
    }

    @Override
    public boolean checkIdDuplicate(String memId) {
        try {
            return memberDAO.checkIdDuplicate(memId);
        } catch (Exception e) {
            logger.error("checkIdDuplicate 에러", e);
            return false;
        }
    }

    @Override
    public List<OrderVO> getOrdersByMemNo(String memNo) {
        return orderDAO.getOrderList(memNo);
    }

    @Override
    public OrderVO getOrderByOrderNo(String orderNo) {
        return orderDAO.getOrder(orderNo);
    }

    @Override
    public List<OrderVO> getRecentOrders(String memNo, int limit) {
        List<OrderVO> allOrders = orderDAO.getOrderList(memNo);
        return allOrders.subList(0, Math.min(limit, allOrders.size()));
    }

    @Override
    public List<CartVO> getCartItems(String memNo) {
        return cartDAO.getCartList(memNo);
    }

    @Override
    public void addToCart(CartVO cart) {
        cartDAO.insertCart(cart);
    }

    @Override
    public void updateCartItemQuantity(CartVO cart) {
        cartDAO.updateCartQuantity(cart.getMemNo(), cart.getProductNo(), cart.getCartQuantity());
    }

    @Override
    public void removeFromCart(String memNo, String productNo) {
        cartDAO.deleteCart(memNo, productNo);
    }

    @Override
    public void clearCart(String memNo) {
        List<CartVO> cartItems = cartDAO.getCartList(memNo);
        for (CartVO item : cartItems) {
            cartDAO.deleteCart(memNo, item.getProductNo());
        }
    }
} 