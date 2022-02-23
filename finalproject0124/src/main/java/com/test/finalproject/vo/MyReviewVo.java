package com.test.finalproject.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MyReviewVo {
	private int moviecode;			// 영화코드
	private String moviename;		// 영화이름
	
	private int rmoviecode;			// 리뷰 테이블에 있는 영화코드
	private int reviewcode;		// 리뷰코드
	private String mid;			// 회원 아이디
	private int score;			// 평점
	private String comments;		// 리뷰 내용
	
	// JSON타입의 날짜 형식을 변환함.
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul") private String regdate;			// 리뷰 작성일
}
