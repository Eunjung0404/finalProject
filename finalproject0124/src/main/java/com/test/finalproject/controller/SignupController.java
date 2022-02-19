package com.test.finalproject.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

@Controller
public class SignupController {
	@Autowired
	private MemberService service;

	@GetMapping("/signup")
	public String singupForm() {
		return "member/signup.tiles";
	}

	@PostMapping("/signup")
	public String singup(MemberVo vo, Model model) {
		try {
			int n = service.addMember(vo);
//			System.out.println("회원가입 결과: " + n);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("code", "fail");
		}
		return "member/login.tiles";
	}

}
