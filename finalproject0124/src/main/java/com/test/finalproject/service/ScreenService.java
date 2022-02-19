package com.test.finalproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.finalproject.error.exception.NoSearchSqlException;
import com.test.finalproject.form.ScreenForm;
import com.test.finalproject.vo.ScreenVo;

import data.mybatis.mapper.ScreenMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScreenService {

	private final ScreenMapper mapper;
	
	public List<ScreenVo> getList(int theatercode) {
		return mapper.getList(theatercode);
	}
	
	public ScreenVo getScreen(int screencode) {
		return mapper.getScreen(screencode);
	}
	
	public int insert(ScreenForm form) {
		return mapper.insert(form);
	}
	
	public int  update(ScreenForm form) {
		int result = mapper.update(form);
		if(result == 0) {
			throw new NoSearchSqlException("수정 오류 : 상영관 정보가 없습니다.");
		}
		return result;
	}
	
	public int  delete(int screencode) {
		int result = mapper.delete(screencode);
		if(result == 0) {
			throw new NoSearchSqlException("삭제 오류 : 상영관 정보가 없습니다.");
		}
		return result;
	}
	
}
