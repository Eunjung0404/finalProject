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
public class QnaCommentVo {
	int commentcode; 		//댓글번호
	String id;				//작성자 아이디
	int qnacode;			//qna글번호
	String content;			//글내용
	Date regdate;			//작성일
}
