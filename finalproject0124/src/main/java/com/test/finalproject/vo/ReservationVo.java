package com.test.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReservationVo {

	
	private String reservationcode;
	private String mid;
	private String timecode;
	private String people;
	private String moviename;
	private String screenname;
	private String state;
	private String theatername;
}
