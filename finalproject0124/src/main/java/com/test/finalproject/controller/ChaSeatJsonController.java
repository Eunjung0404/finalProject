package com.test.finalproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.ChaSeatService;

@RestController
public class ChaSeatJsonController {
	@Autowired
	ChaSeatService service;

	@GetMapping(value = "/seat-list", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectSeat(int screencode,int timecode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> mapP=new HashMap<String, Object>();
		mapP.put("screencode", screencode);
		mapP.put("timecode", timecode);
		List<HashMap<String, Object>> list=service.seatLsit(mapP);
		map.put("list", list);
		map.put("row", service.getseatrow(screencode)+1);
		map.put("col", service.getseatcol(screencode)+1);
		return map;
	}
}
