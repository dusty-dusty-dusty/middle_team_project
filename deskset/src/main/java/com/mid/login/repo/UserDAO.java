package com.mid.login.repo;

import com.mid.login.model.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDAO {

    // 회원 등록
    int insertUser(UserInfoVO userInfoVO);

    // 회원 정보 조회 (아이디와 비밀번호로)
    UserInfoVO getUserInfo(@Param("memId") String memId, @Param("memPwd") String memPwd);

    // 아이디 중복 체크
    int idCheck(@Param("memId") String memId);

    // 마지막 로그인 날짜 업데이트
    // int updateLastLogin(@Param("memId") String memId);

    //  
    
    
    
}