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
    List<HashMap<String, Object>> searchMovie(String keyword);
    List<HashMap<String, Object>> searchTheater(String keyword);
    List<String> selectScreenName(HashMap<String, Object> map);
    int getbookseat(int timecode);
    int getseatcount(int screencode);
}
