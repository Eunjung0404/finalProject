package com.test.finalproject.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.ChaAdminScheduleVo;
import com.test.finalproject.vo.Movie_MVo;
import com.test.finalproject.vo.ScreenTimeVo;
import com.test.finalproject.vo.ScreenVo;
import com.test.finalproject.vo.SeatInfoVo;
import com.test.finalproject.vo.SeatVo;
import com.test.finalproject.vo.TheaterMovieVo;

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
	
	//
	public int addTheaterMovie(TheaterMovieVo vo)
	{
		return mapper.addTheaterMovie(vo);
	}
	public List<SeatVo> getSeat(int screencode)
	{
		return mapper.getSeat(screencode);
	}
	
	public List<ScreenTimeVo> getScreenTime(int screencode)
	{
		return mapper.getScreenTime(screencode);
	}
	
	public int addScreenTime(ScreenTimeVo vo)
	{
		return mapper.addScreenTime(vo);
	}
	
	public int insertseatinfo(SeatInfoVo vo)
	{
		return mapper.insertseatinfo(vo);
	}
	
	public List<SeatInfoVo> getSeatinfo(int timecode)
	{
		return mapper.getSeatinfo(timecode);
	}
	
	public int getseatrow(int screencode)
	{
		return mapper.getseatrow(screencode);
	}
	public int getseatcol(int screencode)
	{
		return mapper.getseatcol(screencode);
	}
	public Movie_MVo getmoviename(int moviecode)
	{
		return mapper.getmoviename(moviecode);
	}
}
