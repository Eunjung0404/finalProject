package com.test.finalproject.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class ScreenForm {

	@NotNull
	private int screencode;
	
	@NotNull
	private int theatercode;
	
	@NotBlank
	private String name;
	
	@NotNull
	private int state;
	
	@NotBlank
	private String screentype;
	
}
