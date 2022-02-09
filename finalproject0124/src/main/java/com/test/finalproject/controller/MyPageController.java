package com.test.finalproject.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "/member/myinfo", method = RequestMethod.GET)
	@ResponseBody
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
	
	@RequestMapping(value = "/member/getInfo")
	@ResponseBody
	public String getIng(Principal principal, Model model) {		
		String id = principal.getName();
		MemberVo vo = service.getInfo(id);
		
		model.addAttribute("vo", vo);
		
		return "member/myPage";
	}
}
