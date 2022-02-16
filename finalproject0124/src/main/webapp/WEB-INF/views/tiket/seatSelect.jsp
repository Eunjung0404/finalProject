<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#seatBlind {
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

#nextpage {
	width: 100px;
	height: 100px;
	position: fixed;
	top: 50%;
	left: 92%;
	opacity: 50%;
	border: none;
	background: none;
}

#nextpage:hover {
	background-color: #ED4C00;
	opacity: 100%;
}
</style>
<!-- 인원수 및 기타... -->
<div class="row centerPosition">
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
				<span>${theatername }</span><br> <span>${screendate }</span> <span>${screentime }</span><input
					type="hidden" value="${screencode }" id="screencode"> <input
					type="hidden" value="${timecode }" id="timecode">
			</div>
		</div>
		<div id="seatname"
			style="padding-right: 250px; padding-top: 30px; width: 400px;">
			<span style="font-weight: bold;">선택한 좌석번호</span><br> <span
				style="color: gray;" id="seat-info"></span>
		</div>
	</div>
</div>
<!-- 결제방법 -->

<!-- 좌석 -->
<div class="row centerPosition">
	<div class="col-8 nonePadding">

		<div id="seat-area" class="centerTopPosition">
			<div id="seatBlind">
				<img src="/finalproject/resources/images/icon/arrowUP.png" alt="화살표"><br>
				<span style="color: white;">인원을 먼저 선택해주세요</span>
			</div>
			<img src="/finalproject/resources/images/icon/screen.jpg" alt="스크린"
				style="width: 70%;">
			<div id="seat" style="width: 100%; padding: 50px;"></div>
		</div>
	</div>
</div>
<!-- 결제정보 -->
<div class="row centerPosition">
	<div class="col-8 nonePadding" style="border: 1px solid gray;">
		<span style="font-size: 18px; font-weight: bold;">${moviename}</span>
		<span>${theatername }</span><br> <span>${screendate }</span><span>${screentime}</span><br>
		<span id="seat-info2"></span>
		<!-- 결제버튼 다음버튼 선택시 활성화-->
		<form:form method="post" action="${pageContext.request.contextPath}/"
			id="nextform">
			<!-- 유저아이디  -->
			<sec:authorize access="isAuthenticated()">
				<input type="hidden" name="username" id="userddd"
					value="<sec:authentication property="principal.username" />">
			</sec:authorize>

			<button>결제</button>
		</form:form>

	</div>

</div>

<button id="nextpage" onclick="nextpage()">
	<img src="/finalproject/resources/images/icon/forword.png" alt="다음페이지">
</button>

<script type="text/javascript">
	let peopelcount = 0;
	let teencount = 0;
	let count = 0;
	let price = 0;
	window.onload = function() {
		let timecode = document.getElementById("timecode").value;
		let screencode = document.getElementById("screencode").value;
		createPPbtn("people", "teenager", peopelcount);
		createPPbtn("teenager", "people", teencount);
		createSeat(screencode, timecode);
		//setEvent();
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
					price += 12000 * _count;
					console.log(price);
				} else if (divname == 'teenager') {
					price += 10000 * _count;
					console.log(price);

				}
				//카운트
				let countdiv = document.getElementById(divname + "-count");
				countdiv.value = _count;
				//count += _count;
				event.target.className = divname;
				let othercountdiv = document.getElementById(otherdivname
						+ "-count");
				count = parseInt(countdiv.value)
						+ parseInt(othercountdiv.value);
				console.log(divname + "카운트 " + _count);
				console.log("총카운트" + count);
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
								//console.log(json.list[i*j].CODE);
							}
							//div.style.top = movetop;

							//console.log(seatcount);

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
	function setEvent() {
		let seat = document.getElementsByClassName("seat-list");

		for (var i = 0; i < seat.length; i++) {

			seat[i].addEventListener('click', function(event) {
				if (count > 0) {
					console.log('좌석명 ' + event.target.id);
					event.target.className += ' select-seat';
					let seatinfo = document.getElementById("seat-info");
					let seatinfo2 = document.getElementById("seat-info2");
					seatinfo.innerHTML += " " + event.target.id;
					seatinfo2.innerHTML += " " + event.target.id;
					selected = true;
					count--;
					if (count == 0) {
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