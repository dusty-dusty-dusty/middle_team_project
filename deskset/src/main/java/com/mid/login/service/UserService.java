package com.mid.login.service;

import com.mid.login.model.UserInfoVO;

public interface UserService {

    // 회원 정보 조회
    UserInfoVO getUserInfo(String memId, String memPwd);

    // 회원 등록
    int registerUser(UserInfoVO userInfoVO);

    // 아이디 중복 체크
    int idCheck(String memId);
}