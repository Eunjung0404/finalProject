package com.test.finalproject.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class AdminInfoForm {

	@NotEmpty
	@Size(min = 5, max = 30)
	private String aid;
	
	@NotEmpty
	@Size(min = 5, max = 30)
	private String apwd;
	
	@Range(min = 1, max = 9)
	private int alevel;
	
	@NotEmpty
	private String theatername;
	
}
