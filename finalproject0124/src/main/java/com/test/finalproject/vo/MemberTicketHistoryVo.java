package com.test.finalproject.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberTicketHistoryVo {
	private int reservationcode;		// 예매번호
	private String mid;					// 회원 아이디
	private int timecode;				// 스케줄 코드
	private int people;					// 관람인원
	private String moviename;			// 영화이름
	private String screenname;			// 상영관 이름
	private int state;					// 상태
	private String theatername;			// 극장 이름
	
	private int moviecode;				// 영화코드
	private String starttime;			// 시작시간
	private String endtime;				// 종료시간
	private String event;				// 이벤트(시사회 등)
	
	private String seatname;			// 좌석이름
	
	// JSON타입의 날짜 형식을 변환함.
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul") private Date screendate;			// 상영일
}
