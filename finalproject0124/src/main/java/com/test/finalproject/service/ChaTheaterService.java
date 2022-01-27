package com.test.finalproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mybatis.mapper.ChaTheaterMapper;

@Service
public class ChaTheaterService {

	@Autowired ChaTheaterMapper mapper;
	
	public int areaCount(String area)
	{
		return mapper.areaCount(area);
	}
	public List<String> selectTheater(String area)
	{
		return mapper.selectTheater(area);
	}
}
