package com.test.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WithdrawalController {
	
	@GetMapping("/member/withdrawal")
	public String withdrawal() {
		
		return "member/doWithdrawal";
	}
}
