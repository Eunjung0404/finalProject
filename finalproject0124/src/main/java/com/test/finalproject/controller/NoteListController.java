package com.test.finalproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.finalproject.service.NoteService;
import com.test.finalproject.vo.NoteVo;
import com.util.PageUtil;

@Controller
public class NoteListController {
	@Autowired private NoteService service;
	
	@RequestMapping("/note/list")
	public String list(@RequestParam(value="pageNum", defaultValue="1")int pageNum,
																	   String field,
																	   String keyword,
																	   Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		
		int totalRowCount = service.getCount(map);
		PageUtil pu = new PageUtil(pageNum, 5, 10, totalRowCount);
		int startRow = pu.getStartRow();    //시작행번호
		int endRow = pu.getEndRow();        //끝행번호
		map.put("startRow", startRow);
		map.put("endRow", endRow);
	    List<NoteVo> list = service.selectList(map);    
	    model.addAttribute("field", field);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("list", list);
	    model.addAttribute("pu", pu);
		return "note/list.tiles";
	}
}
