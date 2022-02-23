package com.test.finalproject.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.test.finalproject.service.ChaReservationService;
import com.test.finalproject.vo.ReservationVo;
import com.test.finalproject.vo.TiketScreenTimeVo;
import com.util.PageUtil;

@RestController
public class ChaReservationJSONController {

	@Autowired
	ChaReservationService service;

	@GetMapping(value = "/member/history", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> gethistory(
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String mid) {
		HashMap<String, Object> pmap = new HashMap<String, Object>();
		int count = service.count(mid);
		System.out.println("카운트:" + count);
		PageUtil pu = new PageUtil(pageNum, 10, 5, count);
		pmap.put("startRow", pu.getStartRow());
		pmap.put("endRow", pu.getEndRow());
		pmap.put("mid", mid);
		List<ReservationVo> list = service.ReservationSelect(pmap);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("totalPageCount", pu.getTotalPageCount());
		map.put("pageNum", pageNum);

		ArrayList<Integer> codelist=new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			int moviecode = service.getmoviecode(list.get(i).getMoviename());
			codelist.add(i, moviecode);
		}
		map.put("codelist", codelist);
		map.put("list", list);
		ArrayList<String> datelist=new ArrayList<String>();
		
		for (int i = 0; i < list.size(); i++) {
			TiketScreenTimeVo vol=service.getscreendate(Integer.parseInt(list.get(i).getTimecode()));
			SimpleDateFormat datefromat = new SimpleDateFormat("yyyy/MM/dd(E)");
			String sDate = datefromat.format(vol.getScreendate());
			datelist.add(i,sDate);
		}
		map.put("datelist", datelist);
		System.out.println(pu.getStartPageNum());
		System.out.println(pu.getEndPageNum());
		System.out.println("전체페이지" + pu.getTotalPageCount());

		return map;
	}

	@GetMapping(value = "/member/cancel", produces = { MediaType.APPLICATION_JSON_VALUE })
	public HashMap<String, Object> cancel(int reservationcode, int moviecode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		service.CancelReservation(reservationcode);
		service.Cancelpayment(reservationcode);
		List<String> infolist = service.getinfocode(reservationcode);
		for (int i = 0; i < infolist.size(); i++) {
			service.CancelSeat(Integer.parseInt(infolist.get(i)));
		}

		service.MinusCount(moviecode);

		return map;
	}
}
