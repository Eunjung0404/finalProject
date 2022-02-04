package com.test.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.ReviewVo;

import data.mybatis.mapper.ReviewMapper;

@Service
public class ReviewService {
	@Autowired private ReviewMapper mapper;
	
	public int insertcomments(ReviewVo vo) {
		return mapper.insertcomments(vo);
	}
}
