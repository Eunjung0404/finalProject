package data.mybatis.mapper;



import java.util.HashMap;
import java.util.List;


import com.test.finalproject.security.CustomUserDetail;
import com.test.finalproject.vo.AuthoritiesVo;
import com.test.finalproject.vo.MemberQnaVo;
import com.test.finalproject.vo.MemberTicketHistoryVo;
import com.test.finalproject.vo.MemberVo;
import com.test.finalproject.vo.MyReviewVo;

public interface MemberMapper {
	int addMember(MemberVo vo);
	int addAuth(AuthoritiesVo vo);
	CustomUserDetail getAuths(String mid);
	
//	아이디 중복검사
	int idCheck(String mid);
	
//	회원 정보 변경
	int doMyinfo(MemberVo vo);
	
//	이름과 전화번호로 아이디 찾기
	MemberVo findId(HashMap<String, Object> map);
//	이름과 이메일로 아이디 찾기
	MemberVo findId2(HashMap<String, Object> map);
	
//	비밀번호 찾기 이메일 인증(아이디, 이메일)
	MemberVo findPwd(HashMap<String, Object> map);
	
//	비밀번호 찾기 이메일 인증(아이디, 이메일)
	MemberVo findPwd2(HashMap<String, Object> map);
	
//	비밀번호 변경
	int changePwd(MemberVo vo);
	
// 아이디와 일치하는 회원의 정보 가져오기
	MemberVo getInfo(String mid);
	
//	회원탈퇴
	int withdrawal(String mid);
	
//	마이페이지에 작성한 문의 글 출력
	List<MemberQnaVo> selectQuestion(HashMap<String, Object> map);
	
//	문의 글 개수
	int count(HashMap<String, Object> map);
	
//	문의 내역 상세보기
	MemberQnaVo detatilQuestion(HashMap<Object, Object> map);
	
//	리뷰 글 개수
	int reviewCount(HashMap<String, Object> map);
	
	//내가 작성한 리뷰 보기
	List<MyReviewVo> myReview(HashMap<String, Object> map);
	
	// 예매 개수
	int ticketingCount(HashMap<String, Object> map);
	
	// 예매내역
	List<MemberTicketHistoryVo> ticketHistory(HashMap<String, Object> map);
	
	// 예매 취소
	int ticketingCancle(int reservationcode);
} 

