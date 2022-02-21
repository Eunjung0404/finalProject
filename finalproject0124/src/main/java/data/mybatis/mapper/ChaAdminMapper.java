package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.ChaAdminScheduleVo;
import com.test.finalproject.vo.Movie_MVo;
import com.test.finalproject.vo.ScreenVo;
import com.test.finalproject.vo.TheaterVo;

public interface ChaAdminMapper {

	int getTheaterCode(String theatername);
	List<ChaAdminScheduleVo> getTheaterMovieList(int theatercode);
	List<ScreenVo> getscreenList(int theatercode);
	List<Movie_MVo> getCurrnetMovie();
}
