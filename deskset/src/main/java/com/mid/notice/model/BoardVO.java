package com.mid.notice.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private String notice_no;
	private String notice_title;
	private String notice_cont;
	private Date notice_date;
	private String admin_no;
}
