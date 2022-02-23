package com.test.finalproject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.QnaCommentService;

@RestController
public class QnaCommentDeleteController {
	@Autowired private QnaCommentService service;
	
	@GetMapping(value="/comment/delete", produces={MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> delete(int commentcode){
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			service.delete(commentcode);
			map.put("code", "success");
		}catch (Exception e) {
			e.printStackTrace();
			map.put("code", "fail");
		}
		return map;
	}
}
