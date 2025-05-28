package com.mid.mypage.model;

import java.util.Date;
import lombok.Data;
//주문내역 관련 VO

@Data
public class OrderVO {
    private String orderNo;          // 주문번호
    private String memNo;            // 회원번호
    private Date orderDate;          // 주문일자
    private int totalAmount;         // 총 주문금액
    private String orderStatus;      // 주문상태
    private String deliveryAddress;  // 배송주소
    private String paymentMethod;    // 결제방법
    
    // 조인을 통해 가져오는 추가 필드
    private String productName;      // 상품명
    private int productPrice;        // 상품가격
} 