package com.test.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaHomeController {

	@GetMapping("qna/qnahome")
	public String homeform() {
		return "qna/qnahome.tiles";
	}
}
