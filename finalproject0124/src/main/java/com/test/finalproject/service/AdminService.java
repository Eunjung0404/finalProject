package com.test.finalproject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.test.finalproject.error.exception.NoSearchSqlException;
import com.test.finalproject.form.AdminInfoForm;
import com.test.finalproject.form.AdminInfoSelect;
import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.vo.AdminVo;

import data.mybatis.mapper.AdminMapper;
import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class AdminService {

	private final AdminMapper mapper;

	public AdminVo login(AdminLoginForm form) {
		return mapper.login(form);
	}
	
	public List<AdminInfoSelect> getList() {
		return mapper.getList();
	}
	
	public int insert(AdminInfoForm form) {
		return mapper.insert(form);
	}
	
	public int update(AdminInfoForm form) {
		int result = mapper.update(form);
		if(result == 0) {
			throw new NoSearchSqlException("수정 오류 : 조회된 ID가 없습니다.");
		}
		return result;
	}
	
	public int delete(String aid) {
		int result = mapper.delete(aid);
		if(result == 0) {
			throw new NoSearchSqlException("삭제 오류 : 조회된 ID가 없습니다.");
		}
		return result;
	}
	
	public String getPassword(String aid) {
		String apwd = mapper.getPassword(aid);
		if(apwd == null) {
			throw new NoSearchSqlException("조회 오류 : 조회된 ID가 없습니다.");
		}
		return apwd;
	}
}
