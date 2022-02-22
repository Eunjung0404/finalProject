package com.test.finalproject.service;

import java.util.HashMap;
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
	
	@Transactional(rollbackFor = Exception.class)
	public int insert(List<SeatForm> list, int screencode) {
		
		int seatcount = cntAfterInsert(list, screencode);
		
		return updateCnt(seatcount, screencode);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int update(int screencode, List<SeatForm> list) {
		
		delete(screencode);
		int seatcount = cntAfterInsert(list, screencode);
		
		return updateCnt(seatcount, screencode);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int delete(int screencode) {
		
		int result = mapper.delete(screencode);
		
		if(result == 0) {
			throw new NoSearchSqlException("삭제 오류 : 좌석 정보가 없습니다.");
		}
		updateCnt(0, screencode);
		
		return result;
	}
	
	private int cntAfterInsert(List<SeatForm> list, int screencode) {
		
		HashMap<String, Integer> screen = new HashMap<String, Integer>();
		screen.put("screencode", screencode);
		screen.put("seatcount", 0);
		
		mapper.insert(list, screen);
		
		int seatcount = screen.get("seatcount");
		if(seatcount == 0) {
			throw new NoSearchSqlException("등록 오류 : 공백만 등록할 수 없습니다.");
		}
		
		return seatcount;
	}
	
	private int updateCnt(int seatcount, int screencode) {
		
		int result = mapper.updateCnt(seatcount, screencode);
		
		if(result == 0) {
			throw new NoSearchSqlException("수정 오류 : 상영관 정보가 없습니다.");
		}
		
		return result;
	}
	
}
