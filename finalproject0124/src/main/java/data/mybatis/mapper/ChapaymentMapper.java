package data.mybatis.mapper;

import java.util.HashMap;

import com.test.finalproject.vo.TiketSeatParameterVo;

public interface ChapaymentMapper {

	int reservationInsert(TiketSeatParameterVo vo);
	int getReservationCode();
	int reservationSeatInsert(HashMap<String, Object> map);
	int paymentInsert(HashMap<String, Object> map);
	int seatInfoUpdate(int infocode);
}
