package com.test.finalproject.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.test.finalproject.security.CustomUserDetail;
import com.test.finalproject.vo.AuthoritiesVo;
import com.test.finalproject.vo.MemberVo;

import data.mybatis.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper mapper;
	
	public CustomUserDetail getAuths(String mid) {
		return mapper.getAuths(mid);
	}
	
	
	public int addMember(MemberVo vo) {
		// 암호화 하여 저장
		String mpwd = vo.getMpwd();
		vo.setMpwd(passwordEncoder.encode(mpwd));
		mapper.addMember(vo);
		AuthoritiesVo auth = new AuthoritiesVo();
		auth.setMid(vo.getMid());
		if(vo.getMid().equals("admin")) {
			auth.setAuthority("ROLE_ADMIN");
			mapper.addAuth(auth);			
		} else {
			auth.setAuthority("ROLE_MEMBER");
			mapper.addAuth(auth);
		}		
		return 1;
	}
	
	public int addAuth(AuthoritiesVo vo) {
		return mapper.addAuth(vo);
	}
	
	public MemberVo idCheck(String mid) {
		return mapper.idCheck(mid);
	}	
	
	public MemberVo myInfo(String mid) {
		return mapper.myInfo(mid);
	}
	
	public String myInfoEdit(MemberVo vo) {
		return mapper.myInfoEdit(vo);
	}
	
	public MemberVo findId(String email, String mname) {
		return mapper.findId(email, mname);
	}
	
}
