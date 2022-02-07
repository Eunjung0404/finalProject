package com.test.finalproject.form;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class AdminLoginForm {
	
	@NotBlank
	private String aid;
	
	@NotBlank
	private String apwd;
	
}
