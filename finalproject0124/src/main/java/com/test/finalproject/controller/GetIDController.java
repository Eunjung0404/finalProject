package com.test.finalproject.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GetIDController {

	@GetMapping("/username")
	@ResponseBody
	public String currentUserName(Principal principal, Model model) {
		model.addAttribute("id",principal.getName());
		
		return principal.getName();
	}
}
