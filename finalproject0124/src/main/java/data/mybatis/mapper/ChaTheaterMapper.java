package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

public interface ChaTheaterMapper {

	int areaCount(HashMap<String, Object> map);
    List<String> selectTheater(String area);
}
