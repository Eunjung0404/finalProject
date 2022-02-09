package com.test.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TheaterHelpController {
	@GetMapping("qna/theaterhelp")
	public String TheaterJsp() {
		return "qna/theaterhelp.tiles";
	}
}
