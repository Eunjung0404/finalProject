package com.test.finalproject.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChaAdminScheduleVo {

	private String moviecode;
	private String moviename;
	private Date startdate;
	private Date enddate;
	private String state;
}
