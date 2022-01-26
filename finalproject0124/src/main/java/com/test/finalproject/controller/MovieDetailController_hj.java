package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.Movie_MService_hj;
import com.test.finalproject.vo.Movie_MVo;

@Controller
public class MovieDetailController_hj {
	@Autowired private Movie_MService_hj service;
	
	@GetMapping("/movie/detail")
	public String detail(int Moviecode, Model model) {
		Movie_MVo vo=service.detail(Moviecode);
		
		model.addAttribute("vo", vo);
		return "movie/detail.tiles";
	}
}
