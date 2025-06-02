package com.mid.mypage.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mid.mypage.model.CartVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Map;

@Service
public class CartServiceImpl extends CartService {

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

    @Override
    public int updateCartQuantity(String cartId, int quantity) {
        logger.info("[Service] updateCartQuantity 호출 - cartId: {}, quantity: {}", cartId, quantity);
        int result = sqlSession.update("com.mid.mypage.mappers.CartMapper.updateCartQuantity", Map.of("cartId", cartId, "quantity", quantity));
        logger.info("[Service] updateCartQuantity 결과 - cartId: {}, quantity: {}, result: {}", new Object[]{cartId, quantity, result});
        return result;
    }

    @Override
    public int deleteCartByIds(List<String> cartIds) {
        logger.info("장바구니 선택 삭제 - cartIds: {}", cartIds);
        try {
            int result = sqlSession.delete("com.mid.mypage.mappers.CartMapper.deleteCartByIds", cartIds);
            logger.info("선택 삭제 결과: {}", result);
            return result;
        } catch (Exception e) {
            logger.error("장바구니 선택 삭제 중 오류 발생", e);
            throw e;
        }
    }

    @Override
    public List<CartVO> getCartListPaged(String memNo, int startRow, int endRow) {
        logger.info("[Service] getCartListPaged - memNo: {}, startRow: {}, endRow: {}", new Object[]{memNo, startRow, endRow});
        return sqlSession.selectList("com.mid.mypage.mappers.CartMapper.getCartListPaged", Map.of("memNo", memNo, "startRow", startRow, "endRow", endRow));
    }

    @Override
    public int getCartCount(String memNo) {
        logger.info("[Service] getCartCount - memNo: {}", memNo);
        return sqlSession.selectOne("com.mid.mypage.mappers.CartMapper.getCartCount", memNo);
    }

    @Override
    public boolean existsCartItem(String memNo, String productNo) {
        Integer count = sqlSession.selectOne(
            "com.mid.mypage.mappers.CartMapper.existsCartItem",
            Map.of("memNo", memNo, "productNo", productNo)
        );
        return count != null && count > 0;
    }

    @Override
    public void increaseCartQuantity(String memNo, String productNo, int addQty) {
        sqlSession.update(
            "com.mid.mypage.mappers.CartMapper.increaseCartQuantity",
            Map.of("memNo", memNo, "productNo", productNo, "addQty", addQty)
        );
    }

    @Override
    public void addToCart(String memNo, String productNo, int quantity) {
        String cartId = java.util.UUID.randomUUID().toString();
        sqlSession.insert(
            "com.mid.mypage.mappers.CartMapper.addToCart",
            Map.of("cartId", cartId, "memNo", memNo, "productNo", productNo, "quantity", quantity)
        );
    }

    @Override
    public int getTotalPriceByCartIds(List<String> cartIds) {
        Integer total = sqlSession.selectOne(
            "com.mid.mypage.mappers.CartMapper.getTotalPriceByCartIds",
            cartIds
        );
        return total != null ? total : 0;
    }
}
