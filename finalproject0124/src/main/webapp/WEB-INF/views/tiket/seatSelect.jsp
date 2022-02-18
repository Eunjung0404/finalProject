<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
.nonePadding {
	padding: 0px;
}

.centerPosition {
	display: flex;
	align-items: center;
	justify-content: center;
}

.centerTopPosition {
	display: flex;
	align-items: center;
	flex-direction: column;
}

#ppbtn {
	background-color: none;
	border: 1px solid gray;
}

#ppbtn:hover {
	background-color: olive;
}

.people {
	background-color: olive;
	border: none;
}

.teenager {
	background-color: olive;
	border: none;
}

#seat-area {
	border: 1px solid gray;
}

.seat-list {
	width: 18px;
	height: 15px;
	background-color: gray;
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 10px;
	border-radius: 5px 5px 0 0;
	color: #fff;
	cursor: pointer;
}

.blank {
	width: 18px;
	height: 15px;
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 5px 5px 0 0;
}

.seat-list:hover {
	background-color: red;
}

.seat-position {
	position: absolute;
	cursor: pointer;
}

.select-seat {
	background-color: red;
}

.cant-select {
	background: url(/finalproject/resources/images/icon/none.png) no-repeat
		-3px -4px;
	background-color: #cbcbcb;
	width: 18px;
	height: 15px;
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 5px 5px 0 0;
	color: #cbcbcb;
	cursor: pointer;
}

.book {
	background: url(/finalproject/resources/images/icon/none.png) no-repeat
		-3px -4px;
	background-color: #cbcbcb;
	width: 18px;
	height: 15px;
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 5px 5px 0 0;
	color: #cbcbcb;
	cursor: pointer;
}

.info {
	display: flex;
	justify-content: space-between;
}

.seatBlind {
	background-color: black;
	width: 66.6%;
	position: absolute;
	z-index: 1;
	opacity: 80%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	justify-content: center;
}

.nonedisplay {
	display: none;
}

.nextpage {
	width: 100px;
	height: 100px;
	position: fixed;
	top: 50%;
	left: 92%;
	opacity: 50%;
	border: none;
	background: none;
}

.click {
	background-color: #ED4C00;
	opacity: 100%;
}

.nonedisplay {
	display: none;
}

.rating {
	padding-top: 5px;
	margin: 5px;
	display: inline-block;
	width: 25px;
	height: 22px;
	line-height: 1;
	text-align: center;
	font-size: 13px;
	display: inline-block;
}

#rating15 {
	color: orange;
	border: 1px solid orange;
	padding-top: 5px;
}

#rating12 {
	color: green;
	border: 1px solid green;
}

#ratingALL {
	color: aqua;
	border: 1px solid aqua;
}

.paymentbtn {
	z-index: 1;
	color: white;
	position: absolute;
	margin-left: 900px;
	margin-top: 100px;
	padding: 50px;
	background-color: #ED4C00;
	border: none;
}

.price {
	text-align: right;
	padding: 100px;
}

.tab_content {
	position: relative;
	padding: 50px 50px;
	background: #fff;
	font-size: 13px;
	border-left: 1px solid #e5e5e5;
	border-right: 1px solid #e5e5e5;
	border-bottom: 1px solid #e5e5e5;
}

.rp_tit {
	padding: 30px 0 10px;
	line-height: 1;
	color: #2b2b2b;
	margin-bottom: 5px;
}

.col_point {
	color: #ec6159 !important;
}

.credit_card_list {
	margin: -10px 0 40px;
	font-size: 15px;
}

.credit_card_list>li {
	display: inline-block;
	width: calc(100%/ 5);
	vertical-align: top;
}

.credit_card_list>li a {
	display: block;
	font-size: 15px;
	line-height: 30px;
	color: #2b2b2b;
	text-decoration: none;
}

.tab_menu>li.active button {
	background: #ec6159;
	color: #fff;
}

.tab_menu>li button {
	width: 100%;
	height: 62px;
	font-size: 15px;
	cursor: pointer;
}

.tab_menu>li:first-child {
	border-left: 1px solid #e5e5e5;
}

.tab_menu>li {
	display: table-cell;
	border: 1px solid #e5e5e5;
	border-left: none;
	background: #fff;
	vertical-align: top;
}

.tab_menu {
	display: table;
	table-layout: fixed;
	width: 100%;
}

.tab_menu>li button {
	width: 100%;
	height: 62px;
	font-size: 15px;
	cursor: pointer;
	border: none;
}
</style>
<!-- 인원수 및 기타... -->
<div class="row centerPosition" id="infodiv">
	<div class="col-8 nonePadding"
		style="margin-top: 100px; font-size: 18px; font-weight: bold;">인원/좌석
		선택</div>
	<div class="col-8 nonePadding info" style="border: 1px solid gray;">

		<div style="padding-left: 50px; padding-top: 30px;">

			<div>
				<span style="font-weight: bold;">성&nbsp&nbsp인<span></span><span
					id="people" style="padding-left: 50px;"></span><input type="hidden"
					value=0 id="people-count">
			</div>
			<div style="padding-top: 5px;">
				<span style="font-weight: bold;">청소년&nbsp</span><span id="teenager"
					style="padding-left: 39.5px;"></span><input type="hidden" value=0
					id="teenager-count">
			</div>
		</div>
		<div id="theater-info"
			style="padding-top: 30px; padding-bottom: 30px;">
			<span style="font-weight: bold;">상영관/시간 정보</span><br>
			<div style="color: gray">
				<span>${vo.theatername }/${vo.screenname }</span><br> <span>${screendate }/</span>
				<span>${vo.screentime }</span><input type="hidden"
					value="${vo.screencode }" id="screencode"> <input
					type="hidden" value="${vo.timecode }" id="timecode">
			</div>
		</div>
		<div id="seatname"
			style="padding-right: 250px; padding-top: 30px; width: 400px;">
			<span style="font-weight: bold;">선택한 좌석번호</span><br> <span
				style="color: gray;" id="seat-info"></span>
		</div>
	</div>
</div>

<!-- 좌석 -->
<div class="row centerPosition" id="seatdiv">
	<div class="col-8 nonePadding">

		<div id="seat-area" class="centerTopPosition">
			<div id="seatBlind" class="seatBlind">
				<img src="/finalproject/resources/images/icon/arrowUP.png" alt="화살표"><br>
				<span style="color: white;">인원을 먼저 선택해주세요</span>
			</div>
			<img src="/finalproject/resources/images/icon/screen.jpg" alt="스크린"
				style="width: 70%;">
			<div id="seat" style="width: 100%; padding: 50px;"></div>
		</div>
	</div>
</div>

<!-- 결제방법 -->


<div class="row centerPosition nonedisplay" id="payway">
	<div class="col-8 nonePadding">
		<ul class="tab_menu" id="ulPayTab">
			<li id="PayCARD" class=""><button type="button">신용카드</button></li>
			<li id="PayMOBILE" class="active"><button type="button">휴대폰</button></li>
			<li id="PayBANKTOWN" class=""><button type="button">실시간
					계좌이체</button></li>
			<li id="PayKAKAO_BANK" class=""><button type="button">카카오
					뱅크</button></li>
			<li id="NaverPay" class=""><button type="button">
					<span class="npay">네이버페이</span>
				</button></li>
		</ul>
	</div>
	<div class="col-8 nonePadding" style="border: 1px solid gray">
		<div class="tab_content ">
			<ul class="credit_card_list">
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="34" class="active">KEB하나카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="41">NH카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="06">국민카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="03">롯데카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="11">비씨카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="12">삼성카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="51">수협카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="43">시티카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="14">신한카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="14_1">신한아침愛카드(조조무료)</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="14_2">신한패밀리LOVE카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="44">우리카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="04">현대카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="32">광주은행카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="33">전북은행카드</a></li>
				<li onclick="_pay.SelPayCreditCardList(this)"><a
					href="javascript:;" id="52">제주은행카드</a></li>
			</ul>

			<p class="rp_txt">YES24 영화예매의 신용카드 결제서비스는 (주)케이지이니시스에서 제공합니다.</p>

		</div>
		<div class="tab_content">
			<p class="rp_txt">
				휴대폰 결제는 <span class="col_point">이달 상영하는 영화만 결제</span>할 수 있습니다. 다음달
				관람할 영화를 예매하실 경우 다른 결제 수단을 이용해 주세요.
			</p>
			<p class="rp_tit">휴대폰 결제를 사용할수 없는 경우 안내</p>
			<ul class="li_bar">
				<li>미성년자 명의의 휴대폰 (단, KT와 LGU+는 가입자가 성인인 경우 가능)</li>
				<li>사업자 폰, 미납상태인 폰, 정액요금제 가입폰, 외국인 폰</li>
				<li>LGU+의 경우 번호이동 및 신규 가입한 경우 가입일로부터 60일 간 월 한도 5만원</li>
			</ul>
			<p class="rp_tit">휴대폰 결제시 현금영수증 발급 안내</p>
			<ul class="li_bar">
				<li>휴대폰 요금을 현금으로 납부하는 경우에만 해당 이동통신사에서 발급 가능</li>
			</ul>
		</div>
		<div class="tab_content">
			<p class="rp_txt">계좌이체 서비스는 "(주)케이지이니시스"에서 제공합니다.</p>
			<p class="rp_txt">국민은행을 비롯하여 20여개 은행의 실시간 계좌이체가 가능합니다.</p>
			<p class="rp_txt">계좌이체 이용은 은행별 이용시간 내에만 가능합니다.</p>
			<p class="rp_txt">신용카드가 없는 학생이나 미성년자도 이용 가능합니다.</p>
			<p class="rp_txt">PC뱅킹, 인터넷뱅킹 이용자는 지금 바로 이용하실 수 있습니다.</p>
			<p class="rp_tit">환불안내</p>
			<p class="rp_txt">예매일로부터~일요일 내에 취소 : 결제금액을 취소한 시점의 은행의 영업일로 부터
				이틀내로 고객님 계좌로 자동 환불해드립니다.</p>
			<p class="rp_txt">그 이후(예매일로부터 다음주~) 취소 : 고객님의 계좌를 확인한 후 환불해드립니다.</p>
			<p class="rp_txt">예) 금요일 예매 후 토요일에 취소했을 경우, 다음주 화요일 자동환불. 금요일 예매
				후 다음 월요일에 취소했을 경우, 환불할 계좌 확인 후 환불</p>
		</div>
		<div class="tab_content">
			<!--N페이 추가_20200720 -->
			<p class="rp_txt">주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수
				있습니다.</p>
			<p class="rp_txt">네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여
				네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.</p>
			<p class="rp_txt">결제 가능한 신용카드 : 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협,
				씨티, 카카오뱅크</p>
			<p class="rp_txt">결제 가능한 은행 : NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남,
				수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, 카카오뱅크,
				삼성증권, KDB산업은행, 씨티은행, SBI은행, 유안타증권</p>
			<p class="rp_txt">네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자, 청구할인 혜택을
				받을 수 있습니다.</p>
			<br> <br>
			<p class="rp_txt">※ 네이버페이는 YES24 무이자 할부 및 제휴카드 혜택 내용과 관계가 없으며,
				별도의 네이버페이 기준에 따라 적용됩니다.</p>
			<p class="rp_txt">※ 영화 예매시 별도의 네이버페이 포인트는 적립되지 않습니다.</p>
		</div>
	</div>
</div>
<!-- 결제정보 -->
<div class="row centerPosition">
	<div class="col-8 nonePadding"
		style="border: 1px solid gray; height: 300px; overflow: hidden; position: relative;">
		<div id="movieposterinfo"
			style="height: 100%; width: 100%; background-size: 5000px; position: absolute; filter: brightness(40%) blur(20px); transform: scale(1.1);background-image:url(${pageContext.request.contextPath}/resources/images/movieupload/${vo.movieimgname});">
		</div>
		<div>

			<div>
				<img
					src="/finalproject/resources/images/movieupload/${vo.movieimgname}"
					alt="${vo.movieimgname}"
					style="width: 150px; position: absolute; margin-left: 50px; margin-top: 35px;"
					id="posterImg">
			</div>
			<div
				style="z-index: 1; color: white; position: absolute; margin-left: 230px; margin-top: 100px;">
				<span id="movie-name" style="font-size: 22px; font-weight: bold;">${vo.movienamehtml}</span><br>
				<br> <span id="select-area">${vo.theatername }/${vo.screenname }</span><span
					id="select-screen"></span><br> <span id="select-time">${screendate }/</span><span
					id="select-screentime">/${vo.screentime}</span><br> <span
					id="seat-info2"></span>
			</div>
			<div
				style="z-index: 1; color: white; position: absolute; margin-left: 600px; margin-top: 100px;">

				<span>성&nbsp&nbsp&nbsp인 </span><span id="people-span">0</span><span
					id="pprice" class="price">0</span><br> <br> <span>청소년
				</span><span id="teenager-span">0</span><span id="tprice" class="price">0</span>
				<br>
				<hr style="color: white; width: 200px; border: 2px; opacity: 100%;">
				<span>총가격</span><span id="totalprice" class="price">0</span>
			</div>

			<!-- 결제버튼 다음버튼 선택시 활성화-->
			<form:form method="post"
				action="${pageContext.request.contextPath}/member/payment"
				id="nextform" class="nonedisplay">
				<!-- 유저아이디  -->
				<sec:authorize access="isAuthenticated()">
					<input type="hidden" name="username"
						value="<sec:authentication property="principal.username" />">
				</sec:authorize>
				<!-- timecode -->
				<input type="hidden" value="${vo.timecode}" name="timecode">
				<!-- 인원수 -->
				<input type="hidden" value="" name="count" id="count">
				<!-- 영화이름 -->
				<input type="hidden" value='${vo.movienamehtml}'
					name="movienamehtml">
				<input type="hidden" value='${vo.movieimgname}' name="movieimgname">
				<input type="hidden" value='${vo.moviename}' name="moviename">
				<!-- theatername -->
				<input type="hidden" value="${vo.theatername}" name="theatername">
				<!-- screenname -->
				<input type="hidden" value="${vo.screenname}" name="screenname">
				<!-- totalprice -->
				<input type="hidden" value="" name="totalprice" id="total-price">
				<!-- 결제 방식 -->
				<input type="hidden" value="test" name="paymenttype"
					id="payment-type">
				<!-- 좌석정보 -->
				<button class="paymentbtn" onclick="nextsubmit()">결제</button>
			</form:form>


		</div>

	</div>

</div>

<button class="nextpage" id="nextpage" disabled="disabled"
	onclick="nextPage()">
	<img src="/finalproject/resources/images/icon/forword.png" alt="다음페이지">
</button>

<script type="text/javascript">
	let peoplecount = 0;
	let teencount = 0;
	let peopleprice = 0;
	let teenprice = 0;
	let count = 0;
	let price = 0;
	window.onload = function() {
		let timecode = document.getElementById("timecode").value;
		let screencode = document.getElementById("screencode").value;
		createPPbtn("people", "teenager", peoplecount);
		createPPbtn("teenager", "people", teencount);
		createSeat(screencode, timecode);
		//setEvent();
	}
	function nextsubmit() {
		document.getElementById("nextform").submit();
	}
	function nextPage() {
		let payway = document.getElementById("payway");
		let seatdiv = document.getElementById("seatdiv");
		let infodiv = document.getElementById("infodiv");
		let nextform = document.getElementById("nextform");
		if (payway.classList.contains('nonedisplay')) {
			nextform.classList.remove("nonedisplay");
			payway.classList.remove("nonedisplay");
			seatdiv.className += " nonedisplay";
			infodiv.className += " nonedisplay"
		}
	}
	function totalcount() {
		count = peopelcount + teencount;
		console.log("카운트 더한다~.");
	}
	let selected = false;
	//인원수선택 버튼 생성
	function createPPbtn(divname, otherdivname, _count) {
		let div = document.getElementById(divname);
		for (var i = 0; i < 7; i++) {
			let btn = document.createElement("button");
			btn.value = i;
			btn.innerText = i;
			btn.id = "ppbtn";
			if (i == 0) {
				btn.className = divname;
			}
			//클릭함수 추가..
			btn.onclick = function(event, _count) {
				let seatBlind = document.getElementById("seatBlind");

				let seatArea = document.getElementById("seat");
				let divs = seatArea.getElementsByTagName("div");
				let nowdiv = document.getElementById(divname);
				let nowdivs = nowdiv.getElementsByTagName("button")
				let otherdiv = document.getElementById(otherdivname);
				let otherdivs = otherdiv.getElementsByTagName("button");
				if (count > 6) {
					count = 0;
				}

				for (var s = 0; s < otherdivs.length; s++) {

					//otherdivs[s].className = "";
					otherdivs[s].disabled = false;

				}
				//선택된 좌석이 있는경우 초기화여부 묻기
				if (selected) {
					let result = confirm("선택된 좌석이 있습니다 초기화하시겠습니까?");
					if (result) {

						let nextpage = document.getElementById("nextpage");
						nextpage.disabled = true;
						nextpage.classList.remove("click");
						let seatinfo = document.getElementById("seat-info");
						seatinfo.innerHTML = "";
						let seatinfo2 = document.getElementById("seat-info2");
						seatinfo2.innerHTML = "";
						for (var z = 0; z < divs.length; z++) {
							//선택된 좌석인경우 css초기화
							if (divs[z].classList.contains('select-seat')) {

								divs[z].classList.remove('select-seat');

							}
							//공백이 아닌경우 css초기화
							else if (!divs[z].classList.contains('blank')
									&& !divs[z].classList.contains('book')) {
								divs[z].classList.remove('cant-select');
								divs[z].className = 'seat-list';
								divs[z].innerHTML = divs[z].id.substr(1, 2);
							}
						}
						//인원수버튼 활성화
						for (var s = 0; s < nowdivs.length; s++) {

							nowdivs[s].className = "";
							nowdivs[s].disabled = false;

						}
						nowdivs[0].className = divname;
						//그 외 인원수버튼 활성화
						for (var s = 0; s < otherdivs.length; s++) {

							otherdivs[s].className = "";
							otherdivs[s].disabled = false;

						}
						otherdivs[0].className = otherdivname;
						selected = false;
						peopleprice = 0;
						teenprice = 0;

						price = 0;
						document.getElementById("pprice").innerText = "0";
						document.getElementById("tprice").innerText = "0";
						count = 0;

					} else {
						return;
					}
				}

				let clickbtn = document.getElementsByClassName(divname);
				for (var j = 0; j < clickbtn.length; j++) {
					clickbtn[j].disabled = false;
					clickbtn[j].className = '';

				}
				_count = parseInt(event.target.innerText);
				//console.log(otherdiv);
				for (var s = 0; s < otherdivs.length; s++) {

					if (_count + parseInt(otherdivs[s].innerText) > 6) {
						otherdivs[s].disabled = true;

						//console.log("들어왔다.");
					}

				}
				//가격정보 추가
				if (divname == 'people') {
					//price += 12000 * _count;
					let pprice = document.getElementById("pprice");
					peopleprice = 12000 * _count;
					console.log("pprice" + peopleprice);
					if (String(peopleprice).length < 5) {
						pprice.innerText = String(peopleprice).substr(0, 1)
								+ "," + String(peopleprice).substr(1);
					} else {
						pprice.innerText = String(peopleprice).substr(0, 2)
								+ "," + String(peopleprice).substr(2);
					}

					console.log(price);
				} else if (divname == 'teenager') {
					//price += 10000 * _count;
					let tprice = document.getElementById("tprice");
					teenprice = 10000 * _count;
					if (String(teenprice).length < 5) {
						tprice.innerText = String(teenprice).substr(0, 1) + ","
								+ String(teenprice).substr(1);
					} else {
						tprice.innerText = String(teenprice).substr(0, 2) + ","
								+ String(teenprice).substr(2);
					}

					console.log(price);

				}
				//카운트
				let countdiv = document.getElementById(divname + "-count");
				countdiv.value = _count;
				let countspan = document.getElementById(divname + "-span");
				countspan.innerText = _count;
				//count += _count;
				event.target.className = divname;
				let othercountdiv = document.getElementById(otherdivname
						+ "-count");
				count = parseInt(countdiv.value)
						+ parseInt(othercountdiv.value);
				if (count > 0) {
					seatBlind.className += " nonedisplay";
				} else {
					price = 0;
					seatBlind.classList.remove("nonedisplay");
					console.log("블라인드");
				}
				price = peopleprice + teenprice;
				let totalprice = document.getElementById("totalprice");
				if (String(price).length < 5) {
					totalprice.innerText = String(price).substr(0, 1) + ","
							+ String(price).substr(1);
				} else {
					totalprice.innerText = String(price).substr(0, 2) + ","
							+ String(price).substr(2);
				}
				console.log(divname + "카운트 " + _count);
				console.log("총카운트" + count);
				//파라미터 설정
				let countspans = document.getElementById("count");
				countspans.value = count;
				let totalpricespan = document.getElementById("total-price");
				totalpricespan.value = price;
				//클릭버튼 중복클릭방지
				event.target.disabled = true;
			}
			div.appendChild(btn);

		}

	}

	//좌석정보바탕으로 생성하기
	function createSeat(screencode, timecode) {
		let seatcount = 0;
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				let row = json.row;
				let col = json.col;
				let movetop = 20;
				let seatArea = document.getElementById("seat");
				for (var i = 0; i < row; i++) {

					let moveleft = 28;

					let span = document.createElement("span");
					span.innerText = json.list[seatcount].CODE.substr(0, 1);
					span.className = 'seat-position';
					//span.style.top = movetop;
					span.style.left = "670px";
					seatArea.appendChild(span);

					for (var j = 0; j < col; j++) {

						let div = document.createElement("div");

						//이쪽은 열띄어쓰기
						if (json.list[seatcount].BLANK != 0) {

							let hiddeninput = document.createElement("input");
							hiddeninput.setAttribute('type', 'hidden');
							hiddeninput.value = json.list[seatcount].INFOCODE;
							div.className = "seat-list";
							div.id = json.list[seatcount].CODE;
							if (j + 1 < 10) {
								div.innerText = div.id.substr(1, 2);

							} else {
								div.innerText = div.id.substr(1, 2);

							}

							//예약상태일때
							if (json.list[seatcount].BOOKINGSTATE == 1) {
								div.className = 'book';
								div.innerText = "";

							}

							div.appendChild(hiddeninput);
						} else {
							div.className = "blank";
						}

						seatcount++;
						div.style.left = 670 + moveleft + "px";
						seatArea.appendChild(div);
						moveleft += 28;

					}
					seatArea.innerHTML += "<br>";
					movetop += 20;
					setEvent();
				}
				let seatBlind = document.getElementById("seatBlind");
				seatBlind.style.height = document.getElementById("seat-area").clientHeight
						+ "px";
				//console.log(seatArea.clientHeight);
			}

		}
		xhr.open('get', '/finalproject/seat-list?screencode=' + screencode
				+ '&timecode=' + timecode, true);
		xhr.send();

	}
	//좌석div에 이벤트 추가
	function setEvent() {
		let seat = document.getElementsByClassName("seat-list");

		for (var i = 0; i < seat.length; i++) {

			seat[i].addEventListener('click', function(event) {
				if (count > 0) {
					//파라미터용 정보 넘기기
					let nextform = document.getElementById("nextform");
					let hiddeninput = document.createElement("input");
					hiddeninput.setAttribute('type', 'hidden');
					hiddeninput.setAttribute('name', 'seatcode');
					hiddeninput.value = event.target.lastChild.value;
					let hiddeninput2 = document.createElement("input");
					hiddeninput2.setAttribute('type', 'hidden');
					hiddeninput2.setAttribute('name', 'seatname');
					hiddeninput2.value = event.target.id;
					nextform.appendChild(hiddeninput);
					nextform.appendChild(hiddeninput2);
					//css변경.
					event.target.className += ' select-seat';
					//선택 좌석정보 보여주기
					let seatinfo = document.getElementById("seat-info");
					let seatinfo2 = document.getElementById("seat-info2");
					seatinfo.innerHTML += " " + event.target.id;
					seatinfo2.innerHTML += " " + event.target.id;
					selected = true;
					count--;
					if (count == 0) {
						//버튼활성화
						let nextpage = document.getElementById("nextpage");
						nextpage.disabled = false;
						nextpage.className += ' click';
						let seatArea = document.getElementById("seat");
						let divs = seatArea.getElementsByTagName("div");

						for (var z = 0; z < divs.length; z++) {
							if (!divs[z].classList.contains('select-seat')
									&& !divs[z].classList.contains('blank')
									&& !divs[z].classList.contains('book')) {

								divs[z].className = 'cant-select';
								divs[z].innerHTML = "";

							}
						}

					}
				}

				console.log(count);
			});

		}

	}
</script>