package com.test.finalproject.service;

import org.springframework.stereotype.Service;

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
}
