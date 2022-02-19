package com.test.finalproject.service;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.TiketSeatParameterVo;

import data.mybatis.mapper.ChapaymentMapper;
@Service
public class ChapaymentService {
	@Autowired ChapaymentMapper mapper;
	public int reservationInsert(TiketSeatParameterVo vo)
	{
		return mapper.reservationInsert(vo);
	}
	public int getReservationCode()
	{
		return mapper.getReservationCode();
	}
	public int reservationSeatInsert(HashMap<String, Object> map)
	{
		return mapper.reservationSeatInsert(map);
	}
	public int paymentInsert(HashMap<String, Object> map)
	{
		return mapper.paymentInsert(map);
	}
	public int seatInfoUpdate(int infocode)
	{
		return mapper.seatInfoUpdate(infocode);
	}
	public int addCount(int moviecode)
	{
		return mapper.addCount(moviecode);
	}
	public int getPaymentCode()
	{
		return mapper.getPaymentCode();
	}
	public Date getPaymentData()
	{
		return mapper.getPaymentData();
	}
}
