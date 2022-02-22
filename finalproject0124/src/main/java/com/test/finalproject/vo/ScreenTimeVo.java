package com.test.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ScreenTimeVo {

	
	private int timecode;
	private int screencode;
	private int moviecode;
	private String starttime;
	private String endtime;
	private String event;
	private Date screendate;
}
