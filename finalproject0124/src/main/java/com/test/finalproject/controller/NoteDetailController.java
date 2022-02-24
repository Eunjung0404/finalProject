package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.NoteService;
import com.test.finalproject.vo.NoteVo;

@Controller
public class NoteDetailController {
	@Autowired
	private NoteService service;

	@GetMapping("/note/detail")
	public String detail(int num, Model model) {
			NoteVo vo = service.detail(num);
			String content = vo.getContent().replaceAll("\n", "<br>");
			vo.setContent(content);
			model.addAttribute("vo", vo);
			
		// 현재글
		model.addAttribute("vo", vo);
		return "note/detail.tiles";
	} 
}
