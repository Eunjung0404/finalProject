package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class EditController {
	@Autowired
	private MemberService service;	
	
	@RequestMapping(value = "/member/edit", method=RequestMethod.POST)
	@ResponseBody
	public int doMyinfo(MemberVo vo, Model model) {
			int n = service.doMyinfo(vo);
			if (n == 0) {
				System.out.println("회원 정보를 변경하지 못함");
			} else {
				System.out.println("회원 정보를 변경함!");
			}
			
		return n;
	}
	
	@RequestMapping(value = "/changePwd", method=RequestMethod.POST)
	@ResponseBody
	public int changePwd(MemberVo vo) {
		int n = service.changePwd(vo);
		if (n == 1) {
			System.out.println("성공적으로 비밀번호 변경 됨," + n);
			return n;
		} else {
			System.out.println("비밀번호 변경 오류 발생, " + n);
			return 0;
		}		
	}	
	@RequestMapping(value = "/member/changePwd", method=RequestMethod.POST)
	@ResponseBody
	public int changePwdMypage(MemberVo vo) {
		int n = service.changePwd(vo);
		if (n == 1) {
			System.out.println("성공적으로 비밀번호 변경 됨," + n);
			return n;
		} else {
			System.out.println("비밀번호 변경 오류 발생, " + n);
			return 0;
		}		
	}	
	
	@GetMapping("/member/changePwdForm")
	public String changePwdForm() {
		return "member/changePwd.tiles";
	}
	
	@GetMapping("/findPwdForm")
	public String changePwdForm2() {
		return "member/changePwd2.tiles";
	}
}
