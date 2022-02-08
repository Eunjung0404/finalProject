package com.test.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
//	아이디 중복검사
	public int idCheck(String mid) {
		return mapper.idCheck(mid);
	}		
	
//	회원 정보 변경
	public String myInfoEdit(MemberVo vo) {
		return mapper.myInfoEdit(vo);
	}
	
//	이름과 전화번호로 아이디 찾기
	public MemberVo findId(HashMap<String, Object> map) {
		return mapper.findId(map);
	}
//	이름과 이메일로 아이디 찾기
	public MemberVo findId2(HashMap<String, Object> map) {
		return mapper.findId(map);
	}	
	
//	회원 탈퇴
	public MemberVo withdrawal(String mname) {
		return mapper.withdrawal(mname);
	}	

//	비밀번호 찾기 이메일 인증
	public MemberVo selectMember(String mname, String memail) {
		return mapper.selectMember(mname, memail);
	}
	
//	비밀번호 변경(새로운 비밀번호를 암호화 하여 저장)
	public int changePwd(MemberVo vo) {
		String mpwd = vo.getMpwd();
		vo.setMpwd(passwordEncoder.encode(mpwd));
		return mapper.changePwd(vo);		
	}

}
