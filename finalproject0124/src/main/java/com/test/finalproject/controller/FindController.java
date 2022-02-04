package com.test.finalproject.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class FindController {
	@Autowired
	private MemberService service;

	@GetMapping("/findId")
	public String findIdForm() {
		return "member/findId.tiles";
	}
	@GetMapping("/findPwd")
	public String findPwdForm() {
		return "member/findPwd.tiles";
	}

//	@GetMapping(value = "/findId", produces = { MediaType.APPLICATION_JSON_VALUE })
//	public @ResponseBody Map<String, Object> findId(String mname, String mphone, Model model) {
//		try {
//			MemberVo vo = service.findId(mname, mphone);
//			Map<String, Object> map = new HashMap<String, Object>();
//			
//			if (vo != null) {
//				map.put("id", vo.getMid());
//			}
//			model.addAttribute("id", vo);
//			System.out.println("vo: " + map);
//			return map;
//		} catch(Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
	
	@PostMapping("/findId")
	public String findId(String mname, String mphone, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mname", mname);
		map.put("mphone", mphone);
		MemberVo vo = service.findId(map);
		model.addAttribute("vo", vo);
		
		return "member/result";
	}
	@PostMapping("/findId2")
	public String findId2(String mname, String memail, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mname", mname);
		map.put("memail", memail);
		MemberVo vo = service.findId(map);
		model.addAttribute("vo", vo);
		System.out.println("a: " + mname);
		System.out.println("b: " + memail);
		
		return "member/result";
	}



}
