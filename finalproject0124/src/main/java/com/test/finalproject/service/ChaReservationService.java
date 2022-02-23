package com.test.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.PaymentVo;
import com.test.finalproject.vo.ReservationVo;
import com.test.finalproject.vo.TiketScreenTimeVo;

import data.mybatis.mapper.ChaReservationMapper;

@Service
public class ChaReservationService {

	@Autowired
	ChaReservationMapper mapper;

	public int count(String mid) {
		return mapper.count(mid);
	}

	public List<ReservationVo> ReservationSelect(HashMap<String, Object> map) {
		return mapper.ReservationSelect(map);
	}

	public PaymentVo getpayment(int reservationcode) {
		return mapper.getpayment(reservationcode);
	}

	public List<String> getseatname(int reservationcode) {
		return mapper.getseatname(reservationcode);
	}

	public int CancelReservation(int reservationcode) {
		return mapper.CancelReservation(reservationcode);
	}

	public int Cancelpayment(int reservationcode) {
		return mapper.Cancelpayment(reservationcode);
	}

	public List<String> getinfocode(int reservationcode) {
		return mapper.getinfocode(reservationcode);
	}

	public int CancelSeat(int infocode) {
		return mapper.CancelSeat(infocode);
	}

	public int getmoviecode(String moviename) {
		return mapper.getmoviecode(moviename);
	}

	public int MinusCount(int moviecode) {
		return mapper.MinusCount(moviecode);
	}

	public TiketScreenTimeVo getscreendate(int timecode) {
		return mapper.getscreendate(timecode);
	}

}
