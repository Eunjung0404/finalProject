package com.test.finalproject.controller;


import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberQnaVo;
import com.util.PageUtil;

@RestController
public class MemberQuestionController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/question", method = RequestMethod.POST)
	public HashMap<String, Object> selectQuestion(@RequestParam(value="pageNum", defaultValue="1")int pageNum, String field, String keyword, String mid) {
//		System.out.println("아이디 전달 됨?" + mid);
		HashMap<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("field", field);
		pmap.put("keyword", keyword);
		pmap.put("mid", mid);
		int totalRowCount = service.getCount(pmap);
		PageUtil pageutil = new PageUtil(pageNum, 10, 5, totalRowCount);
		pmap.put("startRow", pageutil.getStartRow());
		pmap.put("endRow", pageutil.getEndRow());
		List<MemberQnaVo> list = service.selectQuestion(pmap);

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("startPageNum", pageutil.getStartPageNum());
		map.put("endPageNum", pageutil.getEndPageNum());
		map.put("pageCount", pageutil.getTotalPageCount());
		System.out.println("list: " + list);
//		System.out.println("map:" + map);
		
		return map;
	}
}
