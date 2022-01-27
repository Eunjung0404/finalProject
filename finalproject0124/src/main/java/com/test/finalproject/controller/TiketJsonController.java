package com.test.finalproject.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.ChaTheaterService;

@RestController
public class TiketJsonController {

	@Autowired
	ChaTheaterService service;

	@GetMapping(value = "/tiket-theater/{area}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectid(@PathVariable("area") String area) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<String> list=service.selectTheater(area);
		int count=service.areaCount(area);
		map.put("list", list);
		map.put("count", count);
		return map;
	}
	
}
