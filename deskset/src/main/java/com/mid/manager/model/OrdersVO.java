package com.mid.manager.model;

import lombok.Data;

@Data
public class OrdersVO {
	private String order_no;
	private String mem_no;
	private String pay_no;
	private String coupon_id;
	private String order_date;
	private Integer delivery_fee;
	private String order_status;
}
