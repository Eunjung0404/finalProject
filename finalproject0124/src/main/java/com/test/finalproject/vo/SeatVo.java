package com.test.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SeatVo {
	
	private int seatcode;
	private int screencode;
	private int seatrow;
	private int seatcol;
	private String code;
	private int state;
}
