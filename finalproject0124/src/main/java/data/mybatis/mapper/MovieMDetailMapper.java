package data.mybatis.mapper;

import java.util.List;

import com.test.finalproject.vo.Movie_MVo;

public interface MovieMDetailMapper {
	int insert(Movie_MVo vo);
	
	Movie_MVo detail(int Moviecode);
	
	List<Movie_MVo> selectAll();
}
