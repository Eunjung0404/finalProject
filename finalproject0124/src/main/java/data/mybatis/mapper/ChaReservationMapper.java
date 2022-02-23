package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.test.finalproject.vo.PaymentVo;
import com.test.finalproject.vo.ReservationVo;
import com.test.finalproject.vo.TiketScreenTimeVo;

public interface ChaReservationMapper {

	 int count(String mid);
	 List<ReservationVo> ReservationSelect(HashMap<String, Object> map);
	 PaymentVo getpayment(int reservationcode);
	 List<String> getseatname(int reservationcode);
	 
	 /////
	 int CancelReservation(int reservationcode);
	 int Cancelpayment(int reservationcode);
	 List<String> getinfocode(int reservationcode);
	 
	 int CancelSeat(int infocode);
	 int getmoviecode(String moviename);
	 int MinusCount(int moviecode);
	 
	 //
	 TiketScreenTimeVo getscreendate(int timecode);
}
