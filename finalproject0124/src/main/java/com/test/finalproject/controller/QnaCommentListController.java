package com.test.finalproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.QnaCommentService;
import com.test.finalproject.vo.QnaCommentVo;
import com.util.PageUtil;


@RestController
public class QnaCommentListController {
	@Autowired private QnaCommentService service;
	
	@GetMapping(value="/comment/list", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> list(
			@RequestParam(value="pageNum", defaultValue="1") int pageNum,
			int qnacode){
		int count = service.count(qnacode);
		PageUtil pu = new PageUtil(pageNum, 5, 5, count);
		HashMap<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("startRowNum", pu.getStartRow());
		pmap.put("endRowNum", pu.getEndRow());
		pmap.put("qnacode", qnacode);
		List<QnaCommentVo> list = service.selectAll(pmap);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("pageCount", pu.getTotalPageCount());
		map.put("pageNum", pageNum);
		return map;
	}
}
