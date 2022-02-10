package com.test.finalproject.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@GetMapping("/member/mypage")
	public String myPage() {				
		return "member/myPage.tiles";
	}
	
	@RequestMapping(value = "/member/doMyinfo", method=RequestMethod.GET)
	public ModelAndView doMyinfo(Principal principal) {		
		String mid = principal.getName();		// 로그인 아이디 가져오기
		
		MemberVo vo = service.getInfo(mid);		// 아이디와 일치하는 회원 정보 가져오기		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/doMyinfo");
		mv.addObject("info", vo);		// info 이름으로 회원 정보 담기
		
		return mv;		
	}
	
	@RequestMapping(value="/member/pwdVali", method=RequestMethod.POST)
	@ResponseBody
	public int pwdVali(String mpwd, Principal principal, Model model) {
		String mid = principal.getName();		// 로그인한 아이디 가져오기
		MemberVo vo = service.getInfo(mid);	// 로그인한 아이디와 일치하는 정보 가져오기
		String pwd = vo.getMpwd();	// 로그인한 아이디와 일치하는 암호화된 비밀번호
//		System.out.println("아아디:" + mid);
//		System.out.println("DB에 저장된 비밀번호:" + pwd);
//		System.out.println("내가 입력한 비밀번호:" + mpwd);
		
		if (passwordEncoder.matches(mpwd, pwd)) {	// true or false 반환
			System.out.println("비밀번호 일치!");
			int n = 1;
			return n;
		} else {
			System.out.println("비밀번호 불일치!");
			int n = 0;
			return n;
		}	
	}	
}
