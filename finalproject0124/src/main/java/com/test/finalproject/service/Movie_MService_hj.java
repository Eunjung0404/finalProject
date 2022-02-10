package com.test.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.Movie_MVo;

import data.mybatis.mapper.MovieMDetailMapper;

@Service
public class Movie_MService_hj {
	@Autowired private MovieMDetailMapper mapper;
	
	public int insert(Movie_MVo vo) {
		return mapper.insert(vo);
	}
	
	public Movie_MVo detail(int Moviecode) {
		return mapper.detail(Moviecode);
	}
	
	public List<Movie_MVo> selectAll(){
		return mapper.selectAll();
	}
	
	public List<Movie_MVo> searchlist(HashMap<String, Object> map){
		return mapper.searchlist(map);
	}
}
