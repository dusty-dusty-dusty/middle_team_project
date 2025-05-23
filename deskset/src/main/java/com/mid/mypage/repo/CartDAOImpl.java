package com.mid.mypage.repo;

import java.util.List;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.mid.mypage.model.CartVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class CartDAOImpl implements CartDAO {
    
    private static final Logger logger = LoggerFactory.getLogger(CartDAOImpl.class);
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public List<CartVO> getCartList(String memNo) {
        logger.info("getCartList 호출 - memNo: {}", memNo);
        List<CartVO> result = sqlSession.selectList("com.mid.mypage.mapper.CartMapper.getCartList", memNo);
        logger.info("getCartList 결과 개수: {}", result != null ? result.size() : 0);
        return result;
    }
    
    @Override
    public List<CartVO> getCartListPaged(String memNo, int page, int pageSize) {
        int start = (page - 1) * pageSize;
        int end = page * pageSize;
        
        java.util.Map<String, Object> params = new java.util.HashMap<>();
        params.put("memNo", memNo);
        params.put("start", start);
        params.put("end", end);
        
        logger.info("getCartListPaged 호출 - memNo: {}, start: {}, end: {}", memNo, start, end);
        List<CartVO> result = sqlSession.selectList("com.mid.mypage.mapper.CartMapper.getCartListPaged", params);
        logger.info("getCartListPaged 결과 개수: {}", result != null ? result.size() : 0);
        return result;
    }
    
    @Override
    public int getCartCount(String memNo) {
        logger.info("getCartCount 호출 - memNo: {}", memNo);
        return sqlSession.selectOne("com.mid.mypage.mapper.CartMapper.getCartCount", memNo);
    }
    
    @Override
    public void insertCart(CartVO cart) {
        if (cart.getCartId() == null || cart.getCartId().isEmpty()) {
            cart.setCartId("CART_" + System.currentTimeMillis());
        }
        logger.info("insertCart 호출 - cart: {}", cart);
        sqlSession.insert("com.mid.mypage.mapper.CartMapper.insertCart", cart);
    }
    
    @Override
    public void deleteCart(String memNo, String productNo) {
        java.util.Map<String, String> params = new java.util.HashMap<>();
        params.put("memNo", memNo);
        params.put("productNo", productNo);
        logger.info("deleteCart 호출 - memNo: {}, productNo: {}", memNo, productNo);
        sqlSession.delete("com.mid.mypage.mapper.CartMapper.deleteCart", params);
    }
    
    @Override
    public void deleteCartByProductNo(String memNo, String productNo) {
        java.util.Map<String, String> params = new java.util.HashMap<>();
        params.put("memNo", memNo);
        params.put("productNo", productNo);
        logger.info("deleteCartByProductNo 호출 - memNo: {}, productNo: {}", memNo, productNo);
        sqlSession.delete("com.mid.mypage.mapper.CartMapper.deleteCartByProductNo", params);
    }
    
    @Override
    public void updateCartQuantity(String memNo, String productNo, int cartQuantity) {
        java.util.Map<String, Object> params = new java.util.HashMap<>();
        params.put("memNo", memNo);
        params.put("productNo", productNo);
        params.put("cartQuantity", cartQuantity);
        logger.info("updateCartQuantity 호출 - memNo: {}, productNo: {}, cartQuantity: {}", memNo, productNo, cartQuantity);
        sqlSession.update("com.mid.mypage.mapper.CartMapper.updateCartQuantity", params);
    }
    
    @Override
    public void updateCartQuantityByProduct(String memNo, String productNo, int cartQuantity) {
        java.util.Map<String, Object> params = new java.util.HashMap<>();
        params.put("memNo", memNo);
        params.put("productNo", productNo);
        params.put("cartQuantity", cartQuantity);
        logger.info("updateCartQuantityByProduct 호출 - memNo: {}, productNo: {}, cartQuantity: {}", memNo, productNo, cartQuantity);
        sqlSession.update("com.mid.mypage.mapper.CartMapper.updateCartQuantityByProduct", params);
    }

    @Override
    public void deleteCartById(String cartId) {
        logger.info("deleteCartById 호출 - cartId: {}", cartId);
        sqlSession.delete("com.mid.mypage.mapper.CartMapper.deleteCartById", cartId);
    }

    @Override
    public CartVO getCartById(String cartId) {
        logger.info("getCartById 호출 - cartId: {}", cartId);
        return sqlSession.selectOne("com.mid.mypage.mapper.CartMapper.getCartById", cartId);
    }
    
    @Override
    public List<CartVO> getCartListByMemberId(String memId) {
        logger.info("getCartListByMemberId 호출 - memId: {}", memId);
        List<CartVO> result = sqlSession.selectList("com.mid.mypage.mapper.CartMapper.getCartListByMemberId", memId);
        logger.info("getCartListByMemberId 결과 개수: {}", result != null ? result.size() : 0);
        return result;
    }
} 