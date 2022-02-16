package com.test.finalproject.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.finalproject.aop.annotation.AdminLevel;

@Controller
@RequestMapping("/admin/theater")
public class AdminTheaterController {

	@GetMapping("/ALL")
	@AdminLevel(1)
	public String allTheaterPage() {
		return "admin/theaters";
	}
	
	@GetMapping("/{theatername}")
	public String localTheaterPage() {
		return "admin/theater";
	}
	
}
