package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.QnaService;

@Controller
public class QnaDeleteController {
	@Autowired private QnaService service;
	
	@GetMapping("/qna/delete")
	public String delete(int qnacode) {
		service.delete(qnacode);
		return "redirct:/qna/list.tiles";
	}
}
