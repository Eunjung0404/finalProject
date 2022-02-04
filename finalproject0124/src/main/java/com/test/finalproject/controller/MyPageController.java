 package com.test.finalproject.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

@Controller
public class MyPageController {
	@Autowired
	private MemberService service;	

	
	@GetMapping("/member/mypage")
	public String myPage() {
				
		return "member/myPage.tiles";
	}
	
	@GetMapping("/member/myinfo")
	public String myinfo() {
		
		return "member/doMyInfo.tiles";
	}
	
	@GetMapping("/member/doMyinfo")
	public String doMyInfo(String mid, String mphone, Model model) {
		MemberVo vo = service.myInfo(mid ,mphone);
		System.out.println("id:" + mid);
		System.out.println("phone:" + mphone);
		model.addAttribute("vo", vo);
		
		return "member/myinfo.tiles";
	}
	
	
}
