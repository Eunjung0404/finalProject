package com.test.finalproject.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminMainController {

	@GetMapping("/admin/main")
	public String home() {
		log.info("관리자 메인페이지 호출");
		return "admin/main.tiles";
	}
}
