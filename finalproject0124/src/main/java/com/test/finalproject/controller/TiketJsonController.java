package com.test.finalproject.controller;



import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.test.finalproject.service.ChaTheaterService;
import com.test.finalproject.vo.TiketScreenTimeVo;

@RestController
public class TiketJsonController {

	@Autowired
	ChaTheaterService service;
     //극장정보 카운드 가져오기
	@GetMapping(value = "/tiket-theaterCount", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectTheaterCount(String area,String moviecode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("moviecode",moviecode);
		map1.put("area", area);
		int count=service.areaCount(map1);
		map.put("count", count);
		return map;
	}
    //극장정보 가져오기
	@GetMapping(value = "/tiket-theater", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectTheater(String area,String moviecode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("moviecode",moviecode);
		map1.put("area", area);
		List<String> list=service.selectTheater(map1);
		map.put("list", list);

		return map;
	}
	//상영날짜정보 가져오기
	@GetMapping(value = "/tiket-ScreenDate", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectScreenDate(String moviecode,String theatercode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("moviecode",moviecode);
		map1.put("theatercode", theatercode);
		List<TiketScreenTimeVo> result=service.getScreenDate(map1);
	
		map.put("result", result);
		return map;
	}
	//영화정보가져오기
	@GetMapping(value = "/tiket-movie", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectMovie() {
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<HashMap<String, Object>> result=service.movielist();
		map.put("result", result);
		return map;
	}
	
	//상영관정보 가져오기
	@GetMapping(value = "/tiket-screen", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectScreen(String moviecode,String theatercode,java.util.Date screendate) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("moviecode",moviecode);
		map1.put("theatercode", theatercode);
		map1.put("screendate", screendate);
		List<TiketScreenTimeVo> result=service.selectScreenTime(map1);
		List<String> screenName=service.selectScreenName(map1);
		System.out.println(map);
		map.put("result", result);
		map.put("screenName", screenName);
		return map;
	}
	//영화검색
	@GetMapping(value = "/tiket-searchMovie", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> searchMovie(String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(keyword==null)
		{
			keyword="null";
		}
		List<HashMap<String, Object>> result=service.searchMovie(keyword);
		
		map.put("result", result);
		return map;
	}
	//극장검색
	@GetMapping(value = "/tiket-searchTheater", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> searchTheater(String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(keyword==null)
		{
			keyword="null";
		}
		List<HashMap<String, Object>> result=service.searchTheater(keyword);
		
		map.put("result", result);
		return map;
	}
}
