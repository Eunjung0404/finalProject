package data.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.test.finalproject.form.SeatForm;
import com.test.finalproject.vo.SeatVo;

public interface SeatMapper {

	List<SeatVo> getList(int screencode);
	
	int insert(
				@Param("list") List<SeatForm> list, 
				@Param("screen") Map<String, Integer> screen
			);
	
	int delete(int screencode);
	
	int updateCnt(
				@Param("seatcount") int seatcount,
				@Param("screencode") int screencode
			); 
	
}
