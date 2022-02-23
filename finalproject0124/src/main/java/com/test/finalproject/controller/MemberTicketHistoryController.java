package com.test.finalproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberTicketHistoryVo;
import com.util.PageUtil;

@RestController
public class MemberTicketHistoryController {
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/member/ticketHistory", method=RequestMethod.GET)
	public HashMap<String, Object> ticketHistory(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, String field, String keyword, String mid){
		HashMap<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("field", field);
		pmap.put("keyword", keyword);
		pmap.put("mid", mid);
		
		int totalRowCount = service.ticketingCount(pmap);
		PageUtil pageutil = new PageUtil(pageNum, 2, 5, totalRowCount);
		pmap.put("startRow", pageutil.getStartRow());
		pmap.put("endRow", pageutil.getEndRow());
		
		List<MemberTicketHistoryVo> ticketList = service.ticketHistory(pmap);
		
		System.out.println("예매내역 리스트: " + ticketList);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ticketList", ticketList);
		map.put("startPageNum", pageutil.getStartPageNum());
		map.put("endPageNum", pageutil.getEndPageNum());
		map.put("pageCount", pageutil.getTotalPageCount());
		map.put("rowBlockCount", pageutil.getRowBlockCount());
		map.put("field", field);
		map.put("keyword", keyword);
		
		
		return map;
	}
}
