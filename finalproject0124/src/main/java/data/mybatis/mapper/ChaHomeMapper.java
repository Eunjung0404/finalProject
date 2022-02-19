package data.mybatis.mapper;

import java.util.List;

import com.test.finalproject.vo.MovieImgVo;
import com.test.finalproject.vo.Movie_MVo;

public interface ChaHomeMapper {

	List<Movie_MVo> getTopFiveMovie();
	List<MovieImgVo> getTopFiveMovieImg();
}
