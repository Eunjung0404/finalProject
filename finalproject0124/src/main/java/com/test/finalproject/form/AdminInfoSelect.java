package com.test.finalproject.form;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AdminInfoSelect {

	private String aid;
	
	private final String apwd = "****";
	
	private int alevel;
	
	private String theatername;
	
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date regdate;
	
	private String enabled;
	
}
