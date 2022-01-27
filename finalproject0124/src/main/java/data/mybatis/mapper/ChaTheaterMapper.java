package data.mybatis.mapper;

import java.util.List;

public interface ChaTheaterMapper {

	int areaCount(String area);
    List<String> selectTheater(String area);
}
