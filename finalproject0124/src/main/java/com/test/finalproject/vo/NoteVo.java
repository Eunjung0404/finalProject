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
public class NoteVo {
	private int notecode;			  //글번호
	private int theatercode;		  //극장코드
	private String title;			  //글제목
	private String content;		 	  //글내용
	private Date regdate;		   	  //작성일

}
