package com.test.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TimeHelpController {
	@GetMapping("qna/timehelp")
	public String TimeHelpJsp() {
		return "qna/timehelp.tiles";
	}
}
