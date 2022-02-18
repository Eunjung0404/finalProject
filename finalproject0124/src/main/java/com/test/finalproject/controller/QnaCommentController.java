package com.test.finalproject.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.finalproject.service.QnaCommentService;
import com.test.finalproject.vo.QnaCommentVo;
import com.util.PageUtil;

@Controller
public class QnaCommentController {
	private QnaCommentService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody QnaCommentVo vo){
		int insertCount = service.insert(vo);
		
		return insertCount == 1
		 ? new ResponseEntity<>("success", HttpStatus.OK)
		 : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/page/{qnacode}/{page}",
						produces = {
								MediaType.APPLICATION_XML_VALUE,
								MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<QnaCommentVo>> listPaging(
					@PathVariable("page") int page,
					@PathVariable("qnacode") int qnacode){
		PageUtil pu = new PageUtil(page, 5, 5, 10);
		return new ResponseEntity<>(service.listPaging(pu, qnacode), HttpStatus.OK);
	}
	
	@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping(value="/{commentcode}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(@PathVariable("commentcode") int commentcode){
		return service.delete(commentcode) == 1
			? new ResponseEntity<>("success", HttpStatus.OK) 
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value="/{commentcode}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody QnaCommentVo vo, @PathVariable("commentcode") int commentcode){
		vo.setCommentcode(commentcode);
		return service.update(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
