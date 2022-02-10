package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

public interface ChaSeatMapper {

	int insertseatList(HashMap<String, Object> map);
	int insertseatinfo(HashMap<String, Object> map);
	List<Integer> selectseatcode(int screencode);
	List<HashMap<String, Object>> seatLsit(HashMap<String, Object> map);
    int getseatrow(int screencode);
    int getseatcol(int screencode);
  }
