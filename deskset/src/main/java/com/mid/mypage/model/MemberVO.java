package com.mid.mypage.model;

import java.util.Date;
import lombok.Data;

@Data
public class MemberVO {
    private String memNo;        // 회원번호
    private String memId;        // 아이디
    private String memName;      // 회원이름
    private String memEmail;     // 이메일
    private String memPwd;       // 비밀번호
    private String memAddr;      // 주소
    private String memTel;       // 전화번호
    private Date memRegdate;     // 가입일자
    private String memStatus;    // 회원 상태 (정상, 탈퇴 등)
} 