package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

@Controller
public class FindController {
	@Autowired
	private MemberService service;
	
	@GetMapping("/findId")
	public String findIdForm() {
		return "member/findId";
	}
	
	public String findId(String mname, String memail, Model model) {
		try {
			MemberVo vo = service.findId(memail, mname);
			model.addAttribute("id", vo);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("에라");
		}
		return "member/result";
	}
}
