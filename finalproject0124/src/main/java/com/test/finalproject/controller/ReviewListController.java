package com.test.finalproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.ReviewService;
import com.test.finalproject.vo.ReviewVo;
import com.util.PageUtil;

@RestController
public class ReviewListController {
	@Autowired private ReviewService service;
	
	@GetMapping(value = "/review/list", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> reviewlist(
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum, int moviecode) {
		
		int count=service.count(moviecode);
		PageUtil pu=new PageUtil(pageNum, 5, 5, count);
			HashMap<String, Object> pmap=new HashMap<String, Object>();
		pmap.put("startRowNum", pu.getStartRow());
		pmap.put("endRowNum", pu.getEndRow());
		pmap.put("moviecode", moviecode);		
		List<ReviewVo> reviewlist=service.selectAll(pmap);

		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("list", reviewlist);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("pageCount", pu.getTotalPageCount());
		map.put("pageNum", pageNum);
		return map;
	}	
}

//model.addAttribute("reviewlist", reviewlist);

//	public String list(Model model) {
//
//		List<ReviewVo> reviewlist = service.selectAll();
//		model.addAttribute("reviewlist", reviewlist);
//
//		return "movie/moviedetailpage.tiles";
//	}

