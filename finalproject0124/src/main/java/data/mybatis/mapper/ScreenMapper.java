package data.mybatis.mapper;

import java.util.List;

import com.test.finalproject.form.ScreenForm;
import com.test.finalproject.vo.ScreenVo;

public interface ScreenMapper {

	List<ScreenVo> getList(int theatercode);
	
	ScreenVo getScreen(int screencode);
	
	int insert(ScreenForm form);
	
	int update(ScreenForm form);
	
	int delete(int screencode);
	
}
