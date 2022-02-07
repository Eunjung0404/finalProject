package com.test.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.ReviewService;
import com.test.finalproject.vo.ReviewVo;

@RestController
public class ReviewListController {
	@Autowired private ReviewService service;
	
	@GetMapping(value = "/movie/moviedetailpage", produces = {MediaType.APPLICATION_JSON_VALUE})
	public String list(Model model) {
		List<ReviewVo> reviewlist=service.selectAll();
		model.addAttribute("reviewlist", reviewlist);
		
		return "movie/moviedetailpage.tiles"; 
	}
}
