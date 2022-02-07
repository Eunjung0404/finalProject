package data.mybatis.mapper;

import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.vo.AdminVo;

public interface AdminMapper {
	
	AdminVo login(AdminLoginForm form);
	
}
