package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.finalproject.service.MemberService;

@Controller
public class MemberWithdrawalController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/member/withdrawal", method=RequestMethod.POST)
	@ResponseBody
	public int withdrawal(String mid) {
		int n = service.withdrawal(mid);		// DB에 저장된 아이디와 일치하는 회원 탈퇴
		if (n == 1) {
			System.out.println("회원 탈퇴 됨");
		} else {
			System.out.println("회원 탈퇴 오류");
		}
		return n;
	}
}
