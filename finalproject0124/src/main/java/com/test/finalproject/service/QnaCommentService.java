package com.test.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.QnaCommentVo;
import com.util.PageUtil;

import data.mybatis.mapper.QnaCommentMapper;

@Service
public class QnaCommentService {
	@Autowired private QnaCommentMapper mapper;
	
	public int insert(QnaCommentVo vo) {
		return mapper.insert(vo);
	}
	public int update(QnaCommentVo vo) {
		return mapper.update(vo);
	}
	public int delete(int commentcode) {
		return mapper.delete(commentcode);
	}
	public List<QnaCommentVo> selectAll(HashMap<String, Object> map){
		return mapper.selectAll(map);
	}
	public int count(int qnacode) {
		return mapper.count(qnacode);
	}
}
