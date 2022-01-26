<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.nonePadding {
	padding: 0px;
}
</style>

<div class="row ">
	<!-- 영화선택창 -->
	<div class="col-3 nonePadding"
		style="margin-left: 250px; margin-top: 100px;">
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
			<div
				style="float: left; width: 100px; border: 1px solid gray; height: 95%;">
				<ul>
					<li><a href="">서울</a></li>
					<li><a href="">경기</a></li>
				</ul>

			</div>

			<div
				style="float: left; width: 320px; border: 1px solid gray; height: 95%;">
				<ul>
					<li><a href="">강남구</a></li>
					<li><a href="">종로구..등등</a></li>
				</ul>

			</div>
		</div>
	</div>

	<!-- 관람일 선택 -->
	<div class="col-2 nonePadding" style="margin-top: 100px">

		관람일 선택

		<div id="Calendar"
			style="width: 250px; height: 300px; border: 1px solid gray; height: 500px;">
			<span id="text-year">2022</span>
			<p>
				<span id="text-month">2</span>
			</p>
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
	var month = parseInt(document.getElementById("text-month").innerText)-1;
	var year = document.getElementById("text-year").innerText;
	var table = document.getElementById("daytable");
	var thead = document.getElementById("day");
	var tr = table.getElementsByTagName("tr");
	var th = tr[0].getElementsByTagName("th").length;
	var tbody = document.getElementById("week");

	//로드 될때 달력그리기.
	window.onload = function() {

		drawCerrentCalendar(year,month);

	}
	//이전달 달력그리기
	function drawprevCalendar(year,month) {
		
	}
	//현재달의달력그리기
	function drawCerrentCalendar(year,month) {
		let date = new Date(year, month);
		let getyear = date.getFullYear();

		let getMonth = date.getMonth() + 1;
		let getstartday = date.getDay();

		var getlastday = getLastday(getyear, getMonth, getstartday);
		console.log("월:"+getMonth);
		console.log("시작일:"+getstartday);
		console.log("끝일:"+getlastday);
		//table tr/td생성
		for (var i = 0; i < 6; i++) {
			//tr생성
			var trweek = document.createElement("tr");
			trweek.id = "week" + i;
			tbody.appendChild(trweek);
			console.log(trweek.id);
			for (var j = 0; j < 7; j++) {
				//td생성
				var tdDate = document.createElement("td");
				tdDate.className = "date";
				document.getElementById("week" + i).appendChild(tdDate);
				if (j == getstartday) {

					tdDate.innerText = date.getDate();
					//날짜 ++
					if (date.getDate() < getlastday) {
						date.setDate(date.getDate() + 1);
						getstartday = date.getDay();

					} else {

						return;
					}

				}

			}

		}
	}
	//다음달달력그리기
	//이전달 달력그리기
	function drawnextCalendar(year,month) {
		
	}
	//마지막 일수 가져오기 
	function getLastday(year, month, startday) {
		let lastdays = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		let lastdays2 = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
			console.log("윤년!");
			return lastdays2[month - 1];
		} else {

			return lastdays[month - 1];
		}
	}
</script>