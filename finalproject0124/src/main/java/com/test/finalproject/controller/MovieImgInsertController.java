package com.test.finalproject.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.MovieImgService_hj;

@Controller
public class MovieImgInsertController {
	@Autowired private MovieImgService_hj service;
	@Autowired private ServletContext sc;
	
	@GetMapping("/admin/movieimginsert")
	public String movieimgForm() {
		return "movieimginsert";
	}
}
