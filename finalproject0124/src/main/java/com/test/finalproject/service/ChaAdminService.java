package com.test.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.ChaAdminScheduleVo;
import com.test.finalproject.vo.Movie_MVo;
import com.test.finalproject.vo.ScreenVo;

import data.mybatis.mapper.ChaAdminMapper;

@Service
public class ChaAdminService {

	@Autowired ChaAdminMapper mapper;
	
	public int getTheaterCode(String theatername){
		return mapper.getTheaterCode(theatername);
	}
	
	public List<ChaAdminScheduleVo> getTheaterMovieList(int theatercode){
		return mapper.getTheaterMovieList(theatercode);
	}
	
	public List<ScreenVo> getscreenList(int theatercode){
		return mapper.getscreenList(theatercode);
	}
	
	public List<Movie_MVo> getCurrnetMovie()
	{
		return mapper.getCurrnetMovie();
	}
}
