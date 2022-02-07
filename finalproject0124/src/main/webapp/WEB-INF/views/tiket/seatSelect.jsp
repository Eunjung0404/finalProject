<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	border: none;
}

.clickpeple {
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
	font-size: 10px;
	border-radius: 5px 5px 0 0;
	color: #cbcbcb;
	cursor: pointer;
}
</style>
<!-- 인원수 및 기타... -->
<div class="row centerPosition">
	<div class="col-8 nonePadding"
		style="border: 1px solid gray; margin-top: 100px">

		인원수 선택
		<div id="people">성인:</div>
		<div id="theater-info">상영관/시간 정보:</div>
		<div id="seat-info">선택한 좌석번호:<span id="seatname"></span></div>
	</div>
</div>
<!-- 좌석 -->
<div class="row centerPosition">
	<div class="col-8 nonePadding">
		<div id="seat-area" class="centerTopPosition">
			<img src="/finalproject/resources/images/icon/screen.jpg" alt="스크린"
				style="width: 70%;">
			<div id="seat" style="width: 100%; padding: 50px;"></div>
		</div>
	</div>
</div>
<!-- 결제정보 -->
<div class="row centerPosition">
	<div class="col-8 nonePadding">...</div>
</div>
<script type="text/javascript">
	window.onload = function() {
		createPPbtn();
		createSeat();
		setEvent();
	}
	let count = 0;
	let selected = false;
	//인원수
	function createPPbtn() {
		let div = document.getElementById("people");
		for (var i = 0; i < 7; i++) {
			let btn = document.createElement("button");
			btn.value = i;
			btn.innerText = i;
			btn.id = "ppbtn";
			if (i == 0) {
				btn.className = 'clickpeple';
			}
			//클릭함수 추가..
			btn.onclick = function(event) {

				let seatArea = document.getElementById("seat");
				let divs = seatArea.getElementsByTagName("div");
				//선택된 좌석이 있는경우 초기화여부 묻기
				if (selected) {
					let result = confirm("선택된좌석이 있습니다 초기화하시겠습니까?");
					if (result) {
						let seatinfo = document.getElementById("seat-info");
						seatinfo.innerHTML = "";
						for (var z = 0; z < divs.length; z++) {
							if (divs[z].classList.contains('select-seat')) {

								divs[z].classList.remove('select-seat');

							} else {
								divs[z].classList.remove('cant-select');
								divs[z].className = 'seat-list';
								divs[z].innerHTML=divs[z].id.substr(1, 2);
							}
						}
						selected = false;

					} else {
						return;
					}
				}

				let clickbtn = document.getElementsByClassName("clickpeple");
				for (var j = 0; j < clickbtn.length; j++) {
					clickbtn[j].className = '';
				}
				count = event.target.innerText;
				event.target.className = 'clickpeple';
				console.log(count);

			}
			div.appendChild(btn);

		}

	}
	//좌석생성 ajax는 일단 보류..
	function createSeat() {
		let movetop = 20;
		for (var i = 0; i < 10; i++) {

			let moveleft = 28;
			let seatArea = document.getElementById("seat");
			//여기는 행 띄어쓰기
			if (i == 3) {
				seatArea.innerHTML += "<br>";
			}
			let span = document.createElement("span");
			span.innerText = String.fromCharCode(65 + i);
			span.className = 'seat-position';
			//span.style.top = movetop;
			span.style.left = "670px";
			seatArea.appendChild(span);

			for (var j = 0; j < 12; j++) {

				let div = document.createElement("div");
				div.className = "seat-list";

				//이쪽은 열띄어쓰기
				if (j == 3) {
					moveleft += 20;
				}
				if (j == 9) {
					moveleft += 20;
				}

				//div.style.top = movetop;

				div.style.left = 670 + moveleft + "px";

				if (j + 1 < 10) {
					div.innerText = '0' + (j + 1);
					div.id = String.fromCharCode(65 + i) + '0' + (j + 1);
				} else {
					div.innerText = (j + 1);
					div.id = String.fromCharCode(65 + i) + (j + 1);

				}

				seatArea.appendChild(div);
				moveleft += 28;

			}
			seatArea.innerHTML += "<br>";
			movetop += 20;
		}
	}
	function setEvent() {
		let seat = document.getElementsByClassName("seat-list");

		for (var i = 0; i < seat.length; i++) {

			seat[i].addEventListener('click', function(event) {
				if (count > 0) {
					console.log('좌석명 ' + event.target.id);
					event.target.className += ' select-seat';
					let seatinfo = document.getElementById("seat-info");
					seatinfo.innerHTML += event.target.id;
					selected = true;
					count--;
					if (count == 0) {
						let seatArea = document.getElementById("seat");
						let divs = seatArea.getElementsByTagName("div");
						for (var z = 0; z < divs.length; z++) {
							if (!divs[z].classList.contains('select-seat')) {

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