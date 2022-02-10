package com.test.finalproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.ChaSeatService;

@Controller
public class ChaSeatController {
	@Autowired
	private ChaSeatService service;

	@GetMapping("/seat/insert")
	public String seatinsert(int maxRow, int maxCol, int screencode ,int c) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("screencode", screencode);
		for (int i = 0; i < maxRow; i++) {
			map.put("seatrow", i);
			char row=(char)(65+i);
			for (int j = 0; j < maxCol; j++) {
				map.put("seatcol", j);
				String code;
				if (j + 1 < 10) {

					code= String.valueOf(row)+"0"+String.valueOf(j+1);
				} else {
					code= String.valueOf(row)+String.valueOf(j+1);
				}
				map.put("code", code);
				map.put("state", 1);
				if(j==c)
				{
					map.put("state", 0);
				}
				service.insertseatList(map);
			}
		}
		return "result.tiles";
	}

	@GetMapping("/seatinfo/insert")
	public String seatinfoinsert( int screencode ,int timecode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Integer> list=service.selectseatcode(screencode);
		map.put("timecode", timecode);
		map.put("state", 0);
		for(int i=0;i<list.size();i++)
		{
			map.put("seatcode",list.get(i));
			service.insertseatinfo(map);
		}
		return "result.tiles";
	}
}
