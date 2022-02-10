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
</style>
<!-- 인원수 및 기타... -->
<div class="row centerPosition">
	<div class="col-8 nonePadding"
		style="border: 1px solid gray; margin-top: 100px">

		인원수 선택
		<div id="people">성인:</div>
		<div id="teenager">청소년:</div>
		<div id="theater-info">상영관/시간 정보:</div>
		<div id="seatname">
			선택한 좌석번호:<span id="seat-info"></span>
		</div>
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
		createPPbtn("people", "teenager");
		createPPbtn("teenager", "people");
		createSeat(1, 1);
		//setEvent();
	}
	let count = 0;
	let selected = false;
	//인원수
	function createPPbtn(divname, otherdivname) {
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

							}

							else if (!divs[z].classList.contains('blank')&&!divs[z].classList.contains('book')) {
								divs[z].classList.remove('cant-select');
								divs[z].className = 'seat-list';
								divs[z].innerHTML = divs[z].id.substr(1, 2);
							}
						}
						selected = false;

					} else {
						return;
					}
				}

				let clickbtn = document.getElementsByClassName(divname);
				for (var j = 0; j < clickbtn.length; j++) {
					clickbtn[j].disabled = false;
					clickbtn[j].className = '';

				}
				count += parseInt(event.target.innerText);
				let otherdiv = document.getElementById(otherdivname);
				let otherdivs = otherdiv.getElementsByTagName("button");
				console.log(otherdiv);
				for (var s = 0; s < otherdivs.length; s++) {
					if (count + parseInt(otherdivs[s].innerText) > 6) {
						otherdivs[s].disabled = true;
						console.log("들어왔다.");
					}

				}
				event.target.className = divname;
				console.log(count);
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
				for (var i = 0; i < row; i++) {

					let moveleft = 28;
					let seatArea = document.getElementById("seat");

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
					seatinfo.innerHTML += " "+event.target.id;
					selected = true;
					count--;
					if (count == 0) {
						let seatArea = document.getElementById("seat");
						let divs = seatArea.getElementsByTagName("div");

						for (var z = 0; z < divs.length; z++) {
							if (!divs[z].classList.contains('select-seat')
									&& !divs[z].classList.contains('blank')&&!divs[z].classList.contains('book')) {

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