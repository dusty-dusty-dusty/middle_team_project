package com.mid.mypage.service;

import java.util.List; // 리스트 사용
import org.springframework.beans.factory.annotation.Autowired; // 의존성 주입
import org.springframework.stereotype.Service; // 서비스 어노테이션
import com.mid.mypage.model.CartVO; // 장바구니 VO
import org.apache.ibatis.session.SqlSession; // MyBatis 세션
import org.slf4j.Logger; // 로깅
import org.slf4j.LoggerFactory; // 로깅
import java.util.Map; // 맵 사용

@Service // 서비스 빈 등록
public class CartServiceImpl extends CartService {

    private static final Logger logger = LoggerFactory.getLogger(CartServiceImpl.class); // 로거 생성

    @Autowired // MyBatis SqlSession 의존성 주입
    private SqlSession sqlSession;

    @Override
    public List<CartVO> getCartList(String memNo) {
        logger.info("=== 장바구니 조회 시작 ==="); // 로그 출력
        logger.info("회원번호: {}", memNo); // 회원번호 로그
        
        try {
            logger.info("장바구니 목록 조회 시작"); // 로그
            List<CartVO> result = sqlSession.selectList("com.mid.mypage.mappers.CartMapper.getCartList", memNo); // 장바구니 목록 조회
            
            if (result == null) {
                logger.warn("장바구니 조회 결과가 null입니다."); // null 체크
                return null;
            }
            
            logger.info("조회된 장바구니 데이터: {}", result); // 결과 로그
            logger.info("조회된 장바구니 개수: {}", result.size()); // 개수 로그
            
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
            
            return result; // 결과 반환
        } catch (Exception e) {
            logger.error("장바구니 조회 중 오류 발생", e); // 에러 로그
            throw e; // 예외 재발생
        }
    }

    @Override
    public int updateCartQuantity(String cartId, int quantity) {
        logger.info("[Service] updateCartQuantity 호출 - cartId: {}, quantity: {}", cartId, quantity); // 로그
        int result = sqlSession.update("com.mid.mypage.mappers.CartMapper.updateCartQuantity", Map.of("cartId", cartId, "quantity", quantity)); // 수량 변경
        logger.info("[Service] updateCartQuantity 결과 - cartId: {}, quantity: {}, result: {}", new Object[]{cartId, quantity, result}); // 결과 로그
        return result; // 결과 반환
    }

    @Override
    public int deleteCartByIds(List<String> cartIds) {
        logger.info("장바구니 선택 삭제 - cartIds: {}", cartIds); // 로그
        try {
            int result = sqlSession.delete("com.mid.mypage.mappers.CartMapper.deleteCartByIds", cartIds); // 선택 삭제
            logger.info("선택 삭제 결과: {}", result); // 결과 로그
            return result; // 결과 반환
        } catch (Exception e) {
            logger.error("장바구니 선택 삭제 중 오류 발생", e); // 에러 로그
            throw e; // 예외 재발생
        }
    }

    @Override
    public List<CartVO> getCartListPaged(String memNo, int startRow, int endRow) {
        logger.info("[Service] getCartListPaged - memNo: {}, startRow: {}, endRow: {}", new Object[]{memNo, startRow, endRow}); // 로그
        return sqlSession.selectList("com.mid.mypage.mappers.CartMapper.getCartListPaged", Map.of("memNo", memNo, "startRow", startRow, "endRow", endRow)); // 페이징 목록 조회
    }

    @Override
    public int getCartCount(String memNo) {
        logger.info("[Service] getCartCount - memNo: {}", memNo); // 로그
        return sqlSession.selectOne("com.mid.mypage.mappers.CartMapper.getCartCount", memNo); // 개수 조회
    }

    @Override
    public int getTotalPriceByCartIds(List<String> cartIds) {
        Integer total = sqlSession.selectOne("com.mid.mypage.mappers.CartMapper.getTotalPriceByCartIds", cartIds); // 총액 조회
        return total != null ? total : 0; // null이면 0 반환
    }

    @Override
    public int increaseCartQuantity(String memNo, String productNo, int addQty) {
        return sqlSession.update("com.mid.mypage.mappers.CartMapper.increaseCartQuantity",
            Map.of("memNo", memNo, "productNo", productNo, "addQty", addQty)); // 수량 증가
    }

    @Override
    public int addToCart(String memNo, String productNo, int quantity) {
        // cart_id는 UUID로 생성 (예시)
        String cartId = java.util.UUID.randomUUID().toString(); // UUID 생성
        return sqlSession.insert("com.mid.mypage.mappers.CartMapper.addToCart",
            Map.of("cartId", cartId, "memNo", memNo, "productNo", productNo, "quantity", quantity)); // 장바구니 추가
    }

    @Override
    public boolean existsCartItem(String memNo, String productNo) {
        Integer count = sqlSession.selectOne("com.mid.mypage.mappers.CartMapper.existsCartItem",
            Map.of("memNo", memNo, "productNo", productNo)); // 중복 체크
        return count != null && count > 0; // 1개 이상이면 true
    }
}
