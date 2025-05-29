package com.mid.mypage.service;

import java.util.List;
import com.mid.mypage.model.CartVO;

public interface CartService {
    List<CartVO> getCartList(String memNo);
}
