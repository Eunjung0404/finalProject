package com.test.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class TheaterMovieVo {

	private int tmovecode;
	private int theatercode;
	private int moivecode;
	private Date startdate;
	private Date enddate;
	private int state;
}
