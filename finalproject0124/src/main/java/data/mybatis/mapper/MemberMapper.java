package data.mybatis.mapper;


import com.test.finalproject.security.CustomUserDetail;
import com.test.finalproject.vo.AuthoritiesVo;
import com.test.finalproject.vo.MemberVo;

public interface MemberMapper {
	int addMember(MemberVo vo);
	int addAuth(AuthoritiesVo vo);
	CustomUserDetail getAuths(String mid);
	
	MemberVo idCheck(String mid);
		
	MemberVo myInfo(String mid);
	
	String myInfoEdit(MemberVo vo);
} 
