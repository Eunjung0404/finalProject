package com.test.finalproject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.ReviewService;

@RestController
public class ReviewdeleteController {
	@Autowired private ReviewService service;
	
	@PreAuthorize("principal.username == #vo.mid")
	@GetMapping(value="/review/delete", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> reviewdelete(int reviewcode){
		HashMap<String, Object> map=new HashMap<String, Object>();
		try {
			service.reviewdelete(reviewcode);
			map.put("msg", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("msg", "fail");
		}
		return map;
	}
}
