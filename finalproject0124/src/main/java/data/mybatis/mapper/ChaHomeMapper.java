package data.mybatis.mapper;

import java.util.List;

import com.test.finalproject.vo.MovieImgVo;
import com.test.finalproject.vo.Movie_MVo;
import com.test.finalproject.vo.NoteVo;

public interface ChaHomeMapper {

	List<Movie_MVo> getTopFiveMovie();
	MovieImgVo getTopFiveMovieImg(int moviecode);
	List<Movie_MVo> getCurrnetMovie();
	List<Movie_MVo> getFutureMovie();
	NoteVo getnote();
}
