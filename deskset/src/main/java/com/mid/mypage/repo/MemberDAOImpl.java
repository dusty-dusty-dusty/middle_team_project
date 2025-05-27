package com.mid.mypage.repo;

import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.mid.mypage.model.MemberVO;
import java.util.HashMap;
import java.util.Map;

@Repository
public class MemberDAOImpl implements MemberDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public MemberVO getMember(String memId) {
        return sqlSession.selectOne("com.mid.mypage.mapper.MemberMapper.getMember", memId);
    }
    
    @Override
    public MemberVO getMemberByNo(String memNo) {
        return sqlSession.selectOne("com.mid.mypage.mapper.MemberMapper.getMemberByNo", memNo);
    }
    
    @Override
    public boolean checkIdDuplicate(String memId) {
        Integer count = sqlSession.selectOne("com.mid.mypage.mapper.MemberMapper.checkIdDuplicate", memId);
        return count != null && count > 0;
    }
    
    @Override
    public void updateMember(MemberVO member) {
        sqlSession.update("com.mid.mypage.mapper.MemberMapper.updateMember", member);
    }
    
    @Override
    public void updatePassword(String memNo, String memPwd) {
        Map<String, String> params = new HashMap<>();
        params.put("memNo", memNo);
        params.put("memPwd", memPwd);
        sqlSession.update("com.mid.mypage.mapper.MemberMapper.updatePassword", params);
    }
    
    @Override
    public void insertMember(MemberVO member) {
        sqlSession.insert("com.mid.mypage.mapper.MemberMapper.insertMember", member);
    }
} 