package com.test.finalproject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberQnaVo;

@RestController
public class MemberQnaDetailController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/member/detailQuestion", method=RequestMethod.GET)
	public MemberQnaVo detatilQuestion(int qnacode,String mid) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("mid", mid);
		map.put("qnacode", qnacode);
		
		MemberQnaVo vo = service.detatilQuestion(map);
		
		return vo;
	}
}
