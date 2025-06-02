package com.mid.mypage.service;

import com.mid.mypage.model.MemberVO;
import com.mid.mypage.repo.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberDAO memberDAO;

    public MemberVO getMemberByNo(String memNo) {
        return memberDAO.getMemberByNo(memNo);
    }

    public int updateMember(MemberVO memberVO) {
        return memberDAO.updateMember(memberVO);
    }
} 