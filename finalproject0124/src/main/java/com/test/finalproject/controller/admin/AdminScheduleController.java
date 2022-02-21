package com.test.finalproject.controller.admin;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.finalproject.aop.annotation.AdminLevel;
import com.test.finalproject.service.ChaAdminService;
import com.test.finalproject.vo.ChaAdminScheduleVo;
import com.test.finalproject.vo.Movie_MVo;
import com.test.finalproject.vo.ScreenVo;

@Controller
@RequestMapping("/admin/schedule")
public class AdminScheduleController {

	@Autowired
	ChaAdminService service;

	@GetMapping("/ALL")
	@AdminLevel(1)
	public String allTheaterPage() {
		return "admin/theaters";
	}

	// 극장관리 페이지(스케쥴관리,상영영화 관리)
	@GetMapping("/{theatername}")
//	@AdminLevel(2)
	public String schedulePage(@PathVariable("theatername") String theatername, Model m) {

		int theatercode = service.getTheaterCode(theatername);
		List<ChaAdminScheduleVo> movielist = service.getTheaterMovieList(theatercode);
		List<ScreenVo> screenlist = service.getscreenList(theatercode);
		List<Movie_MVo> Cmovielist = service.getCurrnetMovie();
		Date sysdate=new Date();
		m.addAttribute("sysdate", sysdate);
		m.addAttribute("screenlist", screenlist);
		m.addAttribute("movielist", movielist);
		m.addAttribute("Cmovielist", Cmovielist);
		return "ticket/theaterctrl";
	}

}
