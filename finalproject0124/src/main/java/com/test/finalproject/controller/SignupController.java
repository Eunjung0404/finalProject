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

	@GetMapping("/member/signup")
	public String singupForm() {

		return "member/signup";
	}

	@PostMapping("/member/signup")
	public String singup(MemberVo vo, Model model) {
		try {
			service.addMember(vo);
			model.addAttribute("code", "회원 가입을 축하드립니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("code", "fail");
		}
		return "result";
	}
}
