package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.finalproject.service.NoteService;
import com.test.finalproject.vo.NoteVo;

@Controller
public class NoteInsertController {
	@Autowired private NoteService service;
	
	@GetMapping("/admin/note/insert")
	public String noteform() {
		return "note/insert.tiles";
	}
	@PostMapping("/admin/note/insert")
	public String insert(NoteVo vo, Model model) {
		try {
			service.insert(vo);
			model.addAttribute("result","success");
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
		}
		return "note/result.tiles";
	}
}
