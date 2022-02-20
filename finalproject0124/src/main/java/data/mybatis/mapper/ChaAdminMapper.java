package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.ScreenVo;
import com.test.finalproject.vo.TheaterVo;

public interface ChaAdminMapper {

	List<TheaterVo> getTheaterList();
	List<HashMap<String, Object>> getTheaterMovieList(int theatercode);
	List<ScreenVo> getscreenList();
}
