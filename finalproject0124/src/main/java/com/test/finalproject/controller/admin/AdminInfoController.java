package com.test.finalproject.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.finalproject.aop.annotation.AdminLevel;

@Controller
@RequestMapping("/admin")
public class AdminInfoController {

	@GetMapping("/info")
	@AdminLevel(1)
	public String infoPage() {
		return "admin/info";
	}
	
}
