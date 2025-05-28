package com.mid.manager.model;

import lombok.Data;

@Data
public class RegistProductVO {
	//ProductVO
	private String product_no;
	private String admin_no;
	private String product_name;
	private String product_mfc;
	private Integer product_price;
	private Integer product_stock;
	private String product_image;
	private String product_thum;
	private String product_cont;
	//CategoryVO
	private String cate_id;
	private String cate_name;
	private String pn_prefix;
	//AttrVO
	private String attr_id;
	private String attr_name;
	//AttrValueVO
	private String attr_value;
	
}
