package com.test.finalproject.controller;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.test.finalproject.service.ChaTheaterService;

@RestController
public class TiketJsonController {

	@Autowired
	ChaTheaterService service;

	@GetMapping(value = "/tiket-theater", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectTheater(String area,String moviecode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("moviecode",moviecode);
		map1.put("area", area);
		List<String> list=service.selectTheater(area);
		int count=service.areaCount(map1);
		System.out.println(map1);
		map.put("list", list);
		map.put("count", count);
		return map;
	}
	@GetMapping(value = "/tiket-ScreenDate", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectScreenDate(String moviecode,String theatercode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("moviecode",moviecode);
		map1.put("theatercode", theatercode);
		List<HashMap<String, Object>> result=service.getScreenDate(map1);
		System.out.println(map);
		map.put("result", result);
		return map;
	}
	
}
