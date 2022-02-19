package com.test.finalproject.vo;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TiketSeatParameterVo {

	//유저이름
	private String username;
	//타임코드
	private String timecode;
	//카운트
	private String count;
	//영화명
	private String moviename;
	//극장명
	private String theatername;
	//상영관명
	private String screenname;
	private String totalprice;
	private String paymenttype;
	private List<String> seatcode;
	//영화이미지,영화이름
	private String movieimgname;
	private String movienamehtml;
	//상영관 일시.상영시간
	private String screendate;
	private String screentime;
	private String moviecode;
	private List<String> seatname;
}
