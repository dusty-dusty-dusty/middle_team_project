package com.mid.mypage.service;

import com.mid.mypage.model.MemberVO;

public interface MemberService {
    MemberVO getMemberByNo(String memNo);
    int updateMember(MemberVO memberVO);
} 