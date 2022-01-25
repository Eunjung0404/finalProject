package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.finalproject.service.QnaService;
import com.test.finalproject.vo.QnaVo;

@Controller
public class QnaInsertController {
	@Autowired private QnaService service;
	
	@GetMapping("/qna/insert")
	public String form() {
		return "qna/insert";
	}
	
	@PostMapping("/qna/insert")
	public String insert(QnaVo vo, Model model) {
		int n = service.insert(vo);
		try {
			model.addAttribute("result","success");
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
		}
		return "qna/result.tiles";
	}
}
