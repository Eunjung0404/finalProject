package data.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.test.finalproject.vo.QnaCommentVo;
import com.util.PageUtil;

public interface QnaCommentMapper {

	public int insert(QnaCommentVo vo);
	
	public QnaCommentVo read(int commentcode);  //특정댓글읽기
	
	public int delete(int commentcode);
	
	public int update(QnaCommentVo content);
	
	public List<QnaCommentVo> listPaging(@Param("pu")PageUtil pu, @Param("qnacode")int qnacode);
}
