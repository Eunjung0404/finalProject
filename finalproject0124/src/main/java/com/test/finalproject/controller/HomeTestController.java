package com.test.finalproject.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeTestController {
	@Autowired ServletContext seco;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String adminhome(Model model) {
		seco.setAttribute("cp", seco.getContextPath());

		return "hometest.tiles";

	}
}
