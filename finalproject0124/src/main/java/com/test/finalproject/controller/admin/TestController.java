package com.test.finalproject.controller.admin;

import javax.crypto.SecretKey;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.aop.annotation.AdminLevel;
import com.test.finalproject.error.exception.AdminCheckException;
import com.test.finalproject.security.encrypt.TextEncoder;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TestController {

	private final TextEncoder encoder;
	
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
	
	@AdminLevel(1)
	@RequestMapping("/test5")
	public String test5() {
		return "/";
	}
	
	@RequestMapping("/test6")
	public @ResponseBody String test6(
				@RequestBody String text, 
				HttpServletRequest request
			) throws Exception {
		HttpSession session = request.getSession();
		SecretKey sc = encoder.getSecretKey();
		session.setAttribute("secretKey", sc);
		String s = encoder.doEncrypt(text, sc);
		System.out.println("암호화->"+s);
		return s;
	}
	
	@RequestMapping("/test7")
	public @ResponseBody String test7(
				@RequestBody String text, 
				HttpServletRequest request
			) throws Exception {
		System.out.println("받음->"+text);
		HttpSession session = request.getSession();
		SecretKey sc = (SecretKey)session.getAttribute("secretKey");
		session.setAttribute("secretKey", sc);
		String s = encoder.doDecrypt(text, sc);
		System.out.println("복호화->"+s);
		return s;
	}
	
}
