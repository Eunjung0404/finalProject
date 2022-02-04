package com.test.finalproject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.ReviewService;
import com.test.finalproject.vo.ReviewVo;

@RestController
public class ReviewinsertController {
	@Autowired private ReviewService service;
	
	@GetMapping(value="/review/insert", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> insertcomments(ReviewVo vo){
		HashMap<String, Object> map=new HashMap<String, Object>();
		try {
			service.insertcomments(vo);
			map.put("msg", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("msg", "fail");
		}
		return map;
	}
}
