package com.test.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberVo {
	private String mid;				// 회원 아이디
	private String mpwd;			// 회원 비밀번호
	private String mname;		// 회원 이름
	private String memail;		// 회원 이메일
	private String detailaddress;			// 회원 상세주소
	private String mphone;		// 회원 전화번호
	private Date birth;				// 회원 생년월일
	private int mstate;				// 사용 안함
	private String enabled;		// 회원 탈퇴 여부
	private Date regdate;			// 회원 가입일
	private String postcode;		// 우편번호
	private String roadaddress;		// 도로명 주소
	private String jibunaddress;		// 지번주소
}
