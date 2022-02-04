package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.TiketScreenTimeVo;

public interface ChaTheaterMapper {

	int areaCount(HashMap<String, Object> map);
    List<String> selectTheater(HashMap<String, Object> map);
    List<TiketScreenTimeVo> getScreenDate(HashMap<String, Object> map);
    List<HashMap<String, Object>> movielist();
    List<TiketScreenTimeVo> selectScreenTime(HashMap<String, Object> map);
}
