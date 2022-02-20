package com.test.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.finalproject.service.ChaHomeService;
import com.test.finalproject.vo.MovieImgVo;
import com.test.finalproject.vo.Movie_MVo;

@Controller
public class HomeController {
	@Autowired
	ServletContext seco;
	@Autowired
	ChaHomeService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		seco.setAttribute("cp", seco.getContextPath());

		List<Movie_MVo> list = service.getTopFiveMovie();
		List<String> imgs= new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			MovieImgVo img = service.getTopFiveMovieImg(list.get(i).getMoviecode());
			System.out.println("세부이미지"+img.getImgname());
			imgs.add(img.getImgname());
		}
		model.addAttribute("note", service.getnote().getTitle());
		model.addAttribute("list", list);
		model.addAttribute("imgs", imgs);
		return "home.tiles";

	}

}
