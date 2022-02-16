package com.test.finalproject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.test.finalproject.error.exception.NoSearchSqlException;
import com.test.finalproject.form.TheaterForm;
import com.test.finalproject.vo.TheaterVo;

import data.mybatis.mapper.TheaterMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TheaterService {

	private final TheaterMapper mapper;
	
	public List<TheaterVo> getList(){
		return mapper.getList();
	}
	
	public TheaterVo getTheater(int theatercode) {
		return Optional.ofNullable(mapper.getTheater(theatercode))
				.orElseThrow(() -> 
					new NoSearchSqlException("조회 오류 : 극장 정보가 없습니다."));
	}
	
	public int insert(TheaterForm form) {
		return mapper.insert(form);
	}
	
	public int update(TheaterForm form) {
		int result = mapper.update(form);
		if(result == 0) {
			throw new NoSearchSqlException("수정 오류 : 극장 정보가 없습니다.");
		}
		return result;
	}
	
}
