package data.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.finalproject.form.SeatForm;
import com.test.finalproject.vo.SeatVo;

public interface SeatMapper {

	List<SeatVo> getList(int screencode);
	
	int insert(
				@Param("list") List<SeatForm> list
				, @Param("screencode") int screencode
			);
	
	int delete(int screencode);
	
}
