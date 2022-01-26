package com.test.finalproject.controller;


import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	@Autowired
	private ServletContext sc;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		sc.setAttribute("cp", sc.getContextPath());
		
		return "home.tiles";
	}
	
}
