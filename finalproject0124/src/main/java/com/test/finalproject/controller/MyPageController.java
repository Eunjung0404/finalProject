package com.test.finalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		return "member/myInfo.tiles";
	}
	
	@RequestMapping(value = "/member/doMyinfo")
	public ModelAndView doMyinfo(String mname, String memail, HttpSession session) {
		MemberVo vo = service.selectMember(mname, memail);
		System.out.println(vo);
		session.setAttribute("mname", mname);
		session.setAttribute("memail", memail);
		session.setAttribute("mpwd", vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/doMyinfo");
		mv.addObject("info", vo);
		return mv;		
	}
}
