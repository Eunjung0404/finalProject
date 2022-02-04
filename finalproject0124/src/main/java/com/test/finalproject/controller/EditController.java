package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class EditController {
	@Autowired
	private MemberService service;	
		
	@PostMapping("/member/edit")
	public String myInfoEdit(MemberVo vo, Model model) {
		try {
			service.myInfoEdit(vo);
			model.addAttribute("result", "수정되었다.");
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","수정 실패했다.");
		}
		return "member/result.tiles";
	}
	
	@PostMapping("/changePwd")
	public String changePwd(MemberVo vo, Model model) {
		try {
			service.changePwd(vo);
			System.out.println("비밀번호: " + vo);
			model.addAttribute("code", "비밀번호가 변경되었습니다.");
		} catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("code", "fail");
		}
		
		return "member/result.tiles";
	}
}
