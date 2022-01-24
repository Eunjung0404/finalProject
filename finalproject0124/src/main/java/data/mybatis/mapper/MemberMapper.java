package data.mybatis.mapper;

import com.test.finalproject.vo.AuthoritiesVo;
import com.test.finalproject.vo.MemberVo;

public interface MemberMapper {
	int addMember(MemberVo vo);
	int addAuth(AuthoritiesVo vo);
}
