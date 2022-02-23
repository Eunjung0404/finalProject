package com.test.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class TheaterMovieVo {

	private String tmovecode;
	private String theatercode;
	private String moviecode;
	private Date startdate;
	private Date enddate;
	private String state;
}
