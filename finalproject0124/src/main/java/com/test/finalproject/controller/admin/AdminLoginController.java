package com.test.finalproject.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.finalproject.vo.AdminVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	
	@GetMapping("/login")
	public String loginForm(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		if(session==null || session.getAttribute("admin")==null) {
			return "admin/login.tiles";
		}
		
		return "admin/main.tiles";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		log.info("관리자 로그아웃->{}",
				((AdminVo)session.getAttribute("admin")).getAid());
		
		session.removeAttribute("admin");
		
		return "home.tiles";
	}
}
