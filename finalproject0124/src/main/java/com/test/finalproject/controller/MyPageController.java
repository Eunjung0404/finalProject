package com.test.finalproject.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

@Controller
public class MyPageController {
	@Autowired
	private MemberService service;	

	
	@RequestMapping("/member/mypage")
	public String myInfo(String mid, Model model) {
		MemberVo vo = service.myInfo(mid);
		System.out.println("id:" + mid);
		model.addAttribute("vo", vo);
				
		return "member/myPage.tiles";
	}
	
	
}
