package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.finalproject.vo.QnaCommentVo;
import com.util.PageUtil;

public interface QnaCommentMapper {

	int insert(QnaCommentVo vo);
	int delete(int commentcode);
	int update(QnaCommentVo vo);
	List<QnaCommentVo> selectAll(HashMap<String, Object> map);
	int count(int qnacode);
}
