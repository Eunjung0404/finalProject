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

.Tab li:hover {
	background-color: gray;
	color: white;
}

.Tab li {
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

.Tab {
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

.inputsearch {
	padding: 0 0 5px 1px;
	width: calc(100% - 200px);
	line-height: 1;
	border: none;
	border-bottom: 1px solid #777;
	font-size: 13px;
	font-weight: normal;
	color: #2b2b2b;
	outline: none;
	background: none;
	line-height: 1;
}

.nonebackground {
	background: none;
	border: none;
}

.search_result {
	margin-left: 79px;
	padding: 10px 0;
	display: none;
	max-height: 430px;
	overflow: hidden;
	overflow-y: auto;
	background: #fff;
	border: 1px solid #1a1a1a;
	border-top: none;
	width: calc(100% - 1470px);
	position: absolute;
	z-index: 3;
}

.search_result li:hover {
	background-color: #ED4C00;
	color: white;
}

.search_result ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.search_result li {
	padding: 10px;
}

#screenName {
	font-size: 18px;
	font-weight: bold;
	padding: 10px;
}

.moviediv {
	overflow-y: scroll;
	max-height: 390px;
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

.enone {
	pointer-events: none
}
</style>
<input id="num" value="${moviecode }" type="hidden">
<div class="row centerPosition">
	<!-- 영화선택창 -->
	<div class="col-3 nonePadding" style="margin-top: 100px;">
		<span style="font-size: 18px; font-weight: bold;">영화선택</span>
		<!-- 검색 -->
		<input type="text" placeholder="영화명을 입력해주세요" class="inputsearch"
			id="searchMovie" onkeyup="searchinfo(event)">
		<button class="nonebackground">
			<img src="/finalproject/resources/images/icon/search_black.png"
				alt="검색">
		</button>
		<div class="search_result" id="result-searchMovie">
			<ul></ul>
		</div>
		<div class="accordion accordion-flush" id="accordionFlushExample"
			style="border: 1px solid gray; height: 500px; margin-top: 10px;">

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingOne">
					<button class="accordion-button " type="button" id="flushbtn1"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="true" aria-controls="flush-collapseOne"
						onclick="accordionctrl('flush-collapseOne','flush-collapseTwo',event,'flushbtn2')">
						영화 TOP 10</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="flush-headingOne"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body nonePadding moviediv">
						<ul id="Tab1" class="Tab">

						</ul>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button class="accordion-button collapsed" type="button"
						id="flushbtn2" data-bs-toggle="collapse"
						data-bs-target="#flush-collapseTwo" aria-expanded="false"
						aria-controls="flush-collapseTwo"
						onclick="accordionctrl('flush-collapseTwo','flush-collapseOne',event,'flushbtn1')">
						TOP 10 외 영화</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="flush-headingTwo"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body nonePadding moviediv">
						<ul id="Tab2" class="Tab">

						</ul>
					</div>
				</div>
			</div>

		</div>


	</div>
	<!-- 영화창  -->

	<div class="col-3 nonePadding" style="margin-top: 100px">
		<span style="font-size: 18px; font-weight: bold;">극장선택</span>
		<!-- 검색 -->
		<input type="text" placeholder="극장명을 입력해주세요" class="inputsearch"
			id="searchTheater" onkeyup="searchinfo(event)">
		<button class="nonebackground">
			<img src="/finalproject/resources/images/icon/search_black.png"
				alt="검색">
		</button>
		<div class="search_result" id="result-searchTheater">
			<ul></ul>
		</div>
		<div style="height: 500px; margin-top: 10px; border: 1px solid gray;">
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

		<span style="font-size: 18px; font-weight: bold;">관람일 선택</span>

		<div id="Calendar" class="centerTopPosition"
			style="width: 250px; height: 300px; border: 1px solid gray; height: 500px; margin-top: 10px;">
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
			<div style="display: flex; align-items: center;">
				<div style="border: 1px solid gray; width: 10px; height: 10px;"></div>
				<span style="font-size: 5px; padding: 10px;"> 선택가능 </span>
				<div style="width: 11px; height: 11px; background-color: #ED4C00;"></div>
				<span style="font-size: 5px; padding: 10px;">선택 </span>
			</div>
			<div style="border-top: 1px solid; width: 100%; margin-top: 50px;"
				class="centerPosition">
				<span style="font-size: 5px; padding: 30px">영화, 극장, 관람일을
					선택하시면 <br>시간 선택이 아래쪽에 나타납니다.
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row centerPosition nonedisplay" id="timesdiv">
	<div class="col-8 nonePadding" style="margin-top: 50px;">
		<span style="font-size: 18px; font-weight: bold;">시간선택></span>
	</div>
	<div class="col-8 nonePadding" style="border: 1px solid gray;">

		<div id="theater-info">상영관과 날짜를 선택해주세요</div>

	</div>

</div>
<div class="row centerPosition">
	<div class="col-8 nonePadding" style="margin-top: 50px;">
		<span style="font-size: 18px; font-weight: bold;">영화정보 ></span>
	</div>
	<div class="col-8 nonePadding"
		style="border: 1px solid gray; height: 300px; overflow: hidden; position: relative;">

		<div id="movieposterinfo"
			style="height: 100%; width: 100%; background-size: 5000px; position: absolute; filter: brightness(40%) blur(20px); transform: scale(1.1)">
		</div>
		<div>

			<div>
				<img src="/finalproject/resources/images/icon/img.png" alt="이미지없음"
					style="width: 150px; position: absolute; margin-left: 50px; margin-top: 35px;"
					id="posterImg">
			</div>
			<div
				style="z-index: 1; color: black; position: absolute; margin-left: 230px; margin-top: 100px;">
				<span id="movie-name" style="font-size: 22px; font-weight: bold;">영화를
					선택해주세요</span><br> <br> <span id="select-area">극장을 선택해주세요</span><span
					id="select-screen"></span><br> <span id="select-time">관람일시를
					선택해주세요</span><span id="select-screentime"></span>
			</div>
		</div>
	</div>
</div>


<form:form method="post"
	action="${pageContext.request.contextPath}/member/seat" id="nextform">
	<!-- 영화코드 -->
	<input type="hidden" value="" id="moviecode" name="moviecode">
	<!-- 영화이름 -->
	<input type="hidden" value="" id="movienamehtml" name="movienamehtml">
	<!-- 영화이름 -->
	<input type="hidden" value="" id="moviename" name="moviename">
	<!--극장코드 -->
	<input type="hidden" value="" id="theatercode" name="theatercode">
	<!--극장이름 -->
	<input type="hidden" value="" id="theatername" name="theatername">
	<!-- 상영일 -->
	<input type="hidden" value="" id="screendate" name="screendate">
	<!-- 상영관코드 -->
	<input type="hidden" value="" id="screencode" name="screencode">
	<!-- 상영관이름 -->
	<input type="hidden" value="" id="screenname" name="screenname">
	<!-- 스케쥴코드 -->
	<input type="hidden" value="" id="timecode" name="timecode">
	<!-- 상영시간 -->
	<input type="hidden" value="" id="screentime" name="screentime">
	<!-- 영화이미지 -->
	<input type="hidden" value="" id="movieimgname" name="movieimgname">

	<button id="nextpage" disabled="disabled" onclick="nextpage()"
		class="nextpage">
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
	//요일
	const weekday = [ '일', '월', '화', '수', '목', '금', '토' ];
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

	function checkparam() {
		let num = document.getElementById("num");
		if (num.value != 0) {
			//영화목록 가져오기
			console.log("파라미터" + num.value);
			let aco = document.getElementById('accordionFlushExample');
			for (var x = 0; x < aco.childNodes.length; x++) {

				//ul정보 가져오기
				let tab = document.getElementsByClassName('Tab');
				for (var y = 0; y < tab.length; y++) {

					//ul-li가져오기
					let lis = tab[y].getElementsByTagName('li');
					console.log("체크" + lis.length);
					for (var z = 0; z < lis.length; z++) {
						//console.log("z="+z);
						//li배열에서 moviecode가 같을경우 해당 li click()이벤트 발생
						if (lis[z].id == num.value) {
							lis[z].click();
							//console.log("z="+z);
							if (lis[z].parentNode.id=="Tab2") {
								accordionctrl('flush-collapseTwo',
										'flush-collapseOne', document.getElementById('flushbtn2'),
										'flushbtn1')
										//console.log();
							}
							
						}
					}
				}
			}
		}
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
	//작동
	function accordionctrl(id, id2, event, id3) {
		let flush = document.getElementById(id);
		let flush2 = document.getElementById(id2);
		let btn = document.getElementById(id3);
		if (!flush.classList.contains('show')) {
			flush.className += ' show';
			flush2.classList.remove('show');
			event.target.classList.remove('collapsed');
			console.log("테스트="+event.target.classList)
			btn.className += " collapsed"
		}

	}

	//검색 
	function searchinfo(event) {

		let xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				let resultdiv = document.getElementById("result-"
						+ event.target.id);
				let resultul = resultdiv.children[0];

				let length = resultul.childNodes.length;
				console.log(length);
				for (var i = 0; i < length; i++) {
					resultul.removeChild(resultul.lastChild);
					console.log("삭제!");
				}

				//검색아래에 li생성하기
				if (event.target.value != "") {
					for (var i = 0; i < json.result.length; i++) {
						//div 활성화
						resultdiv.style.display = "block";

						//검색된 내역 li생성해서 담아주기
						let li = document.createElement('li');
						if (event.target.id == 'searchMovie') {
							li.id = json.result[i].MOVIECODE;
							li.innerText = json.result[i].MOVIENAME;
							//li클릭시 이벤트 발생
							li.onclick = function(event) {

								event.target.className = "clickli";
								//영화목록 가져오기
								let aco = document
										.getElementById('accordionFlushExample');
								for (var x = 0; x < aco.childNodes.length; x++) {
									//ul정보 가져오기
									let tab = document
											.getElementsByClassName('Tab');
									for (var y = 0; y < tab.length; y++) {
										//ul-li가져오기
										let lis = tab[y]
												.getElementsByTagName('li');
										for (var z = 0; z < lis.length; z++) {
											//li배열에서 moviecode가 같을경우 해당 li click()이벤트 발생
											if (lis[z].id == event.target.id) {
												lis[z].click();
											}
										}
									}

								}
								resultdiv.style.display = "none";
							}

						}
						if (event.target.id == 'searchTheater') {
							li.id = json.result[i].THEATERCODE;
							li.innerText = json.result[i].THEATERNAME;
							let input = document.createElement('input');
							input.setAttribute('type', 'hidden');
							input.value = json.result[i].AREA;
							li.appendChild(input);
							li.onclick = function(event) {
								event.target.className = "clickli";
								//지역 li가져와서 click이벤트 
								let areas = document.getElementById("areas");
								let lis = areas.getElementsByTagName("li");
								for (var z = 0; z < lis.length; z++) {
									if (lis[z].id == event.target.lastChild.value) {
										lis[z].click();
										//console.log(lis[z]);
										/////////////////////////////////////////////////
										let theaterList = document
												.getElementById("theaterList");
										let theaterlis = theaterList
												.getElementsByTagName("li");
										console.log(theaterlis);
										for (var s = 0; s < theaterlis.length; s++) {
											console.log(theaterlis[s].id);
											if (theaterlis[s].id == event.target.id) {
												theaterlis[s].click();
												console.log(theaterlis[z]);
											}

										}
										/////////////////////////////////////////////////
									}

								}

								resultdiv.style.display = "none";

							}
						}

						resultul.appendChild(li);
					}

				} else {
					//div비활성화
					resultdiv.style.display = "none";
				}

				//li에 이벤트 걸어주기
			}
		}
		xhr.open('get', '/finalproject/tiket-' + event.target.id + "?keyword="
				+ event.target.value, true);
		xhr.send();
	}
	//영화정보불러오기
	function getMovieInfo() {
		let xhr = new XMLHttpRequest();
		let tab1 = document.getElementById("Tab1");
		let tab2 = document.getElementById("Tab2");
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				for (var i = 0; i < json.result.length; i++) {

					let li = document.createElement('li');
					let ratingid = "";
					if (json.result[i].RATING == 'ALL') {
						ratingid = "ratingALL"
					} else if (json.result[i].RATING == '12') {
						ratingid = "rating12"
					} else if (json.result[i].RATING == '15') {
						ratingid = "rating15"
					}
					if (i < 10) {
						li.innerHTML = i + 1 + " ";
					}

					li.innerHTML += "<span id="+ratingid+" class='rating enone'>"
							+ json.result[i].RATING + "</span>"

					li.innerHTML += "<span class='enone'>"
							+ json.result[i].MOVIENAME + "</span>";
					li.id = json.result[i].MOVIECODE;
					li.onclick = function(event) {
						//버튼비활성화
						let nextpage = document.getElementById('nextpage');
						nextpage.disabled = true;
						nextpage.className = 'nextpage';
						resetArea();
						areas[0].className = "clickarea";
						let tab = document.getElementById("Tab1");
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

						let moviename = document.getElementById('movie-name');
						moviename.value = event.target.innerHTML;//영화이름
						moviename.style.color = "white";

						getTheaterName('서울', event.target.id);
						//포스터img그리기
						let posterdiv = document
								.getElementById("movieposterinfo");
						let movieimgname = document
								.getElementById('movieimgname');
						movieimgname.value = event.target.lastChild.value;
						let posterImg = document.getElementById('posterImg');
						posterImg.src = getContextPath()
								+ "/resources/images/movieupload/"
								+ event.target.lastChild.value;
						//배경에 img깔기
						posterdiv.style.backgroundImage = "url("
								+ getContextPath()
								+ "/resources/images/movieupload/"
								+ event.target.lastChild.value + ")";

						let movienamediv = document
								.getElementById("movie-name");

						let mn = document.getElementById('moviename');
						let mnh = document.getElementById('movienamehtml');
						mn.value = event.target.childNodes[2].innerText;
						if (event.target.parentNode.id == "Tab1") {
							movienamediv.innerHTML = event.target.innerHTML
									.substr(1);
							mnh.value = event.target.innerHTML.substr(1);

						} else {
							movienamediv.innerHTML = event.target.innerHTML;
							mnh.value = event.target.innerHTML;

						}

						//초기화
						let selectarea = document.getElementById("select-area");
						selectarea.style.color = 'white';
						selectarea.innerText = '극장을 선택해주세요';
						let selecttime = document.getElementById("select-time");
						selecttime.style.color = 'white';
						selecttime.innerText = '관람일시를 선택해주세요';
						let selectscreen = document
								.getElementById("select-screen");
						selectscreen.style.color = 'white';
						selectscreen.innerText = '';
						let selectscreentime = document
								.getElementById("select-screentime");
						selectscreentime.style.color = 'white';
						selectscreentime.innerText = '';
						//timediv 비활성화(초기화)
						let timesdiv = document.getElementById('timesdiv');
						if (!timesdiv.classList.contains('nonedisplay')) {
							timesdiv.className += " nonedisplay";
						}
						//관람일 가져오기
						getScreenTime(event.target.id, "");
					}

					let movieimg = document.createElement('input');
					movieimg.setAttribute("type", "hidden");
					movieimg.id = "movieimg";
					movieimg.value = json.result[i].MOVIEIMG;
					li.appendChild(movieimg);
					if (i < 10) {
						tab1.appendChild(li);
					} else {
						tab2.appendChild(li);
					}

				}
				checkparam();
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
						//버튼비활성화
						let nextpage = document.getElementById('nextpage');
						nextpage.disabled = true;
						nextpage.className = 'nextpage';
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
						//영화정보창에 정보 넣어주기
						let selectarea = document.getElementById('select-area');
						selectarea.innerText = event.target.innerText;
						selectarea.style.color = "white";
						//영화코드값 가져오기
						let mc = document.getElementById("moviecode");
						//timediv 비활성화(초기화)
						let timesdiv = document.getElementById('timesdiv');
						if (!timesdiv.classList.contains('nonedisplay')) {
							timesdiv.className += " nonedisplay";
						}
						//초기화
						let selecttime = document.getElementById("select-time");
						selecttime.innerText = '관람일시를 선택해주세요';
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
								//버튼비활성화
								let nextpage = document
										.getElementById('nextpage');
								nextpage.disabled = true;
								nextpage.className = 'nextpage';
								let timearea = document
										.getElementById('select-time');
								let day = new Date(event.target.id);
								timearea.innerText = event.target.id + ' ('
										+ weekday[day.getDay()] + ')';
								timearea.style.color = "white";
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
				let timesdiv = document.getElementById('timesdiv');
				timesdiv.classList.remove("nonedisplay");
				let div = document.getElementById('theater-info');
				let length = div.childNodes.length
				for (var i = 0; i < length; i++) {
					div.removeChild(div.lastChild);
				}
				for (var j = 0; j < json.screenName.length; j++) {

					let screendiv = document.createElement('div');
					screendiv.innerHTML = "<br><span id='screenName'>"
							+ json.screenName[j] + "</span>";
					let timediv = document.createElement('div');
					timediv.style.display = "flex";

					for (var i = 0; i < json.result.length; i++) {
						if (json.screenName[j] == json.result[i].name) {
							let infodiv = document.createElement('div');
							infodiv.innerText = json.result[i].starttime + "-"
									+ json.result[i].endtime;
							infodiv.id = json.result[i].timecode;
							infodiv.className = "screentime";

							infodiv.name = json.result[i].screencode;

							//상영관 이름 
							let nameinput = document.createElement('input');
							nameinput.setAttribute('type', 'hidden');
							nameinput.value = json.result[i].name;
							infodiv.appendChild(nameinput);
							//시간선택시
							infodiv.onclick = function(event) {
								//버튼활성화
								let nextpage = document
										.getElementById('nextpage');
								nextpage.disabled = false;
								nextpage.className += ' click';
								event.target.className += " clickli";
								let timecode = document
										.getElementById("timecode");
								timecode.value = event.target.id;
								//정보넣기
								let sc = document.getElementById("screencode");
								let st = document.getElementById("screentime");
								let sn = document.getElementById('screenname');
								sn.value = event.target.lastChild.value;
								sc.value = event.target.name;
								st.value = event.target.innerText;
								//정보넣기
								let timearea = document
										.getElementById('select-screentime');
								timearea.innerText = "/"
										+ event.target.innerText;
								//정보넣기
								let selectscreen = document
										.getElementById("select-screen");
								selectscreen.style.color = 'white';
								selectscreen.innerText = '/'
										+ event.target.lastChild.value;

							}
							timediv.appendChild(infodiv);
						}
					}
					div.appendChild(screendiv);
					div.appendChild(timediv);
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