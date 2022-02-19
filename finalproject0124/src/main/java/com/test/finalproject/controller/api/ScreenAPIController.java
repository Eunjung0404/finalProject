package com.test.finalproject.controller.api;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.ScreenService;
import com.test.finalproject.vo.ScreenVo;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/api/theater/{theatercode}/screen"
			, produces = {MediaType.APPLICATION_JSON_VALUE})
@RequiredArgsConstructor
public class ScreenAPIController {

	private final ScreenService service;
	
	@GetMapping
	public List<ScreenVo> getList(@PathVariable int theatercode) {
		return service.getList(theatercode);
	}
	
	@GetMapping("/{screencode}")
	public ScreenVo getScreen(@PathVariable int screencode) {
		return service.getScreen(screencode);
	}
	
}
