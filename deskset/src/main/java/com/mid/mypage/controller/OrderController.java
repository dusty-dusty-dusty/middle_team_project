package com.mid.mypage.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mid.mypage.model.OrderVO;
import com.mid.mypage.repo.OrderDAO;


//컨트롤러 매핑오류
@Controller
public class OrderController {
    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
    
    @Autowired
    private OrderDAO orderDAO;
    
    @RequestMapping(value = "/deskset/mypage", method = RequestMethod.GET)
    public String desksetMypageMain() {
        logger.info("deskset/mypage 경로로 접속 - 기본 페이지");
        return "mypage/orders";
    }
    
    @RequestMapping(value = "/deskset/mypage/order", method = RequestMethod.GET)
    public String desksetMypageOrder() {
        logger.info("주문 페이지 접속");
        return "mypage/orders";
    }
} 