package com.test.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.test.finalproject.vo.AuthoritiesVo;
import com.test.finalproject.vo.MemberVo;

import data.mybatis.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper mapper;
	
	public int addMember(MemberVo vo) {
		String pwd = vo.getMpwd();
		vo.setMpwd(passwordEncoder.encode(pwd));
		mapper.addMember(vo);
		AuthoritiesVo auth = new AuthoritiesVo();
		auth.setMid(vo.getMid());
		if(vo.getMid().equals("ROLE_MEMBER")) {
			auth.setAuthority("ROLE_MEMBER");
			mapper.addAuth(auth);
		}
		return 1;
	}
	public int addAuth(AuthoritiesVo vo) {
		return mapper.addAuth(vo);
	}
	
}
