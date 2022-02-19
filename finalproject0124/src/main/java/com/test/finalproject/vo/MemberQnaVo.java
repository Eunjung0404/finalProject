package com.test.finalproject.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class MemberQnaVo {
	private String mid;				// 회원 아이디
	private String mpwd;			// 회원 비밀번호
	private String mname;		// 회원 이름
	private String memail;		// 회원 이메일
	private String maddr;			// 회원 주소
	private String mphone;		// 회원 전화번호
	private Date birth;				// 회원 생년월일
	private int mstate;				// 사용 안함
	private String enabled;		// 회원 탈퇴 여부
//	private Date regdate;			// 회원 가입일
	
	private int qnacode;			 //글번호
	private int theatercode;		 //극장코드
	private int pwd; 				 //글 비밀번호
	private String title;			 // 글 유형
	private String content;			 //글내용
	
	// JSON타입의 날짜 형식을 변환함.
@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul") private Date regdate;			 //작성일
}
