package com.mid.login.model;

import java.util.Date;

public class UserInfoVO {
    private String memNo;      // 회원 고유번호
    private String memName;    // 이름
    private String memEmail;   // 이메일
    private String memId;      // 아이디
    private String memPwd;     // 비밀번호
    private String memAddr;    // 주소
    private String memTel;     // 휴대폰 번호
    private Date memRegdate;   // 가입일

    // 기본 생성자
    public UserInfoVO() {}

    // 전체 필드 생성자
    public UserInfoVO(String memNo, String memName, String memEmail, String memId, String memPwd, String memAddr, String memTel, Date memRegdate) {
        this.memNo = memNo;
        this.memName = memName;
        this.memEmail = memEmail;
        this.memId = memId;
        this.memPwd = memPwd;
        this.memAddr = memAddr;
        this.memTel = memTel;
        this.memRegdate = memRegdate;
    }

    // Getters & Setters
    public String getMemNo() {
        return memNo;
    }

    public void setMemNo(String memNo) {
        this.memNo = memNo;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getMemEmail() {
        return memEmail;
    }

    public void setMemEmail(String memEmail) {
        this.memEmail = memEmail;
    }

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemPwd() {
        return memPwd;
    }

    public void setMemPwd(String memPwd) {
        this.memPwd = memPwd;
    }

    public String getMemAddr() {
        return memAddr;
    }

    public void setMemAddr(String memAddr) {
        this.memAddr = memAddr;
    }

    public String getMemTel() {
        return memTel;
    }

    public void setMemTel(String memTel) {
        this.memTel = memTel;
    }

    public Date getMemRegdate() {
        return memRegdate;
    }

    public void setMemRegdate(Date memRegdate) {
        this.memRegdate = memRegdate;
    }

    @Override
    public String toString() {
        return "UserInfoDTO{" +
                "memNo='" + memNo + '\'' +
                ", memName='" + memName + '\'' +
                ", memEmail='" + memEmail + '\'' +
                ", memId='" + memId + '\'' +
                ", memPwd='" + memPwd + '\'' +
                ", memAddr='" + memAddr + '\'' +
                ", memTel='" + memTel + '\'' +
                ", memRegdate=" + memRegdate +
                '}';
    }
}