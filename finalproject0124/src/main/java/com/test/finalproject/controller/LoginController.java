package com.test.finalproject.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;


@Controller
public class LoginController {
	@Autowired
	private MemberService service;
	
	@GetMapping("/login")
	public String loginForm() {
		
		
		return "member/login.tiles";
	}
	
	@PostMapping("/login")
	public String login(Model model, String mid, String mpwd) {
		MemberVo vo = service.myInfo(mid); 
		System.out.println(vo);
		model.addAttribute("vo", vo);
		
		return "home.tiles";
	}

}
