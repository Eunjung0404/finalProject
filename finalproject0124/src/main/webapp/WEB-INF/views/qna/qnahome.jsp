<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/qnahometest.jsp</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="web.css" />
<link rel="stylesheet" media="(max-width: 480px)" href="mobile.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
}

/* .content div {
	border: 1px solid black;
} */
.content {
	background-color: #f5f5f5;
	padding: 20px;
}

.content a {
	text-decoration: none;
	color: #4C4C4C;
}

.title {
	text-align: center;
	margin: 10px;
	margin-top: 30px;
}

.container {
	display: flex;
}

.fqa_top_area {
	margin-top: 70px;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.fqa_top_cont {
	width: 80%;
}

.card-header {
	border: 1px solid #D5D5D5;
	background-color: white;
	padding-top: 20px;
	padding-left: 30px;
	list-style-type: none;
	height: 70px;
	color: #4C4C4C;
}

#accordion {
	float: left;
	width: 80%;
}

.fqa_category_cont {
	float: left;
	margin-left: 50px;
	width: 35%;
	height: 358px;
	text-align: center;
	margin-top: 50px;
}

.qa_ct_list {
	float: left;
	height: 83%;
	margin-bottom: 10px;
}

.qa_ct_list a {
	padding: 5px;
	float: left;
	width: 50%;
	height: 50%;
	border: 1px solid #D5D5D5;
	text-align: center;
	padding-top: 45px;
	background-color: white;
}

.qa_ct_list a:hover {
	background-color: #F06161;
	color: white;
}

.qa_center {
	float: left;
	width: 100%;
	height: 50px;
	padding-top: 10px;
	border: 1px solid #D5D5D5;
	background-color: white;
}

.faq_notice_area {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.board_cont {
	width: 572px;
	margin-top: 50px;
}

p.mc_title {
	font-size: 20px;
	margin-left: 30px;
}

a.btn_more {
	float: right;
}

.board_list li {
	border: 1px solid #D5D5D5;
	color: white;
	list-style-type: none;
	background-color: white;
	color: #4C4C4C;
	height: 70px;
	margin-bottom: 10px;
	padding-top: 20px;
	padding-left: 10px;
}

.customer_area {
	display: flex;
	flex-direction: row;
	justify-content: center;
	margin-top: 30px;
	height: 130px;
	font-size: 20px;
	padding-top: 30px;
}

.customer_area ul {
	display: flex;
	flex-direction: row;
	justify-content: center;
	text-align: center;
	width: 700px;
}

.customer_guide_area li {
	float: left;
	margin-right: 50px;
	list-style-type: none;
}
</style>
</head>
<body>
	<div class="content ">
		<div class="customer_container_area">
			<div class="customer_cont lay_inner">
				<div class="title">
					<h1>
						<b>고객센터</b>
					</h1>
				</div>
				<div class="fqa_top_area">
					<div class="fqa_top_cont">
						<div class="container">
							<div id="accordion">
								<p style="font-size: 20px;">
									FAQ TOP 5<a href="#" class="btn_more"><span
										class="material-icons" style="float: right;">
											arrow_forward_ios </span></a>
								</p>
								<div class="card">
									<div class="card-header">
										<a class="card-link" data-toggle="collapse"
											href="#collapseOne"> <strong>Q.</strong> &nbsp;예매는 어떻게
											하나요?
										</a>
									</div>
									<div id="collapseOne" class="collapse" data-parent="#accordion">
										<div class="card-body">
											<strong>A.</strong> 예스24영화 홈페이지 혹은 모바일웹/APP 로그인 상태에서만 예매가
											가능합니다.<br>자세한 예매 방법은 아래 페이지에서 확인하실 수 있습니다.<br> <br>
											<br> <a href=#> 예매안내 바로가기 </a>
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header">
										<a class="collapsed card-link" data-toggle="collapse"
											href="#collapseTwo"> <strong>Q.</strong>&nbsp; 전화로는 예매를 할
											수 없나요?
										</a>
									</div>
									<div id="collapseTwo" class="collapse" data-parent="#accordion">
										<div class="card-body">
											<strong>A.</strong> 개인정보 보호를 위해 전화예매는 지원해드리고 있지 않습니다.<br>예스24영화
											홈페이지 혹은 예스24영화 모바일웹/APP을 통해 예매해주시기 바랍니다.
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header">
										<a class="collapsed card-link" data-toggle="collapse"
											href="#collapseThree"> <strong>Q.</strong>&nbsp; 관람등급은
											어떻게 되나요?
										</a>
									</div>
									<div id="collapseThree" class="collapse"
										data-parent="#accordion">
										<div class="card-body">
											<strong>A.</strong> YES24 영화는 영화 및 비디오진흥에 관한 법률 (이하 영비법)을
											준수합니다.<br>등급 기준<br> <br>* 전체 관람가 : 모든 연령의 관람객이
											관람 할 수 있는 영화 - 12세 관람가 : 만 12세 미만의 관람객은 관람 할 수 없는 영화 (보호자 동반
											시 12세 미만 관람가)<br>* 15세 관람가 : 만 15세 미만의 관람객은 관람 할 수 없는 영화
											(보호자 동반 시 15세 미만 관람가)<br>* 청소년 관람불가 : 만 18세 미만의 관람객은 관람
											할 수 없는 영화<br> <br>* 만 18세 이상이라도 고등학생 신분은 청소년 관람불가
											상영관에 입장 할 수 없습니다. (초, 중등교육법 제2조 규정)<br>* 보호자란? : 만 18세
											이상의 성인 보호자 (고등학교 재학생 불가)<br> <br>영비법 29조에 따르면 [만
											12세 이상관람가/ 만 15세 이상관람가]의 등급이라도 부모등 보호자를 동반하는 경우 어린이(유아) 동반이
											가능합니다.<br>반드시 보호자의 동반이 필요함을 양지하여 주시기 바랍니다.<br> <br>
											<b>단, 청소년관람불가 영화는 보호자 동반과 관계없이 만 18세미만이거나 연령 조건을 만족하여도
												초중고 재학중인 청소년 및 영유아 관람이 절대 불가합니다.</b>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header">
										<a class="collapsed card-link" data-toggle="collapse"
											href="#collapseFour"> <strong>Q.</strong>&nbsp; 예매권을 등록
											하려고 하는데 회원인증이 안 되었다고 나옵니다.
										</a>
									</div>
									<div id="collapseFour" class="collapse"
										data-parent="#accordion">
										<div class="card-body">
											<strong>A.</strong> 2012년 8월 18일부터 '온라인상 주민등록번호 신규수집 및 이용'이
											금지되었습니다.<br>따라서, 주민등록번호를 통한 실명인증을 하지 않으며, 영화예매 및 예매권,
											할인권 등록을 위해서는 휴대폰 혹은 아이핀(I-Pin)을 통해 인증을 해주셔야만 합니다. 회원가입 시 반드시
											휴대폰 인증 혹은 아이핀 인증 중 하나를 선택하셔서 본인인증을 해주십시오. <br>→ <b><a
												href=https://www.yes24.com/Member/FTMemAcc.aspx> 회원인증 </a></b><br>
											<br>비실명인증인 SMS인증이나 이메일 인증으로 가입을 하셨다면 회원 정보 관리 에서 '인증수단
											변경'을 하셔야만 합니다. <br>→ <b><a
												href=https://www.yes24.com/Member/FTMemUpt.aspx> 회원정보 관리
											</a></b>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header">
										<a class="collapsed card-link" data-toggle="collapse"
											href="#collapseFive"> <strong>Q.</strong> &nbsp;취소 후, 환불은
											어떻게 되나요?
										</a>
									</div>
									<div id="collapseFive" class="collapse"
										data-parent="#accordion">
										<div class="card-body">
											<strong>A.</strong> 영화 예매 후, 취소 가능시간 내에 인터넷에서 취소를 하면 예매 수수료
											포함 전액이 환불됩니다.<br> <br> <br> <br> <b>YES머니,
												YES상품권, 예매권, 할인권, 예치금, 가족계좌, OK캐시백</b> : 결제 취소시 자동 환불. 단 YES상품권,
											예매권F, 할인권의 경우 사용기간이 지난 시점이라면 환불 불가<br> <br> <br>
											<br> <b>신용카드</b> : 결제일과 취소일이 다를 경우 영업일 기준 3~5일 정도 소요<br>
											<br> <br> <br> <b>체크카드</b> : 결제일과 취소일이 다를 경우
											영업일 기준 3~5일 정도 소요<br> <br> <br> <br> <b>계좌이체</b>
											: 취소한 시점의 은행 영업일로 부터 1~2일내 고객님 계좌로 자동 환불.<br> <br>
											<br> <br> <b>휴대폰 결제</b> : 결제 당월 취소 시 취소 당일 환불 (익월
											취소 시 결제 익월 28일 이후 예치금으로 환불)<br>
										</div>
									</div>
								</div>
							</div>

							<div class="fqa_category_cont">
								<div class="qa_ct_list">
									<a href="#">영화예매<br>문의
									</a> <a href="#">결제/취소<br>문의
									</a> <a href="#">시사회/이벤트<br>문의
									</a> <a href="#">기타<br>문의
									</a>
								</div>
								<div class="qa_center">
									<a href="${cp }/qna/insert?" target="_blank"> 문의글쓰기</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="faq_notice_area">
					<div class="board_cont">
						<p class="mc_title">
							공지사항<a href="${cp }/note/list" class="btn_more"><span
								class="material-icons"> arrow_forward_ios </span></a>
						</p>
						<ul class="board_list" id="list">
							<c:forEach var="note" items="${list2 }">
								<li><a href="${cp }/note/detail?num=${note.notecode}">${note.title }</a></li>
							</c:forEach>
						</ul>
					</div>

					<div class="board_cont" style="float: right; margin-right: 30px;">
						<p class="mc_title">
							문의내역<a href="${cp }/qna/list" class="btn_more"><span
								class="material-icons"> arrow_forward_ios </span></a>
						</p>
						<ul class="board_list" id="list">
							<c:forEach var="qna" items="${list }">
								<li>${qna.title }</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="customer_area">
					<ul class="customer_guide_area">
						<li><a href="${cp }/qna/timehelp" class="noti_ic noti_ic05">
								취소마감안내<br> <span class="material-icons"> access_time
							</span>
						</a></li>
						<li><a href="${cp }/qna/tickethelp" class="noti_ic noti_ic03">
								예매권안내<br> <span class="material-icons"> local_atm </span>
						</a></li>
						<li><a href="${cp }/qna/salehelp" class="noti_ic noti_ic04">
								예매안내<br> <span class="material-icons">
									event_available </span>
						</a></li>
						<li><a href="${cp }/qna/theaterhelp"
							class="noti_ic noti_ic07"> 극장안내<br> <span
								class="material-icons"> store_mall_directory </span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>