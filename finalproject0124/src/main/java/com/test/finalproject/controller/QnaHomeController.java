package com.test.finalproject.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.finalproject.service.NoteService;
import com.test.finalproject.service.QnaService;
import com.test.finalproject.vo.NoteVo;
import com.test.finalproject.vo.QnaVo;

@Controller
public class QnaHomeController {

	@Autowired
	private QnaService qservice;
	
	@Autowired 
	private NoteService nservice;
	
	@GetMapping("qna/qnahome")
	public String homeform(Model model) {
		
		
		List<QnaVo> qvo = qservice.qnalist();
		model.addAttribute("list", qservice.qnalist());
		
		List<NoteVo> nvo = nservice.notelist();
		model.addAttribute("list2", nservice.notelist());

		return "qna/qnahome.tiles";
	}
}
