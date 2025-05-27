package com.mid.manager.model;

import lombok.Data;

@Data
public class CartVO {
	private String cart_id;
	private String mem_no;
	private String product_no;
	private Integer cart_quantity;
}
