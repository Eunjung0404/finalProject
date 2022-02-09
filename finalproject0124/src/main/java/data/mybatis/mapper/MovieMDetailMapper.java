package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.Movie_MVo;

public interface MovieMDetailMapper {
	int insert(Movie_MVo vo);
	
	Movie_MVo detail(int moviecode);
	
	List<Movie_MVo> selectAll(HashMap<String, Object> map);
}
