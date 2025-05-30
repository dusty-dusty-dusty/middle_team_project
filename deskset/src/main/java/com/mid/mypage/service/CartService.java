package com.mid.mypage.service;

import java.util.List; // 리스트 사용
import org.springframework.stereotype.Service; // 서비스 어노테이션
import com.mid.mypage.model.CartVO; // 장바구니 VO

@Service // 서비스 빈 등록
public abstract class CartService {
    public abstract List<CartVO> getCartList(String memNo); // 장바구니 목록 조회
    public abstract int updateCartQuantity(String cartId, int quantity); // 수량 변경
    public abstract int deleteCartByIds(List<String> cartIds); // 선택 삭제
    public abstract List<CartVO> getCartListPaged(String memNo, int startRow, int endRow); // 페이징 목록 조회
    public abstract int getCartCount(String memNo); // 장바구니 개수 조회
    public abstract int getTotalPriceByCartIds(List<String> cartIds); // 선택 총액 계산
    public abstract int increaseCartQuantity(String memNo, String productNo, int addQty); // 수량 증가
    public abstract int addToCart(String memNo, String productNo, int quantity); // 장바구니 추가
    public abstract boolean existsCartItem(String memNo, String productNo); // 중복 체크
}
