package com.test.finalproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.NoteVo;

import data.mybatis.mapper.NoteMapper;
@Service
public class NoteService {
	@Autowired private NoteMapper mapper;
	
	public int insert(NoteVo vo) {
		return mapper.insert(vo);
	}
	public int getCount(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	public List<NoteVo> selectList(HashMap<String, Object> map){
		return mapper.list(map);
	}
	public List<NoteVo> notelist() {
		return mapper.notelist();
	}
	public int detail(NoteVo vo) {
		return mapper.detail(vo);
	}
}
