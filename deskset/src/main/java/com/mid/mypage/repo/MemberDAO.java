package com.mid.mypage.repo;

import com.mid.mypage.model.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {
    MemberVO getMemberByNo(String memNo);
    int updateMember(MemberVO memberVO);
} 