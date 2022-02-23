package com.test.finalproject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.TiketScreenTimeVo;

import data.mybatis.mapper.ChaTheaterMapper;

@Service
public class ChaTheaterService {

	@Autowired ChaTheaterMapper mapper;
	
	public int areaCount(HashMap<String, Object> map)
	{
		return mapper.areaCount(map);
	}
	public List<String> selectTheater(HashMap<String, Object> map)
	{
		return mapper.selectTheater(map);
	}
	public List<TiketScreenTimeVo> getScreenDate(HashMap<String, Object> map)
	{
		return mapper.getScreenDate(map);
	}
	public List<HashMap<String, Object>> movielist()
	{
          return mapper.movielist();
	}
	public List<TiketScreenTimeVo> selectScreenTime(HashMap<String, Object> map)
	{
		return mapper.selectScreenTime(map);
	}
	public List<HashMap<String, Object>> searchMovie(String keyword)
	{
          return mapper.searchMovie(keyword);
	}
	public List<HashMap<String, Object>> searchTheater(String keyword)
	{
          return mapper.searchTheater(keyword);
	}
	public List<String> selectScreenName(HashMap<String, Object> map)
	{
		return mapper.selectScreenName(map);
	}
	public int getbookseat(int timecode)
	{
		return mapper.getbookseat(timecode);
	}
	public int getseatcount(int screencode)
	{
		return mapper.getseatcount(screencode);
	}
}
