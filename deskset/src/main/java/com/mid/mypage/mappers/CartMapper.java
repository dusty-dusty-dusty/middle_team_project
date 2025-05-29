package com.mid.mypage.mappers;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mid.mypage.model.CartVO;

@Mapper
public interface CartMapper {
    List<CartVO> getCartList(String memNo);
} 