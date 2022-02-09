package com.test.finalproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.finalproject.service.Movie_MService_hj;
import com.test.finalproject.vo.Movie_MVo;

@Controller
public class MovieListController {
	@Autowired private Movie_MService_hj service;
	
	@RequestMapping("/movie/list")
	public String movielist(String keyword, Model model) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		
		List<Movie_MVo> list=service.selectAll(map);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		
		return "movie/movielist.tiles";
	}
}
