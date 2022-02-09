package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.NoteVo;

public interface NoteMapper {
	int insert(NoteVo vo);
	List<NoteVo> list(HashMap<String, Object> map);
	int count(HashMap<String, Object> map);
}
