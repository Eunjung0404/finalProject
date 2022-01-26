package com.test.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.QnaVo;

import data.mybatis.mapper.QnaMapper;

@Service
public class QnaService {
	@Autowired private QnaMapper mapper;
	
	public int insert(QnaVo vo) {
		return mapper.insert(vo);
	}
	public List<QnaVo> selectList(HashMap<String,Object> map){
		return mapper.list(map);
	}
	public int getCount(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	public QnaVo prev(int num) {
		return mapper.prev(num);
	}
	public QnaVo next(int num) {
		return mapper.next(num);
	}
	public int delete(int num) {
		return mapper.delete(num);
	}
	public int update(QnaVo vo) {
		return mapper.update(vo);
	}
	public QnaVo detail(int num) {
		return mapper.detail(num);
	}
}
