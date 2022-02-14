package com.test.finalproject.controller;

import java.util.HashMap;
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
	
	@GetMapping(value = "/review/list", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> reviewlist(Model model) {
		
		List<ReviewVo> reviewlist=service.selectAll();
//		model.addAttribute("reviewlist", reviewlist);

		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("list", reviewlist);
		return map;
	}
//
//	public String list(Model model) {
//
//		List<ReviewVo> reviewlist = service.selectAll();
//		model.addAttribute("reviewlist", reviewlist);
//
//		return "movie/moviedetailpage.tiles";
//	}
}
