package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

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
		return "result";
	}
}
