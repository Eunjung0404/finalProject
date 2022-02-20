package com.test.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.MovieImgVo;
import com.test.finalproject.vo.Movie_MVo;
import com.test.finalproject.vo.NoteVo;

import data.mybatis.mapper.ChaHomeMapper;

@Service
public class ChaHomeService {
   @Autowired ChaHomeMapper mapper;
   
   public List<Movie_MVo> getTopFiveMovie()
   {
	   return mapper.getTopFiveMovie();
   }
   public MovieImgVo getTopFiveMovieImg(int moviecode)
   {
	   return mapper.getTopFiveMovieImg(moviecode);
   }
   public List<Movie_MVo> getCurrnetMovie()
   {
	   return mapper.getCurrnetMovie();
   }
   public List<Movie_MVo> getFutureMovie()
   {
	   return mapper.getFutureMovie();
   }
   public NoteVo getnote()
   {
	   return mapper.getnote();
   }
}
