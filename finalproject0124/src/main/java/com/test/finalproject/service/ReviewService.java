package com.test.finalproject.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.AvgscoreVo;
import com.test.finalproject.vo.ReviewVo;

import data.mybatis.mapper.ReviewMapper;

@Service
public class ReviewService {
	@Autowired private ReviewMapper mapper;
	
	public int insertcomments(ReviewVo vo) {
		return mapper.insertcomments(vo);
	}
	
	public List<ReviewVo> selectAll(HashMap<String, Object> map){
		return mapper.selectAll(map);
	}
	
	public int count(int moviecode) {
		return mapper.count(moviecode);
	}
	
	public AvgscoreVo avg(int moviecode) {
		return mapper.avg(moviecode);
	}
	
	public int reviewdelete(int reviewcode) {
		return mapper.reviewdelete(reviewcode);
	}
}
