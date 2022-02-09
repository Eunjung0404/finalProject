package com.test.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SaleHelpController {
	@GetMapping("qna/salehelp")
	public String TheaterJsp() {
		return "qna/salehelp.tiles";
	}
}
