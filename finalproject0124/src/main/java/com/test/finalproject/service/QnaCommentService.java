package com.test.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.test.finalproject.vo.QnaCommentVo;
import com.util.PageUtil;

import data.mybatis.mapper.QnaCommentMapper;

public class QnaCommentService {
	@Autowired private QnaCommentMapper mapper;
	
	public int insert(QnaCommentVo vo) {
		return mapper.insert(vo);
	}
	public QnaCommentVo read(int commentcode) {
		return mapper.read(commentcode);
	}
	public int update(QnaCommentVo vo) {
		return mapper.update(vo);
	}
	public int delete(int commentcode) {
		return mapper.delete(commentcode);
	}
	public List<QnaCommentVo> listPaging(PageUtil pu, int commentcode){
		return mapper.listPaging(pu, commentcode);
	}

}
