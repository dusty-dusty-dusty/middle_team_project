package com.mid.mypage.model;

import java.util.Date;
import lombok.Data;
//주문내역 관련 VO

@Data
public class OrderVO {
    private String orderNo;      // 주문번호
    private String memNo;        // 회원번호
    private String payNo;        // 결제번호
    private String couponId;     // 쿠폰ID
    private Date orderDate;      // 주문일자
    private int deliveryFee;     // 배송비
    private String orderStatus;  // 주문상태
    
    // 조인을 통해 가져오는 추가 필드
    private String productName;  // 상품명
    private int productPrice;    // 상품가격
} 