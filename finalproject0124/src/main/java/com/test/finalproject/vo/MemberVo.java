package com.test.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberVo {
	private String mid;
	private String mpwd;
	private String mname;
	private String memail;
	private String maddr;
	private String mphone;
	private Date birth;
	private int mstate;
	private String enabled;
	private Date regdate;
}
