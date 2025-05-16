package com.mid.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Integer NOTICE_NO;
	private String NOTICE_TITLE;
	private String NOTICE_CONTENT;
	private Date   NOTICE_DATE;
	
	
}
