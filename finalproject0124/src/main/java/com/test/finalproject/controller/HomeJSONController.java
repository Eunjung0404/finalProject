package com.test.finalproject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.ChaHomeService;
import com.test.finalproject.vo.Movie_MVo;

@RestController
public class HomeJSONController {

	@Autowired ChaHomeService service;
	// 영화정보가져오기
	@GetMapping(value = "/home-movie", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> getMovie() {
		HashMap<String, Object> map = new HashMap<String, Object>();
        List<Movie_MVo> listc=service.getCurrnetMovie();
        List<Movie_MVo> listf=service.getFutureMovie();
		map.put("listc", listc);
		map.put("listf", listf);
		return map;
	}

}
