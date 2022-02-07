package com.test.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AdminVo {
	
	private String aid;
	private String apwd;
	private int alevel;
	private String theatername;
	private Date regdate;
	private String enabled;
	
}
