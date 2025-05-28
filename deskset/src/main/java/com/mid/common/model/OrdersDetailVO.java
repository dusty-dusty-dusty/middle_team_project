package com.mid.common.model;

import lombok.Data;

@Data
public class OrdersDetailVO {
	private String order_detail_no;
	private String order_no;
	private String product_no;
	private String product_quantity;
}
