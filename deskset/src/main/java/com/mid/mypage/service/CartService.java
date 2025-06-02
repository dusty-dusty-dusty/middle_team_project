package com.mid.mypage.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.mid.mypage.model.CartVO;

@Service
public abstract class CartService {
    public abstract List<CartVO> getCartList(String memNo);
    public abstract int updateCartQuantity(String cartId, int quantity);
    public abstract int deleteCartByIds(List<String> cartIds);
    public abstract List<CartVO> getCartListPaged(String memNo, int startRow, int endRow);
    public abstract int getCartCount(String memNo);
    public abstract boolean existsCartItem(String memNo, String productNo);
    public abstract void increaseCartQuantity(String memNo, String productNo, int addQty);
    public abstract void addToCart(String memNo, String productNo, int quantity);
    public abstract int getTotalPriceByCartIds(List<String> cartIds);
}
