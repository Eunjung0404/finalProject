package com.test.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewVo {
	private int reviewcode;
	private int moviecode;
	private String mid;
	private int score;
	private String comments;
	private Date regdate;
}
