package com.test.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.test.finalproject.security.CustomUserDetail;
import com.test.finalproject.vo.AuthoritiesVo;
import com.test.finalproject.vo.MemberQnaVo;
import com.test.finalproject.vo.MemberVo;
import com.test.finalproject.vo.ReviewVo;

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
		return mapper.findId2(map);
	}	

//	비밀번호 찾기 이메일 인증(아이디, 이메일)
	public MemberVo findPwd(HashMap<String, Object> map) {
		return mapper.findPwd(map);
	}
	
//	비밀번호 찾기 이메일 인증(아이디, 전화번호)
	public MemberVo findPwd2(HashMap<String, Object> map) {
		return mapper.findPwd2(map);
	}
	
//	비밀번호 변경(새로운 비밀번호를 암호화 하여 저장)
	public int changePwd(MemberVo vo) {
		String mpwd = vo.getMpwd();
		vo.setMpwd(passwordEncoder.encode(mpwd));
		return mapper.changePwd(vo);		
	}
	
	// 아이디와 일치하는 회원 정보 가져오기
	public MemberVo getInfo(String mid) {		
		return mapper.getInfo(mid);
	}

//	회원탈퇴
	public int withdrawal(String mid) {
		return mapper.withdrawal(mid);
	}
	
	// 마이페이지에 작성한 문의 글 출력
	public List<MemberQnaVo> selectQuestion(HashMap<String, Object> map) {
		return mapper.selectQuestion(map);
	}
	
	// 문의 글 개수
	public int getCount(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	
//	문의 글 상세보기
	public MemberQnaVo detatilQuestion(HashMap<Object, Object> map) {
		return mapper.detatilQuestion(map);
	}
	
	
//	내가 작성란 리뷰 보기
	public List<ReviewVo> myReview(String mid) {
		return mapper.myReview(mid);
	}
}
