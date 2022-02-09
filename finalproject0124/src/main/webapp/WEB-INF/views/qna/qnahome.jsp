<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/qnahome.jsp</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style type="text/css">
.material-icons {
	font-family: 'Material Icons';
	font-weight: normal;
	font-style: normal;
	font-size: 24px; /* Preferred icon size */
	display: inline-block;
	line-height: 1;
	text-transform: none;
	letter-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	direction: ltr;
	/* Support for all WebKit browsers. */
	-webkit-font-smoothing: antialiased;
	/* Support for Safari and Chrome. */
	text-rendering: optimizeLegibility;
	/* Support for Firefox. */
	-moz-osx-font-smoothing: grayscale;
	/* Support for IE. */
	font-feature-settings: 'liga';
}

#title {
	position: absolute;
	right: 46%;
	top: 20%;
}

#maindiv {
	
}

#div1 {
	
}

#faqicon {
	position: absolute;
	left: 67%;
}

#faqicon span {
	color: black;
}

#div1-1 {
	border: 1px solid #D5D5D5;
	width: 65%;
	background-color: white;
}

.qdiv {
	border: 1px solid #D5D5D5;
	width: 100%;
	height: 70px;
	padding-top: 25px;
	padding-left: 30px;
}

.qdiv a {
	text-decoration: none;
	color: #747474;
}

.material-icons::after {
	content: "";
	//
	expand_more
	//expand_less
}

.adiv {
	display: none;
}

#div2 {
	position: absolute;
	left: 72%;
	bottom: 10%;
	width: 400px;
	height: 350px;
}

#div2 a {
	text-decoration: none;
	color: #4C4C4C;
}

#rightdiv :hover {
	background-color: #F06161;
	color: white;
}

#div2-1 {
	border: 1px solid #D5D5D5;
	position: absolute;
	right: 201px;
	width: 200px;
	height: 150px;
	padding: 55px;
	text-align: center;
}

#div2-2 {
	border: 1px solid #D5D5D5;
	position: absolute;
	left: 199px;
	width: 201px;
	height: 150px;
	padding: 50px;
	text-align: center;
}

#div2-3 {
	border: 1px solid #D5D5D5;
	position: relative;
	top: 150px;
	width: 199px;
	height: 150px;
	padding-left: 10px;
	padding-top: 50px;
	text-align: center;
}

#div2-4 {
	border: 1px solid #D5D5D5;
	position: relative;
	left: 199px;
	width: 201px;
	height: 150px;
	padding: 50px;
	text-align: center;
	height: 150px;
}

#div2-5 {
	border: 1px solid #D5D5D5;
	background-color: white;
	bottom: 10px;
	width: 400px;
	height: 50px;
	padding-top: 10px;
	text-align: center;
}

#div3 {
	margin-top: 70px;
}

#div3 ul {
	border: 1px solid #D5D5D5;
	background-color: white;
	margin-top: 30px;
	padding-top: 20px;
	list-style-type: none;
	width: 1440px;
	height: 70px;
	color: #4C4C4C;
}

#div3 span {
	position: absolute;
	left: 94%;
	color: black;
}

#div4 {
	padding-top: 40px;
}

#div4-1 {
	width: 1300px;
	height: 150px;
	padding-top: 25px;
	padding-right: 20px;
	font-size: 20px;
	margin-left: 50px;
}

#div4-1 a {
	text-decoration: none;
	color: #4C4C4C;
}

#div4-1 span {
	margin-top: 10px;
	font-size: 50px;
}

#d4a1 {
	margin-left: 40px;
	width: 220px;
	height: 100px;
	text-align: center;
	padding: 25px;
}

#d4a2 {
	position: relative;
	left: 350px;
	bottom: 100px;
	width: 220px;
	height: 100px;
	text-align: center;
	padding: 25px;
}

#d4a3 {
	position: relative;
	left: 670px;
	bottom: 200px;
	width: 220px;
	height: 100px;
	text-align: center;
	padding: 25px;
}

#d4a4 {
	position: relative;
	left: 980px;
	bottom: 300px;
	width: 220px;
	height: 100px;
	text-align: center;
	padding: 25px;
}
</style>
</head>
<body>
	<div style="background-color: #EAEAEA;">
		<div id="title">
			<h1>
				<b>고객센터</b>
			</h1>
		</div>
		<div style="margin-top: 200px; margin-left: 180px;">
			<div id="maindiv">
				<div id="div1">
					<p style="font-size: 25px;">
						FAQ TOP 5<a href="#" id="faqicon"><span class="material-icons">
								arrow_forward_ios </span></a>
					</p>
					<div id="div1-1">
						<div class="qdiv">
							<a href="#" onclick="Showqna"><strong>Q.</strong> 예매는 어떻게
								하나요? <span class="material-icons"></span></a>
						</div>
						<div class="adiv">
							<div id="a1">
								<strong>A.</strong> ~영화 홈페이지 혹은 모바일웹 로그인 상태에서만 예매가 가능합니다.<br>
								자세한 예매 방법은 아래 페이지에서 확인하실 수 있습니다. <br> <br> <br> <a
									href="#"> 예매안내 바로가기 </a>
							</div>
						</div>
						<div class="qdiv">
							<a href="#"><strong>Q.</strong> 전화로는 예매를 할 수 없나요? <span
								class="material-icons"></span></a>
						</div>
						<div class="adiv">
							<div id="a2">
								<strong>A.</strong> 개인정보 보호를 위해 전화예매는 지원해드리고 있지 않습니다. <br>
								~영화 홈페이지 혹은 ~영화 모바일웹을 통해 예매해주시기 바랍니다.
							</div>
						</div>
						<div class="qdiv">
							<a href="#"><strong>Q.</strong> 관람등급은 어떻게 되나요? <span
								class="material-icons"></span></a>
						</div>
						<div class="adiv">
							<div id="a3">
								<strong>A.</strong> ~ 영화는 영화 및 비디오진흥에 관한 법률 (이하 영비법)을 준수합니다. <br>
								등급 기준 <br> * 전체 관람가 : 모든 연령의 관람객이 관람 할 수 있는 영화 - 12세 관람가 :
								만12세 미만의 관람객은 관람 할 수 없는 영화 (보호자 동반 시 12세 미만 관람가) <br> * 15세
								관람가 : 만 15세 미만의 관람객은 관람 할 수 없는 영화 (보호자 동반 시 15세 미만 관람가) <br>
								* 청소년 관람불가 : 만 18세 미만의 관람객은 관람 할 수 없는 영화 <br>* 만 18세 이상이라도
								고등학생 신분은 청소년 관람불가 상영관에 입장 할 수 없습니다. (초, 중등교육법 제2조 규정) <br>
								* 보호자란? : 만 18세 이상의 성인 보호자 (고등학교 재학생 불가) <br> 영비법 29조에 따르면
								[만 12세 이상관람가/ 만 15세 이상관람가]의 등급이라도 부모등 보호자를 동반하는 경우 어린이(유아) 동반이
								가능합니다. <br> 반드시 보호자의 동반이 필요함을 양지하여 주시기 바랍니다.<br> <strong>
									단, 청소년관람불가 영화는 보호자 동반과 관계없이 만 18세미만이거나 연령 조건을 만족하여도 초중고 재학중인
									청소년 및 영유아 관람이 절대 불가합니다. </strong>
							</div>
						</div>
						<div class="qdiv">
							<a href="#"><strong>Q.</strong> 예매권을 등록 하려고 하는데 회원인증이 안 되었다고
								나옵니다.<span class="material-icons"></span></a>
						</div>
						<div class="adiv">
							<div id="a4">
								<strong>A.</strong> 2012년 8월 18일부터 '온라인상 주민등록번호 신규수집 및 이용'이
								금지되었습니다.<br> 따라서, 주민등록번호를 통한 실명인증을 하지 않으며, 영화예매 및 예매권, 할인권
								등록을 위해서는 휴대폰 혹은 아이핀(I-Pin)을 통해 인증을 해주셔야만 합니다. <br> 회원가입 시
								반드시 휴대폰 인증 혹은 아이핀 인증 중 하나를 선택하셔서 본인인증을 해주십시오. <br> → <strong>
									회원인증</strong> <br> 비실명인증인 SMS인증이나 이메일 인증으로 가입을 하셨다면 회원 정보 관리 에서
								'인증수단 변경'을 하셔야만 합니다. <br> → <strong> 회원정보 관리</strong>
							</div>
						</div>
						<div class="qdiv">
							<a href="#"><strong>Q.</strong> 취소 후, 환불은 어떻게 되나요? <span
								class="material-icons"></span></a>
						</div>
						<div class="adiv">
							<div id="a5">
								<strong>A.</strong> 영화 예매 후, 취소 가능시간 내에 인터넷에서 취소를 하면 예매 수수료 포함
								전액이 환불됩니다. <br> <strong>예매권</strong> : 결제 취소시 자동 환불. 단 예매권의
								경우 사용기간이 지난 시점이라면 환불 불가 <br> <strong>신용카드</strong> : 결제일과
								취소일이 다를 경우 영업일 기준 3~5일 정도 소요 <br> <strong>체크카드</strong> :
								결제일과 취소일이 다를 경우 영업일 기준 3~5일 정도 소요 <br> <strong>계좌이체</strong>
								: 취소한 시점의 은행 영업일로 부터 1~2일내 고객님 계좌로 자동 환불. <br> <strong>휴대폰
									결제</strong> : 결제 당월 취소 시 취소 당일 환불 (익월 취소 시 결제 익월 28일 이후 예치금으로 환불)
							</div>
						</div>
					</div>
				</div>
				<div id="div2">
					<div id="rightdiv"
						style="width: 400px; height: 300px; background-color: white;">
						<div id="div2-1">
							<a href="#">영화예매<br>문의
							</a>
						</div>
						<div id="div2-2">
							<a href="#">결제/취소<br>문의
							</a>
						</div>
						<div id="div2-3">
							<a href="#">시사회/이벤트<br>문의
							</a>
						</div>
						<div id="div2-4">
							<a href="#">기타<br>문의
							</a>
						</div>
					</div>
					<div id="div2-5">
						<a href="${cp }/qna/insert?">문의글쓰기</a>
					</div>
				</div>
			</div>
			<div id="div3">
				<h3>
					공지사항<a href="#"><span class="material-icons">
							arrow_forward_ios </span></a>
				</h3>
				<ul>
					<li>[공지]</li>
				</ul>
				<ul>
					<li>[공지]</li>
				</ul>
				<ul>
					<li>[공지]</li>
				</ul>
				<ul>
					<li>[공지]</li>
				</ul>
				<ul>
					<li>[공지]</li>
				</ul>
			</div>
			<div id="div4">
				<div id="div4-1">
					<div id="d4a1">
						<a href="${cp }/qna/timehelp">취소마감안내 <br> <span
							class="material-icons"> access_time </span>
						</a>
					</div>
					<div id="d4a2">
						<a href="${cp }/qna/tickethelp">예매권안내 <br> <span
							class="material-icons"> local_atm </span></a>
					</div>
					<div id="d4a3">
						<a href="${cp }/qna/salehelp">예매안내 <br> <span
							class="material-icons"> event_available </span></a>
					</div>
					<div id="d4a4">
						<a href="${cp }/qna/theaterhelp">극장안내 <br> <span
							class="material-icons"> store_mall_directory </span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function Showqna() {
		var spanicon = document.getElementsByClassName("material-icons");

	}
</script>
</html>