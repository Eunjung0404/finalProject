package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.Movie_MVo;

public interface MovieMDetailMapper {
	int insert(Movie_MVo vo);
	
	Movie_MVo detail(int moviecode);
	
	//영화 등록 리스트 페이징
	List<Movie_MVo> selectAll(HashMap<String, Object> map1);
	
	int moviecount(HashMap<String, Object> map1);
	
	//검색페이지
	List<Movie_MVo> searchlist(HashMap<String, Object> map);
	
	int movieupdate(Movie_MVo vo);
}
