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

#daytable {
	text-align: center;
}

#daytable th {
	padding: 5px;
}

#daytable #nextDate {
	color: #D5D5D5;
}

#daytable #prevDate {
	color: #D5D5D5;
}

.movemonth {
	background: none;
	border: none;
}
</style>

<div class="row centerPosition">
	<!-- 영화선택창 -->
	<div class="col-3 nonePadding" style="margin-top: 100px;">
		영화선택
		<div class="accordion accordion-flush" id="accordionFlushExample"
			style="border: 1px solid gray; height: 500px;">

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingOne">
					<button class="accordion-button " type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="true" aria-controls="flush-collapseOne">
						영화 TOP 10</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="flush-headingOne"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
							<li>특송</li>
							<li>스파이더맨:노웨이홈</li>
							<li>경관의 피</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo">
						TOP 10 외 영화</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="flush-headingTwo"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
							<li>특송</li>
							<li>스파이더맨:노웨이홈</li>
							<li>경관의 피</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
						영화제 영화</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					aria-labelledby="flush-headingThree"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<ul>
							<li>특송</li>
							<li>스파이더맨:노웨이홈</li>
							<li>경관의 피</li>
						</ul>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- 영화창  -->

	<div class="col-3 nonePadding" style="margin-top: 100px">
		극장선택
		<div style="height: 500px; border: 1px solid gray;">
			극장<br>
			<div class="centerPosition" style="height: 95%;">
				<div style="width: 35%; border: 1px solid gray; height: 100%;">
					<ul id="areas">
						<li><a href="">서울<span></span></a></li>
						<li><a href="">경기<span></span></a></li>
					</ul>

				</div>

				<div style="width: 65%; border: 1px solid gray; height: 100%;">
					<ul id="theaterList">
						<li><a href="">강남구</a></li>
						<li><a href="">종로구..등등</a></li>
					</ul>

				</div>
			</div>
		</div>
	</div>

	<!-- 관람일 선택 -->
	<div class="col-2 nonePadding" style="margin-top: 100px">

		관람일 선택

		<div id="Calendar" class="centerTopPosition"
			style="width: 250px; height: 300px; border: 1px solid gray; height: 500px;">
			<span id="text-year">2022</span>
			<div>
				<button class="movemonth" id="prevmonth">
					<img src="/finalproject/resources/images/icon/back.png" alt="이잔버튼">
				</button>
				<span id="text-month"
					style="padding-left: 50px; padding-right: 50px;">2</span>
				<button class="movemonth" id="nextmonth" onclick="nextmonthbtn()">
					<img src="/finalproject/resources/images/icon/next.png" alt="다음버튼">
				</button>
			</div>
			<table id="daytable">
				<thead id="day">
					<tr>
						<th style="color: red;">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th style="color: blue">토</th>
					</tr>
				</thead>
				<tbody id="week">

				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-8"
		style="border: 1px solid gray; height: 200px; margin-top: 50px; margin-left: 250px;">
		영화를 선택해주세요</div>
</div>
<script type="text/javascript">
	//달력
	var month = parseInt(document.getElementById("text-month").innerText) - 1;
	var year = document.getElementById("text-year").innerText;
	var table = document.getElementById("daytable");
	var thead = document.getElementById("day");
	var tr = table.getElementsByTagName("tr");
	var th = tr[0].getElementsByTagName("th").length;
	var tbody = document.getElementById("week");

	//극장정보 불러오기
	let ul = document.getElementById("areas");
	let areas = ul.getElementsByTagName("li");
	//정보불러오기
	function getTheaterCount(area) {
		let xhr = new XMLHttpRequest();
		if (area == "")
			return;
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				//지역별 극장수 
				let count = json.count;
				//지역별 극장리스트
				let list
				let span = area.firstChild.childNodes[1];
				span.id = "count";
				span.innerText = "(" + count + ")";
			}
		}
		xhr.open('get', '/finalproject/tiket-theater?area=' + area.innerText,
				true);
		xhr.send();

	}
	//로드 될때 달력그리기.
	window.onload = function() {

		//현재달력
		drawCerrentCalendar(0, 0);
		//이전달력
		drawprevCalendar(year, month);
		for (var i = 0; i < areas.length; i++) {
			getTheaterCount(areas[i]);
			console.log(getTheaterCount(areas[i]));
		}

	}
	//이전달 달력그리기
	function drawprevCalendar(year, month) {
		let prevdate = new Date(year, month - 1)
		let getyear = prevdate.getFullYear();
		let getMonth = prevdate.getMonth() + 1;

		var getlastday = getLastday(getyear, getMonth);
		let td = document.getElementsByClassName("date");
		let count = 0;
		for (var i = 0; i < td.length; i++) {
			if (!td[i].id) {
				count++;
			}

		}
		for (var i = 0; i < td.length; i++) {
			if (!td[i].id) {
				td[i].innerText = prevdate.getDate() + (getlastday - count);
				td[i].id = "prevDate";
				count--;
			}

		}
		count = 0;

	}
	//현재달의달력그리기
	function drawCerrentCalendar(year, month) {
		let date=0;
		if (year == 0 && month == 0) {
			date = new Date();
			//날짜 초기화
			console.log("00000");
			date.setDate(1);
		} else {

			console.log("11111");
			date = new Date(year, month);
		}
		console.log(date);
		let getyear = date.getFullYear();
		let getMonth = date.getMonth() + 1;
		let getstartday = date.getDay();
		var getlastday = getLastday(getyear, getMonth);
		document.getElementById("text-month").innerText = getMonth;
		console.log("월:"+getMonth);
		console.log("시작일:"+getstartday);
		console.log("끝일:"+getlastday);
		//table tr/td생성
		for (var i = 0; i < 6; i++) {
			//tr생성
			var trweek = document.createElement("tr");
			trweek.id = "week" + i;
			tbody.appendChild(trweek);
		
			for (var j = 0; j < 7; j++) {
				//td생성
				var tdDate = document.createElement("td");
				tdDate.className = "date";
				document.getElementById("week" + i).appendChild(tdDate);
				if (j == getstartday) {

					tdDate.innerText = date.getDate();
					//날짜 ++
					if ((getMonth - 1) == date.getMonth()) {
						tdDate.id = "currentDate"

					} else {

						tdDate.id = "nextDate"
					}
					date.setDate(date.getDate() + 1);
					getstartday = date.getDay();

				}

			}

		}
	}

	//마지막 일수 가져오기 
	function getLastday(year, month) {
		let lastdays = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		let lastdays2 = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
			console.log("윤년!");
			return lastdays2[month - 1];
		} else {

			return lastdays[month - 1];
		}
	}

	//다음달로 넘기기
	function nextmonthbtn() {

		for (var i = tbody.rows.length; i >= 0; i--) {
		  console.log(tbody.rows.length);
			tbody.deleteRow(tbody.rows.length-1);

		}
		let nextM = parseInt(document.getElementById("text-month").innerText) + 1;
		document.getElementById("text-month").innerText = nextM;
		drawCerrentCalendar(year, nextM- 1)
		drawprevCalendar(year, nextM- 1);
	}
</script>