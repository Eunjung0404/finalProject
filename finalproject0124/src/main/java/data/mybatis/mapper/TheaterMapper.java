package data.mybatis.mapper;

import java.util.List;

import com.test.finalproject.form.TheaterForm;
import com.test.finalproject.vo.TheaterVo;

public interface TheaterMapper {

	List<TheaterVo> getList();
	
	TheaterVo getTheater(int theatercode);
	
	int insert(TheaterForm form);
	
	int update(TheaterForm form);
	
}
