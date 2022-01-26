package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.finalproject.service.QnaService;
import com.test.finalproject.vo.QnaVo;

@Controller
public class QnaUpdateController {
	@Autowired private QnaService service;
	
	@GetMapping("/qna/update")
	public String insertForm(int num, Model model) {
		QnaVo vo = service.detail(num);
		model.addAttribute("vo", vo);
		return "qna/update";
	}
	@PostMapping("/qna/update")
	public String update(QnaVo vo, Model model) {
		try {
			service.update(vo);
			model.addAttribute("result","success");
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
		}
		return "qna/result";
	}
}
