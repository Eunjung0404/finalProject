package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
	@PreAuthorize("isAuthenticated()")
	public String insert() {
		return "qna/insert.tiles";
	}
	
	@PostMapping("/qna/insert")
	@PreAuthorize("isAuthenticated()")
	public String insert(QnaVo vo, Model model) {
		
//	public String insert(int qnacode, int theatercode,
//						 String mid, int pwd, String title,
//						 String content, Date regdate,
//						 Model model) {
	
		try {
		//	QnaVo vo = new QnaVo(0, theatercode, mid, pwd, title, content, regdate);
			service.insert(vo);
			model.addAttribute("result","success");
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
		}
		return "qna/result.tiles";
	}
}
