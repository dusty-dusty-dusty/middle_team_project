package com.mid.product.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private String review_no;
	private String order_detail_no;
	private String mem_no;
	private String review_cont;
	private int review_rating;
	private Date review_date;
	private String product_no;
	
	
	
}
