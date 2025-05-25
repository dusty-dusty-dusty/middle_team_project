package com.mid.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mid.mypage.service.MypageService;
import com.mid.mypage.model.MemberVO;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = {"/mypage/profile", "/deskset/mypage/profile"})
public class ProfileController {
    private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
    
    @Autowired
    private MypageService mypageService;
    
    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String viewProfile() {
        logger.info("프로필 확인 페이지 접속");
        return "mypage/check-profile";
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editProfile() {
        logger.info("프로필 수정 페이지 접속");
        return "mypage/edit-profile";
    }
} 