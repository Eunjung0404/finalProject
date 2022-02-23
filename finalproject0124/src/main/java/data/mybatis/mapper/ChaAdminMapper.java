package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.ChaAdminScheduleVo;
import com.test.finalproject.vo.Movie_MVo;
import com.test.finalproject.vo.ScreenTimeVo;
import com.test.finalproject.vo.ScreenVo;
import com.test.finalproject.vo.SeatInfoVo;
import com.test.finalproject.vo.SeatVo;
import com.test.finalproject.vo.TheaterMovieVo;
import com.test.finalproject.vo.TheaterVo;

public interface ChaAdminMapper {

	int getTheaterCode(String theatername);
	List<ChaAdminScheduleVo> getTheaterMovieList(HashMap<String, Object> map);
	
	int getTotalPageMoVie(HashMap<String, Object> map);
	List<ScreenVo> getscreenList(int theatercode);
	List<Movie_MVo> getCurrnetMovie();
	///////
	int addTheaterMovie(TheaterMovieVo vo);
	List<SeatVo> getSeat(int screencode);
	List<ScreenTimeVo> getScreenTime(int screencode);
	int addScreenTime(ScreenTimeVo vo);
	int insertseatinfo(SeatInfoVo vo);
	List<SeatInfoVo> getSeatinfo(int timecode);
	int getseatrow(int screencode);
	int getseatcol(int screencode);
	Movie_MVo getmoviename(int moviecode);
	int getTimecode();
	
	//////////////////////////////////////////
	
	int deleteTheatermovie(int tmovecode);
	int deleteTime(int timecode);
	
	/////////////////////////////////////////
	TheaterMovieVo getTheaterMovieDetail(int tmovecode);
	ScreenTimeVo getTimeDetail(int timecode);
	
	/////////////////////////////////////////////
	
	int updateTheatermovie(TheaterMovieVo vo);
	int updateTime(ScreenTimeVo vo);
}
