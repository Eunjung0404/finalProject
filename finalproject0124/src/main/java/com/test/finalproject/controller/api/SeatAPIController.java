package com.test.finalproject.controller.api;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.SeatService;
import com.test.finalproject.vo.SeatVo;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/api/theater/{theatercode}/screen/{screencode}/seat"
			, produces = {MediaType.APPLICATION_JSON_VALUE})
@RequiredArgsConstructor
public class SeatAPIController {

	private final SeatService service;
	
	@GetMapping
	public List<SeatVo> getList(@PathVariable int screencode) {
		return service.getList(screencode);
	}
	
}
