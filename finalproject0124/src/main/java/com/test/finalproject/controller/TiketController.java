package com.test.finalproject.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TiketController {

	
	@GetMapping("/tiket")
	public String tiketPage()
	{
		return "tiket/tiket.tiles";
	}
	
	@RequestMapping("member/seat")
	public String seatPage(Model m,String screencode,String timecode,
			String theatername,Date screendate,String screentime,String moviecode,String moviename)
	{
		m.addAttribute("screencode", screencode);
		m.addAttribute("timecode", timecode);
		m.addAttribute("theatername",theatername);
		SimpleDateFormat datefromat=new SimpleDateFormat("yyyy/MM/dd (E)요일");
		String sDate = datefromat.format(screendate);
		m.addAttribute("screendate",sDate);
		m.addAttribute("screentime",screentime);
		m.addAttribute("moviecode",moviecode);
		m.addAttribute("moviename",moviename);
		
		return "tiket/seatSelect.tiles";
	}
	
}
