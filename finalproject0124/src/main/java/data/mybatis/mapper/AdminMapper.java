package data.mybatis.mapper;

import java.util.List;
import java.util.Optional;

import com.test.finalproject.form.AdminInfoForm;
import com.test.finalproject.form.AdminInfoSelect;
import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.vo.AdminVo;

public interface AdminMapper {
	
	Optional<AdminVo> login(AdminLoginForm form);
	
	List<AdminInfoSelect> getList();
	
	int insert(AdminInfoForm form);
	
	int update(AdminInfoForm form);
	
	int delete(String aid);
	
	String getPassword(String aid);
	
}
