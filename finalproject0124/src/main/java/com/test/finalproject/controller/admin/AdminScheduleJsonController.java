package com.test.finalproject.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.ChaAdminService;
import com.test.finalproject.vo.Movie_MVo;
import com.test.finalproject.vo.ScreenTimeVo;
import com.test.finalproject.vo.SeatInfoVo;
import com.test.finalproject.vo.SeatVo;
import com.test.finalproject.vo.TheaterMovieVo;

@RestController
@RequestMapping("/admin/schedule")
public class AdminScheduleJsonController {

	@Autowired
	ChaAdminService service;

	// 시트정보 가져오기
	@GetMapping(value = "/seat-list", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectcurrentSeat(int screencode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<SeatVo> seatlistList = service.getSeat(screencode);

		map.put("list", seatlistList);
		map.put("row", service.getseatrow(screencode));
		map.put("col", service.getseatcol(screencode));
		return map;
	}

	// 시트인포 가져오기
	@GetMapping(value = "/seatinfo-list", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> selectSeatinfo(int timecode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<SeatInfoVo> seatinfolist = service.getSeatinfo(timecode);
		map.put("seatinfolist", seatinfolist);
		return map;
	}

	// 스케쥴 가져오기
	@GetMapping(value = "/time", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> gettime(int screencode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<ScreenTimeVo> timelist = service.getScreenTime(screencode);
		ArrayList<String> movienamelist = new ArrayList<String>();
		for (int i = 0; i < timelist.size(); i++) {
			Movie_MVo vo = service.getmoviename(Integer.parseInt(timelist.get(i).getMoviecode()));
			String moviename = vo.getMoviename();
			movienamelist.add(moviename);
		}
		map.put("movienamelist", movienamelist);
		map.put("timelist", timelist);
		return map;
	}
	
	//스케쥴 detail
	@GetMapping(value = "/time-detail", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> gettimedetail(int timecode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ScreenTimeVo vo=service.getTimeDetail(timecode);
		Movie_MVo vom = service.getmoviename(Integer.parseInt(vo.getMoviecode()));
		map.put("vo", vo);
		map.put("moviename",vom.getMoviename());
		return map;
	}
	
	//영화 detail
	@GetMapping(value = "/tm-detail", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> getTMDetail(int tmovecode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		TheaterMovieVo vo=service.getTheaterMovieDetail(tmovecode);
		map.put("vo", vo);
		return map;
	}

}
