package com.mid.mypage.model;

import java.util.Date;
import lombok.Data;
//주문내역 관련 VO

@Data
public class OrderVO {
    // ORDERS 테이블 정보
    private String orderNo;          // 주문번호
    private String orderStatus;      // 주문현황
    private Date orderDate;          // 주문일자
    
    // PRODUCT 테이블 정보 (JOIN)
    private String productName;      // 상품명
    private int productPrice;        // 상품금액
} 