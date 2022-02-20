package com.test.finalproject.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.finalproject.error.exception.NoSearchSqlException;
import com.test.finalproject.form.SeatForm;
import com.test.finalproject.vo.SeatVo;

import data.mybatis.mapper.SeatMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SeatService {
	
	private final SeatMapper mapper;
	
	public List<SeatVo> getList(int screencode) {
		List<SeatVo> result = mapper.getList(screencode);
		if(result.isEmpty()) {
			throw new NoSearchSqlException("조회 오류 : 좌석 정보가 없습니다.");
		}
		return result;
	}
	
	public int insert(List<SeatForm> list, int screencode) {
		return mapper.insert(list, screencode);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int update(int screencode, List<SeatForm> list) {
		mapper.delete(screencode);
		return mapper.insert(list, screencode);
	}
	
	public int delete(int screencode) {
		int result = mapper.delete(screencode);
		if(result == 0) {
			throw new NoSearchSqlException("삭제 오류 : 좌석 정보가 없습니다.");
		}
		return result;
	}
}
