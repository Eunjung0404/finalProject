package com.test.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.MovieImgVo;

import data.mybatis.mapper.MovieImgMapper;

@Service
public class MovieImgService_hj {
	@Autowired private MovieImgMapper mapper;
	
	//insert
	public int movieimginsert(MovieImgVo vo) {
		return mapper.movieimginsert(vo);
	}
	
	public List<MovieImgVo> movieimglistall(){
		return mapper.movieimglistall();
	}
	
	public MovieImgVo movieimglist(int moviecode) {
		return mapper.movieimglist(moviecode);
	}
}
