package com.test.finalproject.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class FindController {
	@Autowired
	private MemberService service;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;

	@GetMapping("/findId")
	public String findIdForm() {
		return "member/findId.tiles";
	}
	@GetMapping("/findPwd")
	public String findPwdForm() {
		return "member/findPwd.tiles";
	}
	
	// 회원 이름과 전화번호로 아이디 찾기
	@RequestMapping(value = "/findId", method=RequestMethod.POST)
	@ResponseBody
	public MemberVo findId(String mname) {
		String mphone = request.getParameter("mphone");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mname", mname);
		map.put("mphone", mphone);
		MemberVo vo = service.findId(map);
		
		session.setAttribute("mid", vo.getMid());
		
		return vo;
	}
	
	// 회원 이름과 이메일로 아이디 찾기
	@RequestMapping(value = "/findId2", method=RequestMethod.POST)
	@ResponseBody
	public MemberVo findId2(String mname) {
		String memail = request.getParameter("memail");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mname", mname);
		map.put("memail", memail);
		
		MemberVo vo = service.findId2(map);
		
//		System.out.println("내가 입력한 정보: " + map);
//		System.out.println("내 정보: " + vo);
		
		session.setAttribute("getMid", vo.getMid());
		
		return vo;
	}
	
	
//	회원아이디와 이메일로 비밀번호 찾기(이메일 인증 해야 함)
	@RequestMapping(value = "/findPwd", method=RequestMethod.POST)
	@ResponseBody
	public MemberVo findPwd(String mid) {
		String memail = request.getParameter("memail");
		
//		System.out.println("아이디 받았는가?" + mid);
//		System.out.println("이메일 받았는가?" + memail);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("memail", memail);
//		System.out.println("맵에 잘 담겼는가?" + map);
		MemberVo vo = service.findPwd(map);
		session.setAttribute("getMpwd", vo.getMpwd());
		
		return vo;
	}
	
	
//	회원 아이디와 전화번호로 아이디 찾기
	@RequestMapping(value = "/findPwd2", method=RequestMethod.POST)
	@ResponseBody
	public MemberVo findPwd2(String mid) {
		String mphone = request.getParameter("mphone");
		
//		System.out.println("아이디 받았는가?" + mid);
//		System.out.println("전화번호 받았는가?" + mphone);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("mphone", mphone);
	
		MemberVo vo = service.findPwd2(map);
		
		session.setAttribute("getMemail", vo.getMemail());
		session.setAttribute("getMpwd", vo.getMpwd());
		
		return vo;
	}



}
