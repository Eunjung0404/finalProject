package com.test.finalproject.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmailAuthValidationController {

	// 이메일 인증번호 확인
	@RequestMapping("/emailAuthVali")
	public String pwdSet(@RequestParam(value = "emailAuth") String emailAuth, @RequestParam(value = "num") String num)
			throws IOException {
//		System.out.println("num: " + num);
//		System.out.println("입력한 인증번호: " + emailAuth);

		if (emailAuth.equals(num)) {
			return "member/changePwd2.tiles";
		} else {
			return "member/findPwd.tiles";
		}
	}
}
