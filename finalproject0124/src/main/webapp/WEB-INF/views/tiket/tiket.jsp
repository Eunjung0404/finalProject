<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#daytable {
	text-align: center;
}

#daytable th {
	padding: 5px;
}

#daytable tr {
	padding: 5px;
}

#daytable tobody {
	padding: 5px;
}

#daytable td {
	padding: 5px;
}

#daytable thead {
	padding: 5px;
}

#daytable .nextDate {
	color: #D5D5D5;
}

#daytable .prevDate {
	color: #D5D5D5;
}

.movemonth {
	background: none;
	border: none;
}

#Tab li:hover {
	background-color: gray;
	color: white;
}

#Tab li {
	padding: 10px;
}

.clickli {
	border: none;
	background-color: #ED4C00;
	color: white;
}

.clickarea {
	background-color: gray;
	color: white;
}

.time {
	border: 1px solid gray;
}

.time:hover {
	background-color: #ED4C00;
	color: white;
}

#Tab {
	list-style: none;
	padding: 0;
}

#theaterList li:hover {
	background-color: #ED4C00;
	color: white;
}

#theaterList li {
	padding: 10px;
}

#theaterList {
	list-style: none;
	padding: 0;
}

#areas li:hover {
	background-color: gray;
	color: white;
}

#areas li {
	padding: 10px;
}

#areas {
	list-style: none;
	padding: 0;
}

.screentime {
	display: flex;
	border: 1px solid gray;
	width: 120px;
	text-align: center;
	height: 80px;
	justify-content: center;
	align-content: center;
	align-items: center;
	margin: 10px;
}

.screentime:hover {
	border: none;
	background-color: #ED4C00;
	color: white;
}

#nextpage {
	width: 100px;
	height: 100px;
	position: fixed;
	top: 50%;
	left: 92%;
	opacity: 50%;
}

#nextpage:hover {
	background-color: #ED4C00;
	opacity: 100%;
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
					<div class="accordion-body nonePadding">
						<ul id="Tab">

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
						<li id="서울">서울<span></span></li>
						<li id="부산">부산<span></span></li>
						<li id="경기">경기<span></span></li>
						<li id="대전">대전<span></span></li>
						<li id="대구">대구<span></span></li>
					</ul>

				</div>

				<div style="width: 65%; border: 1px solid gray; height: 100%;">

					<ul id="theaterList">
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
				<button class="movemonth" id="prevmonth" onclick="prevmonthbtn()">
					<img src="/finalproject/resources/images/icon/back.png" alt="이전버튼">
				</button>
				<span id="text-month"
					style="padding-left: 50px; padding-right: 50px;"></span>
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

<div class="row centerPosition">
	<div class="col-8 nonePadding"
		style="border: 1px solid gray; height:300px; margin-top: 50px;">
		영화정보>
		<div id="movieposterinfo" style="height:100%; width:100%; background-size: 5000px 5000px;">
			<img src="/finalproject/resources/images/icon/img.png" alt="이미지없음"
				style="width:150px;height:250px;" id="posterImg">
		
		</div>
		<div id="movie-name">영화를 선택해주세요</div>

	</div>
</div>
<div class="row centerPosition">
	<div class="col-8 nonePadding"
		style="border: 1px solid gray; height: 700px; margin-top: 50px;">
		시간선택>
		<div id="theater-info">상영관과 날짜를 선택해주세요</div>

	</div>

</div>

<form:form method="post"
	action="${pageContext.request.contextPath}/member/seat" id="nextform">
	<!-- 영화코드 -->
	<input type="hidden" value="" id="moviecode" name="moviecode">
	<!-- 영화이름 -->
	<input type="hidden" value="" id="moviename" name="moviename">
	<!-- 지역코드 -->
	<input type="hidden" value="" id="areaname" name="areaname">
	<!--극장코드 -->
	<input type="hidden" value="" id="theatercode" name="theatercode">
	<!--극장이름 -->
	<input type="hidden" value="" id="theatername" name="theatername">
	<!-- 상영일 -->
	<input type="hidden" value="" id="screendate" name="screendate">
	<!-- 상영관코드 -->
	<input type="hidden" value="" id="screencode" name="screencode">
	<!-- 스케쥴코드 -->
	<input type="hidden" value="" id="timecode" name="timecode">
	<!-- 상영시간 -->
	<input type="hidden" value="" id="screentime" name="screentime">

	<button id="nextpage" onclick="nextpage()">
		<img src="/finalproject/resources/images/icon/forword.png" alt="다음페이지">
	</button>

</form:form>
<script type="text/javascript">
	//달력정보들
	var year = document.getElementById("text-year").innerText;
	var table = document.getElementById("daytable");
	var thead = document.getElementById("day");
	var tr = table.getElementsByTagName("tr");
	var th = tr[0].getElementsByTagName("th").length;
	var tbody = document.getElementById("week");
	//영화코드값 넘기는용
	let moviecode = document.getElementById("moviecode");
	//극장코드값 넘기는용
	let theatercode = document.getElementById("theatercode");

	//스케쥴코드값 넘기는용
	let screendate = document.getElementById("screendate");
	//극장정보 공간 불러오기
	let ul = document.getElementById("areas");
	let areas = ul.getElementsByTagName("li");

	//로드 될때 달력그리기.
	window.onload = function() {

		//현재달력
		drawCerrentCalendar(0, 0);
		var month = parseInt(document.getElementById("text-month").innerText) - 1;
		//이전달력
		drawprevCalendar(year, month);
		console.log("이번달은 " + month);
		//극장카운트 불러오기
		for (var i = 0; i < areas.length; i++) {
			getTheaterCount(areas[i], "");
			areas[0].className = "clickarea";
			areas[i].onclick = function(event) {
				resetArea();
				event.target.className = "clickarea";
				getTheaterName(event.target.id, moviecode.value);
			}
		}
		getMovieInfo();
		getTheaterName('서울', "");
		getScreenTime("", "");

	}
	function nextpage() {
		document.getElementById("nextform").submit();
	}
	function resetArea() {
		let areas = document.getElementById("areas");
		let lis = areas.getElementsByTagName("li");
		for (var i = 0; i < lis.length; i++) {
			lis[i].className = "";
		}
	}
	//영화정보불러오기
	function getMovieInfo() {
		let xhr = new XMLHttpRequest();
		let tab = document.getElementById("Tab");
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				for (var i = 0; i < json.result.length; i++) {

					let li = document.createElement('li');

					li.innerText = json.result[i].MOVIENAME;
					li.id = json.result[i].MOVIECODE;
					li.onclick = function(event) {
						resetArea();
						areas[0].className = "clickarea";
						let tab = document.getElementById("Tab");
						let lis = tab.getElementsByTagName("li");
						for (var i = 0; i < lis.length; i++) {
							lis[i].className = "";
							lis[i].lastChild.className = "";
						}
						event.target.className = "clickli";
						for (var i = 0; i < areas.length; i++) {

							getTheaterCount(areas[i], event.target.id);

						}
						//넘겨줄값 넣기
						moviecode.value = event.target.id;//영화코드
						let moviename = document.getElementById('moviename');
						moviename.value = event.target.innerText;//영화이름

						getTheaterName('서울', event.target.id);
						//포스터img그리기
						let posterdiv = document
								.getElementById("movieposterinfo");

						let posterImg = document.getElementById('posterImg');
						posterImg.src = getContextPath()
								+ "/resources/images/movieupload/"
								+ event.target.lastChild.value;
						//벼경에 img깔기
						posterdiv.style.backgroundImage=
							//"linear-gradient(to top, rgba(0, 0, 0, 1), rgba(0, 0, 0, 0)),"
							//+
							"url("+getContextPath()
							+ "/resources/images/movieupload/"
							+ event.target.lastChild.value+")";
						posterdiv.appendChild(posterImg);
						//posterdiv.innerText=event.target.innerText;
						let movienamediv = document
								.getElementById("movie-name");
						movienamediv.innerText = event.target.innerText;
					}
					let movieimg = document.createElement('input');
					movieimg.setAttribute("type", "hidden");
					movieimg.id = "movieimg";
					movieimg.value = json.result[i].MOVIEIMG;
					li.appendChild(movieimg);
					tab.appendChild(li);

				}
			}
		}
		xhr.open('get', '/finalproject/tiket-movie', true);
		xhr.send();
	}

	//극장카운트불러오기
	function getTheaterCount(area, moviecode) {
		let xhr = new XMLHttpRequest();
		if (area == "")
			return;

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				//지역별 극장수 
				let count = json.count;
				let span = area.lastChild;
				span.id = "count";
				span.innerText = "(" + count + ")";

			}
		}
		xhr.open('get', '/finalproject/tiket-theaterCount?area=' + area.id
				+ '&moviecode=' + moviecode, true);
		xhr.send();

	}
	//극장리스트 불러오기
	function getTheaterName(areaname, moviecode) {
		let xhr = new XMLHttpRequest();
		if (areaname == "")
			return;
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				let data = xhr.responseText;
				let json = JSON.parse(data);
				//지역별 극장리스트
				let list = json.list;
				//console.log(list);
				let theaterList = document.getElementById("theaterList");
				let length = theaterList.childNodes.length
				for (var i = 0; i < length; i++) {
					theaterList.removeChild(theaterList.lastChild);
				}
				for (var i = 0; i < list.length; i++) {
					let li = document.createElement('li');
					li.innerText = list[i].THEATERNAME;
					li.id = list[i].THEATERCODE;
					li.onclick = function(event) {
						//let tab = document.getElementById("theaterList");
						let lis = theaterList.getElementsByTagName("li");
						for (var i = 0; i < lis.length; i++) {
							lis[i].className = "";
							lis[i].lastChild.className = "";
						}
						event.target.className = "clickli";
						let sn = document.getElementById("theatername");
						sn.value = event.target.innerText;
						theatercode.value = event.target.id;
						let mc = document.getElementById("moviecode");
						getScreenTime(mc.value, theatercode.value);

					}

					theaterList.appendChild(li);

				}

			}
		}
		xhr.open('get', '/finalproject/tiket-theater?area=' + areaname
				+ '&moviecode=' + moviecode, true);
		xhr.send();

	}

	//이전달 달력그리기
	function drawprevCalendar(year, month) {
		let prevdate = new Date(year, month - 1)
		console.log(month);
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
				let d = prevdate.getDate() + (getlastday - count);
				td[i].innerText = d;
				td[i].className = "date prevDate";
				console.log(prevdate.getMonth() + 1);
				if (getMonth < 10) {

					td[i].id = prevdate.getFullYear() + "/0"
							+ (prevdate.getMonth() + 1) + "/" + d;

				} else {

					td[i].id = prevdate.getFullYear() + "/"
							+ (prevdate.getMonth() + 1) + "/" + d;

				}
				count--;

			}

		}
		count = 0;

	}

	//현재달의달력그리기
	function drawCerrentCalendar(year, month) {
		let date = 0;
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
		console.log("월:" + getMonth);
		console.log("시작일:" + getstartday);
		console.log("끝일:" + getlastday);
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
						tdDate.className += " currentDate"

					} else {

						tdDate.className = " nextDate"
					}
					if (getMonth < 10) {
						if (date.getDate() < 10) {
							tdDate.id = date.getFullYear() + "/0"
									+ (date.getMonth() + 1) + "/0"
									+ date.getDate();
						} else {
							tdDate.id = date.getFullYear() + "/0"
									+ (date.getMonth() + 1) + "/"
									+ date.getDate();
						}

					} else {
						if (date.getDate() < 10) {
							tdDate.id = date.getFullYear() + "/"
									+ (date.getMonth() + 1) + "/0"
									+ date.getDate();
						} else {
							tdDate.id = date.getFullYear() + "/"
									+ (date.getMonth() + 1) + "/"
									+ date.getDate();
						}

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

	//상영날짜 정보 가져오기 
	function getScreenTime(moviecode, theatercode) {
		let xhr = new XMLHttpRequest();
		console.log("들어왔다");
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				let data = xhr.responseText;
				let json = JSON.parse(data);
				//정보
				let screendate = json.result.screendate;
				//넘겨줄값 넣기

				let td = tbody.getElementsByTagName("td");

				//클레스이름 삭제...
				for (var i = 0; i < td.length; i++) {

					if (td[i].classList.contains('time')) {
						td[i].classList.remove('time');
						td[i].classList.remove('clickli');
					}

				}
				for (var i = 0; i < json.result.length; i++) {
					console.log(json.result[i].screendate);
					for (var j = 0; j < td.length; j++) {

						if (td[j].id == json.result[i].screendate) {

							td[j].className += " time";
							td[j].onclick = function(event) {
								for (var s = 0; s < td.length; s++) {

									td[s].classList.remove('clickli');

								}
								event.target.className += " clickli";
								let sd = document.getElementById("screendate");
								let mc = document.getElementById("moviecode");
								let tc = document.getElementById("theatercode");
								sd.value = event.target.id;
								if (mc.value != "" && tc.value != "") {

									console.log("정보불러오기!" + mc.value + ","
											+ tc.value);
									getScreeninfo(mc.value, tc.value, sd.value);
								}
							}
						}

					}
				}

			}
		}
		xhr.open('get', '/finalproject/tiket-ScreenDate?moviecode=' + moviecode
				+ '&theatercode=' + theatercode, true);
		xhr.send();

	}

	//다음달로 넘기기
	function nextmonthbtn() {

		//기존 달력정보 삭제
		for (var i = tbody.rows.length; i >= 0; i--) {
			console.log(tbody.rows.length);
			tbody.deleteRow(tbody.rows.length - 1);

		}
		//
		let nextM = parseInt(document.getElementById("text-month").innerText) + 1;
		document.getElementById("text-month").innerText = nextM;
		drawCerrentCalendar(year, nextM - 1)
		drawprevCalendar(year, nextM - 1);
	}

	//이전달로 넘기기
	function prevmonthbtn() {

		for (var i = tbody.rows.length; i >= 0; i--) {
			console.log(tbody.rows.length);
			tbody.deleteRow(tbody.rows.length - 1);

		}
		let prevM = parseInt(document.getElementById("text-month").innerText) - 1;
		document.getElementById("text-month").innerText = prevM;
		drawCerrentCalendar(year, prevM - 1)
		drawprevCalendar(year, prevM - 1);
	}

	//상영정보 가져오기~
	function getScreeninfo(moviecode, theatercode, screendate) {
		let xhr = new XMLHttpRequest();
		if (moviecode == "")
			return;
		//console.log(getContextPath());
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				let data = xhr.responseText;
				let json = JSON.parse(data);
				let div = document.getElementById('theater-info');
				let length = div.childNodes.length
				for (var i = 0; i < length; i++) {
					div.removeChild(div.lastChild);
				}
				for (var i = 0; i < json.result.length; i++) {
					let infodiv = document.createElement('div');
					infodiv.innerText = json.result[i].starttime + "-"
							+ json.result[i].endtime;
					infodiv.id = json.result[i].timecode;
					infodiv.className = "screentime";

					infodiv.name = json.result[i].screencode;

					//시간선택시
					infodiv.onclick = function(event) {
						event.target.className += " clickli";
						let timecode = document.getElementById("timecode");
						timecode.value = event.target.id;
						let sc = document.getElementById("screencode");
						let st = document.getElementById("screentime");
						sc.value = event.target.name;
						st.value = event.target.innerText;
					}
					div.appendChild(infodiv);
				}

			}
		}
		xhr.open('get', '/finalproject/tiket-screen?moviecode=' + moviecode
				+ '&theatercode=' + theatercode + '&screendate=' + screendate,
				true);
		xhr.send();

	}

	//contextPath가져오는 함수
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	}
</script>