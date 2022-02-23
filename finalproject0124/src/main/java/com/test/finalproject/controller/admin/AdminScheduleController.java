package com.test.finalproject.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.finalproject.aop.annotation.AdminLevel;
import com.test.finalproject.service.ChaAdminService;
import com.test.finalproject.service.ChaSeatService;
import com.test.finalproject.vo.ChaAdminScheduleVo;
import com.test.finalproject.vo.Movie_MVo;
import com.test.finalproject.vo.ScreenTimeVo;
import com.test.finalproject.vo.ScreenVo;
import com.test.finalproject.vo.TheaterMovieVo;
import com.util.PageUtil;

@Controller
@RequestMapping("/admin/schedule")
public class AdminScheduleController {

	@Autowired
	ChaAdminService service;
	@Autowired
	ChaSeatService serviceseat;

	@GetMapping("/ALL")
	@AdminLevel(1)
	public String allTheaterPage() {
		return "admin/theaters";
	}

	// 극장관리 페이지(스케쥴관리,상영영화 관리)
	@RequestMapping("/{theatername}")
//	@AdminLevel(2)
	public String schedulePage(@PathVariable("theatername") String theatername, Model m,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field, String keyword) {
		// 검색
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("field", field);
		int totalRowCountMovie = service.getTotalPageMoVie(map);
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCountMovie);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		int theatercode = service.getTheaterCode(theatername);
		map.put("theatercode", theatercode);
		List<ChaAdminScheduleVo> movielist = service.getTheaterMovieList(map);

		List<ScreenVo> screenlist = service.getscreenList(theatercode);
		List<Movie_MVo> Cmovielist = service.getCurrnetMovie();
		Date sysdate = new Date();
		m.addAttribute("theatername", theatername);
		m.addAttribute("sysdate", sysdate);
		m.addAttribute("screenlist", screenlist);
		m.addAttribute("movielist", movielist);
		m.addAttribute("Cmovielist", Cmovielist);

		m.addAttribute("pu", pu);
		m.addAttribute("keyword", keyword);
		m.addAttribute("field", field);
		return "ticket/theaterctrl";
	}

	@PostMapping("/{theatername}/insert")
	public String scheduleinsert(@PathVariable("theatername") String theatername, Model m, ScreenTimeVo vo) {

		// 스케쥴 인서트
		service.addScreenTime(vo);
		int timecode = service.getTimecode();
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Integer> list = serviceseat.selectseatcode(Integer.parseInt(vo.getScreencode()));
		map.put("timecode", timecode);
		map.put("state", 0);
		for (int i = 0; i < list.size(); i++) {
			map.put("seatcode", list.get(i));
			serviceseat.insertseatinfo(map);
		}

		return "redirect:/admin/schedule/{theatername}";
	}

	@PostMapping("/{theatername}/timedelete")
	public String scheduledelete(@PathVariable("theatername") String theatername,  int timecode) {

		service.deleteTime(timecode);


		return "redirect:/admin/schedule/{theatername}";
	}
	@PostMapping("/{theatername}/timeupdate")
	public String scheduleupdate(@PathVariable("theatername") String theatername,ScreenTimeVo vo) {

		System.out.println(vo);
		service.updateTime(vo);
		return "redirect:/admin/schedule/{theatername}";
	}


	@PostMapping("/{theatername}/movieadd")
	public String Tmovieinsert(@PathVariable("theatername") String theatername, TheaterMovieVo vo) {

		// 극장코드 가져오기
		int theatercode = service.getTheaterCode(theatername);
		// 등록
		vo.setTheatercode(String.valueOf(theatercode));
		service.addTheaterMovie(vo);

		return "redirect:/admin/schedule/{theatername}";
	}

	@PostMapping("/{theatername}/movieupdate")
	public String Tmovieupdate(@PathVariable("theatername") String theatername, TheaterMovieVo vo) {

		service.updateTheatermovie(vo);

		return "redirect:/admin/schedule/{theatername}";
	}

	@PostMapping("/{theatername}/moviedelete")
	public String Tmoviedelete(@PathVariable("theatername") String theatername, int tmovecode) {

		service.deleteTheatermovie(tmovecode);

		return "redirect:/admin/schedule/{theatername}";
	}

}
