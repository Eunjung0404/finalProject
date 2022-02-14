package com.test.finalproject.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
}
