package com.mid.common.model;

import lombok.Data;

@Data
public class CartVO {
	private String cart_id;
	private String mem_no;
	private String product_no;
	private Integer cart_quantity;
}
