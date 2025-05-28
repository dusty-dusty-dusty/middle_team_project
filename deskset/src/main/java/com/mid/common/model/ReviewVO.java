package com.mid.common.model;

import lombok.Data;

@Data
public class ReviewVO {
	private String review_no;
	private String order_detail_no;
	private String mem_no;
	private Integer review_rating;
	private String review_cont;
	private String review_image;
	private String review_date;
}
