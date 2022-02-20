package com.test.finalproject.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberQnaVo;
import com.test.finalproject.vo.MemberVo;

@Controller
public class MyPageController {
	@Autowired
	private MemberService service;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	HttpSession session;
	
	@GetMapping("/member/mypage")
	public String myPage(Principal principal, Model model) {				
		
		model.addAttribute("getMid", principal.getName());		
		
		return "member/myPage.tiles";		// 값을 담은 모델 객체를 가지고 뷰 페이지로 이동.
	}
	
	@RequestMapping(value = "/member/doMyinfo", method=RequestMethod.POST)
	public String doMyinfo(Principal principal, Model model) {		
		String mid = principal.getName();		// 로그인 아이디 가져오기
		
		MemberVo vo = service.getInfo(mid);		// 아이디와 일치하는 회원 정보 가져오기		
		
		session.setAttribute("getMpwd", vo.getMpwd());			// 비밀번호 변경 시 기존에 사용하던 비밀번호를 넣어주기 위해 세션에 담음.
		session.setAttribute("getMemail", vo.getMemail());		//	비밀번호와 이메일이 일치해야 회원 비밀번호를 변경이 가능하기 때문에 이메일을 담아서 사용함.
		model.addAttribute("info", vo);
		
		return "member/doMyinfo.tiles";
	}
	
	@RequestMapping(value="/member/pwdVali", method=RequestMethod.POST)
	@ResponseBody
	public int pwdVali(String mpwd, Principal principal) {
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
