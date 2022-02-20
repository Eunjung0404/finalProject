package com.test.finalproject.vo;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mybatis.mapper.ChaAdminMapper;

@Service
public class ChaAdminService {

	@Autowired ChaAdminMapper mapper;
	
	public List<TheaterVo> getTheaterList(){
		return mapper.getTheaterList();
	}
	
	public List<HashMap<String, Object>> getTheaterMovieList(int theatercode){
		return mapper.getTheaterMovieList(theatercode);
	}
	
	public List<ScreenVo> getscreenList(){
		return mapper.getscreenList();
	}
}
