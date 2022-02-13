package com.test.finalproject.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.error.exception.AdminCheckException;

@Controller
public class TestController {

	@RequestMapping("/test")
	public String test1() {
		System.out.println("컨트롤러1");
		return "/";
	}
	
	@RequestMapping("/test2")
	public String test2(int num) {
		System.out.println("컨트롤러2");
		return "/";
	}
	
	@RequestMapping("/test3")
	public String test3() {
		System.out.println("컨트롤러3");
		throw new AdminCheckException("테스트 예외");
	}
	
	@RequestMapping("/test4")
	public String test4() {
		System.out.println("컨트롤러4");
		int n = 1/0;
		return "/";
	}
}
