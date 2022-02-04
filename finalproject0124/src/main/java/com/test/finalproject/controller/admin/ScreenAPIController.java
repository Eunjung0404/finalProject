package com.test.finalproject.controller.admin;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.test.finalproject.vo.ScreenVo;
import com.test.finalproject.vo.SeatVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/test/screen")
public class ScreenAPIController {
	
	@PostMapping(produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody Map<String, Object> insert (
				@RequestBody ObjectNode json,
				HttpServletResponse response
			) {
		//resp.setHeader("Access-Control-Allow-Origin", "localhost:8080/");
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ObjectMapper mapper = new ObjectMapper();
			ScreenVo screen = mapper.treeToValue(json.get("screen"), ScreenVo.class);
			SeatVo[] seatArr = mapper.treeToValue(json.get("seatlist"), SeatVo[].class);
			List<SeatVo> seatlist = Arrays.asList(seatArr);
			log.info("상영관--->{}", screen);
			seatlist.stream().forEach(vo -> log.info("좌석-->{}", vo));
		}catch(Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			map.put("msg", "fail");
			return map;
		}
		map.put("msg", "ok");
		return map;
	}
}
