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
	
	//영화 목록 페이지(관리자)
	@RequestMapping("/movie/list")
	public String movielist(Model model) {
				
		List<Movie_MVo> list=service.selectAll();
		model.addAttribute("list", list);
		
		return "movie/movielist.tiles";
	}
	
	//영화 검색 페이지
	@RequestMapping("/movie/search")
	public String searchlist(String keyword, Model model) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		
		List<Movie_MVo> list=service.searchlist(map);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		
		return "movie/searchpage.tiles";
	}
}
