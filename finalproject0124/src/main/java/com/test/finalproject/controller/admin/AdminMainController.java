package com.test.finalproject.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminMainController {

	@GetMapping("/admin/main")
	public String home() {
		return "admin/main.tiles";
	}
	
}
