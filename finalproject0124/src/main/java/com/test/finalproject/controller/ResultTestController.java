package com.test.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResultTestController {
	
	@RequestMapping("/result")
	public String testResult() {
		
		return "member/result.tiles";
	}
}
