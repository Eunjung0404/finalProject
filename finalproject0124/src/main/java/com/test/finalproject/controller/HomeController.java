package com.test.finalproject.controller;


import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
<<<<<<< HEAD
	@Autowired ServletContext seco;
=======
	@Autowired
	private ServletContext sc;
>>>>>>> branch 'master' of https://github.com/Eunjung0404/finalproject.git
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
<<<<<<< HEAD
		seco.setAttribute("cp", seco.getContextPath());

=======
		sc.setAttribute("cp", sc.getContextPath());
		
>>>>>>> branch 'master' of https://github.com/Eunjung0404/finalproject.git
		return "home.tiles";
	}
	
}
