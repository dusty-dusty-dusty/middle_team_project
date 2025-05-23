package com.mid.mypage.repo;

import com.mid.mypage.model.MemberVO;

public interface MemberDAO {
    MemberVO getMember(String memId);
    MemberVO getMemberByNo(String memNo);
    boolean checkIdDuplicate(String memId);
    void updateMember(MemberVO member);
    void updatePassword(String memNo, String memPwd);
    void insertMember(MemberVO member);
} 