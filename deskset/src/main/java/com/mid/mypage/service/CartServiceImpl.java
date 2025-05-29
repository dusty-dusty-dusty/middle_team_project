package com.mid.mypage.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mid.mypage.model.CartVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class CartServiceImpl implements CartService {

    private static final Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<CartVO> getCartList(String memNo) {
        logger.info("=== 장바구니 조회 시작 ===");
        logger.info("회원번호: {}", memNo);
        
        try {
            logger.info("장바구니 목록 조회 시작");
            List<CartVO> result = sqlSession.selectList("com.mid.mypage.mappers.CartMapper.getCartList", memNo);
            
            if (result == null) {
                logger.warn("장바구니 조회 결과가 null입니다.");
                return null;
            }
            
            logger.info("조회된 장바구니 데이터: {}", result);
            logger.info("조회된 장바구니 개수: {}", result.size());
            
            for (CartVO cart : result) {
                logger.info("장바구니 상품 상세 - ID: {}, 상품명: {}, 가격: {}, 수량: {}, 썸네일: {}", 
                    new Object[] {
                        cart.getCartId(),
                        cart.getProductName(),
                        cart.getProductPrice(),
                        cart.getCartQuantity(),
                        cart.getProductThum()
                    });
            }
            
            return result;
        } catch (Exception e) {
            logger.error("장바구니 조회 중 오류 발생", e);
            throw e;
        }
    }
}
