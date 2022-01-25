package data.mybatis.mapper;

import java.util.List;

import com.test.finalproject.vo.MovieImgVo;

public interface MovieImgMapper {
	int movieimginsert(MovieImgVo vo);
	
	List<MovieImgVo> movieimglist();
}
