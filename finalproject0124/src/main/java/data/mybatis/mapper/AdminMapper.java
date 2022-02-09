package data.mybatis.mapper;

import java.util.Optional;

import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.vo.AdminVo;

public interface AdminMapper {
	
	Optional<AdminVo> login(AdminLoginForm form);
	
}
