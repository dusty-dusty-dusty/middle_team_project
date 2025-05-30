package com.mid.mypage.service;

import com.mid.mypage.model.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.mid.mypage.mappers.MemberMapper";

    @Override
    public MemberVO getMemberByNo(String memNo) {
        System.out.println("==== [DEBUG] getMemberByNo: memNo = " + memNo);
        MemberVO vo = sqlSession.selectOne(NAMESPACE + ".selectMemberByNo", memNo);
        System.out.println("==== [DEBUG] getMemberByNo: result = " + vo);
        return vo;
    }

    @Override
    public int updateMember(MemberVO memberVO) {
        return sqlSession.update(NAMESPACE + ".updateMember", memberVO);
    }
} 