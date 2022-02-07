package com.test.finalproject.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	
	@GetMapping("/login")
	public String loginForm() {
		log.info("관리자 로그인폼 요청");
		return "admin/adminLoginTest.tiles";
	}
}
