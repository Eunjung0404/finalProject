package com.test.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.MovieImgVo;
import com.test.finalproject.vo.Movie_MVo;

import data.mybatis.mapper.ChaHomeMapper;

@Service
public class ChaHomeService {
   @Autowired ChaHomeMapper mapper;
   
   public List<Movie_MVo> getTopFiveMovie()
   {
	   return mapper.getTopFiveMovie();
   }
   public List<MovieImgVo> getTopFiveMovieImg(int moviecode)
   {
	   return mapper.getTopFiveMovieImg();
   }
}
