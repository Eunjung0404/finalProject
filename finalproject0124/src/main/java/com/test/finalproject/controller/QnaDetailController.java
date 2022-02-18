package com.test.finalproject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.finalproject.service.QnaService;
import com.test.finalproject.vo.QnaVo;

@Controller
public class QnaDetailController {
	@Autowired
	private QnaService service;

	@GetMapping("/qna/detail")
	public String passwordform(int num, Model model) {
		model.addAttribute("num", num);
		return "qna/password.tiles";
	}
	@PostMapping("/qna/detail")
	public String detail(int num, int pwd, Model model) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("pwd", pwd);
		map.put("qnacode", num);
		QnaVo vo1 = service.passwordform(map);
		if(vo1==null) {
			model.addAttribute("result", "fail");
			return "qna/result1.tiles";
		}else {
			QnaVo vo = service.detail(num);
			String content = vo.getContent().replaceAll("\n", "<br>");
			vo.setContent(content);
			
			// 현재글
			model.addAttribute("vo", vo);
			// 이전글
			model.addAttribute("prev", service.prev(num));
			// 다음글
			model.addAttribute("next", service.next(num));
			return "qna/detail.tiles";
		}
	}
}
