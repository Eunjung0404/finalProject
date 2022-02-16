package com.test.finalproject.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class TheaterForm {

	@NotNull
	private int theatercode;
	
	@NotBlank
	@Size(min = 1, max = 10)
	private String theatername;
	
	@NotBlank
	private String area;
	
	@NotNull
	private int state;
	
}
