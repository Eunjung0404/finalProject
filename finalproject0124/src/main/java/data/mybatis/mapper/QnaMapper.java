package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.QnaVo;

public interface QnaMapper {
	int insert(QnaVo vo);
	List<QnaVo> list(HashMap<String, Object> map);
	int count(HashMap<String, Object> map);
	int delete(int num);
	int update(QnaVo vo);
	QnaVo detail(int num);
	QnaVo prev(int num);
	QnaVo next(int num);
}
