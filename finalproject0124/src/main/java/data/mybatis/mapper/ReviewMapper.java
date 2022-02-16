package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.ReviewVo;

public interface ReviewMapper {
	int insertcomments(ReviewVo vo);
	
	List<ReviewVo> selectAll(HashMap<String, Object> map);
	
	int count(int moviecode);
}
