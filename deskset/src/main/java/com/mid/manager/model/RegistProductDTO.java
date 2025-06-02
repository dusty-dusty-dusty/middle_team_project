package com.mid.manager.model;

import lombok.Data;

@Data
public class RegistProductDTO {
	private String cate_id;
	private String admin_no;
	
	private String product_name;
	private String product_mfc;
	private Integer product_price;
	private Integer product_stock;

	private String product_image;
	private String product_thum;
	private String product_cont;
	
}
