package com.test.finalproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.util.PageUtil;

@RestController
public class MemberMyTickeHistoryController {
//	@Autowired
////	private xxxxxx service;
//
//	@RequestMapping(value = "/member/myTicketingHistory", method=RequestMethod.GET)
//	public HashMap<String, Object> myTicketHistory(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, String field, String keyword, String mid){
//		HashMap<String, Object> pmap = new HashMap<String, Object>();
//		pmap.put("field", field);
//		pmap.put("keyword", keyword);
//		
////		int totalRowCount = service.xxxxx(pmap);
//		PageUtil pageutil = new PageUtil(pageNum, 10, 10, pageNum);
//		pmap.put("startRow", pageutil.getStartRow());
//		pmap.put("endRow", pageutil.getEndRow());
//		
////		List<xxxxx> ticketHistoryList = service.xxxx(mid);
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
////		map.put("ticketHistoryList", ticketHistoryList);
//		map.put("startPageNum", pageutil.getStartPageNum());
//		map.put("endPageNum", pageutil.getEndPageNum());
//		map.put("pageCount", pageutil.getTotalPageCount());
//		
//		return map;
//	}
	
}
