package com.test.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class QnaVo {
	private int qnacode;			 //글번호
	private int theatercode;		 //극장코드
	private int fk_theatercode_qna;  //참조하는 극장코드
	private String mid;				 //회원아이디
	private String fk_mid_qna;		 //참조하는 아이디
	private int pwd; 				 //글 비밀번호
	private String title;			 //글제목
	private String content;			 //글내용
	private Date regdate;			 //작성일
}
