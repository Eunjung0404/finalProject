package com.test.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TiketController {

	
	@GetMapping("/tiket")
	public String tiketPage()
	{
		return "member/tiket.tiles";
	}
}
