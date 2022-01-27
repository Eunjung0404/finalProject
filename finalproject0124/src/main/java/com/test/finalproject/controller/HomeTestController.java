package com.test.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeTestController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String adminhome(Model model) {

		return "hometest.tiles";

	}
}
