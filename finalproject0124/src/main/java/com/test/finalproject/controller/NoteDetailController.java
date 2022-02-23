package com.test.finalproject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.NoteService;
import com.test.finalproject.vo.NoteVo;

@Controller
public class NoteDetailController {
	@Autowired private NoteService service;
	
	@GetMapping("/note/detail")
	public String detail(NoteVo vo, Model model) {
		try {
			service.detail(vo);
			model.addAttribute("result", "success");
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("result", "success");
		}
		return "note/result.tiles";
	}
}
