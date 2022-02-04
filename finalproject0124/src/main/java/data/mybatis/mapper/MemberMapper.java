package data.mybatis.mapper;



import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.test.finalproject.security.CustomUserDetail;
import com.test.finalproject.vo.AuthoritiesVo;
import com.test.finalproject.vo.MemberVo;

public interface MemberMapper {
	int addMember(MemberVo vo);
	int addAuth(AuthoritiesVo vo);
	CustomUserDetail getAuths(String mid);
	
//	아이디 중복검사
	MemberVo idCheck(String mid);
	
//	회원 정보 조회
	MemberVo myInfo(@Param("mid")String mid, @Param("mphone")String mphone);
	
//	회원 정보 변경
	String myInfoEdit(MemberVo vo);
	
//	이름과 전화번호로 아이디 찾기
	MemberVo findId(HashMap<String, Object> map);
//	이름과 이메일로 아이디 찾기
	MemberVo findId2(HashMap<String, Object> map);
	
//	회원 탈퇴
	MemberVo withdrawal(String mname);
	
//	비밀번호 찾기 이메일 인증 테스트
	MemberVo selectMember(@Param("mname")String mname, @Param("memail")String memail);
	
//	비밀번호 변경
	int changePwd(MemberVo vo);
} 

