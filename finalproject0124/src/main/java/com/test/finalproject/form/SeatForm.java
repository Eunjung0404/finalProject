package com.test.finalproject.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class SeatForm {
	
	@NotNull
	private int seatrow;
	
	@NotNull
	private int seatcol;
	
	@NotBlank
	private String code;
	
	@NotNull
	private int state;
	
}
