package com.test.finalproject.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.test.finalproject.service.QnaCommentService;
import com.test.finalproject.vo.QnaCommentVo;

@Controller
public class QnaCommentController {
	private QnaCommentService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody QnaCommentVo vo){
		int insertCount = service.register(vo);
		
		return insertCount == 1
		 ? new ResponseEntity<>("success", HttpStatus.OK)
		 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping(value="/{commentcode", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody QnaCommentVo vo, @PathVariable("commentcode") Integer commentcode){
		return service.remove(commentcode) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) :
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
