package com.test.finalproject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
			service.addMember(vo);
			System.out.println("vo:" + vo);
			model.addAttribute("code", "회원 가입을 축하드립니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("code", "fail");
		}
		return "member/result.tiles";
	}
	
	

	@GetMapping(value = "/idCheck", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> idCheck(String mid) {
		MemberVo vo = service.idCheck(mid);
		HashMap<String, Object> map = new HashMap<String, Object>();		
		
		if (vo != null) {
			map.put("using", true);
		} else {
			map.put("using", false);
		}
		return map;
	}



}
