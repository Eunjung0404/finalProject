package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.MovieImgService_hj;
import com.test.finalproject.service.Movie_MService_hj;
import com.test.finalproject.service.ReviewService;

@Controller
public class MovieDetailController_hj {
	@Autowired private Movie_MService_hj service;
	@Autowired private MovieImgService_hj service1;
	@Autowired private ReviewService service2;
	
	//영화 상세페이지
	//스틸컷
	//별점 평균
	@GetMapping("/movie/detail")
	public String detail(int moviecode, Model model) {
		model.addAttribute("vo", service.detail(moviecode));
		model.addAttribute("imglist", service1.movieimglist(moviecode));
		model.addAttribute("avg", service2.avg(moviecode));
		return "movie/moviedetailpage.tiles";
	}
}
