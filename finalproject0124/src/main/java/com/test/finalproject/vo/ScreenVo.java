package com.test.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ScreenVo {
	
	private int screencode;
	private int theatercode;
	private String name;
	private int state;
	private String screentype;
	private int seatcount;
	
}
