package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.QnaService;
import com.test.finalproject.vo.QnaVo;

@Controller
public class QnaDetailController {
	@Autowired
	private QnaService service;

	@GetMapping("/qna/detail")
	public String detail(int num, Model model) {
		QnaVo vo = service.detail(num);
		String content = vo.getContent().replaceAll("\n", "<br>");
		vo.setContent(content);
		
		// 현재글
		model.addAttribute("vo", vo);
		// 이전글
		model.addAttribute("prev", service.prev(num));
		// 다음글
		model.addAttribute("next", service.next(num));
		return "qna/detail";
	}
}
