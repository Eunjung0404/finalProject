<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자>스케쥴관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<style>
* {
	padding: 0;
	margin: 0;
}

.timetable {
	width: 100%;
}

.timetabletbody tr:hover {
	background-color: #212121;
	color: white;
}

.centerdisplay {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 100px;
}

.centerdiv {
	display: flex;
	justify-content: center;
	align-items: center;
}

.tablediv {
	margin-top: 10px;
	margin-left: 50px;
	margin-right: 50px;
	padding: 20px;
	height: 700px;
	border: 1px solid gray;
	border-radius: 10px;
	height: 700px;
}

.tablecss {
	margin-top: 10px;
}

.tablecss tr {
	border-bottom: 1px solid gray;
	margin-top: 10px;
}

.tablecss td {
	padding: 10px;
}

.menu {
	background-color: #212121;
	color: white;
	height: 64px;
	box-shadow: 10px 0px 10px gray;
	box-shadow:
}

.menu div {
	padding: 15px;
	font-size: 20px;
}

.movieselectdiv {
	width: 350px;
	height: 200px;
	position: absolute;
	background-color: white;
	border: 1px solid;
	overflow-y: scroll;
	overflow-x: hidden;
}

.movieselectdiv ul {
	list-style: none;
	padding: 0;
}

.movieselectdiv ul li {
	padding: 2px;
}

.modal-body td {
	padding: 5px;
}

.modal-body tr {
	padding: 20px;
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
</style>
</head>
<div class="row">
	<div class="col-12 ">
		<header>
			<div class="menu">
				<div>관리자 메뉴 &gt; 스케쥴관리</div>
			</div>
		</header>
	</div>
	<div class="col ">
		<div class="centerdisplay">
			<div class="tablediv">
				<span class="fw-bold fs-4 text-primary">상영작 관리</span>
				<div>

					<table class="tablecss" style="width: 600px;">

						<tr>
							<th>영화이름</th>
							<th>상영시작일</th>
							<th>상영종료일</th>
							<th>영화상태</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(movielist)>10 }">
								<c:forEach var="list" items="${movielist}">
									<tr>
										<td>${list.moviename }</td>
										<td><fmt:formatDate value="${list.startdate}"
												pattern="yy-MM-dd(E)" /></td>
										<td><fmt:formatDate value="${list.enddate}"
												pattern="yy-MM-dd(E)" /></td>
										<c:choose>
											<c:when test="${list.state eq '1'}">
												<td>상영중</td>
											</c:when>
											<c:when test="${list.state eq '2'}">
												<td>상영예정</td>
											</c:when>
											<c:when test="${list.state eq '3'}">
												<td>임시등록</td>
											</c:when>
											<c:when test="${list.state eq '0'}">
												<td>상영종료</td>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

									</tr>
								</c:forEach>

							</c:when>
							<c:otherwise>
								<c:forEach var="list" items="${movielist}">
									<tr>
										<td>${list.moviename }</td>
										<td><fmt:formatDate value="${list.startdate}"
												pattern="yy-MM-dd(E)" /></td>
										<td><fmt:formatDate value="${list.enddate}"
												pattern="yy-MM-dd(E)" /></td>
										<c:choose>
											<c:when test="${list.state eq '1'}">
												<td>상영중</td>
											</c:when>
											<c:when test="${list.state eq '2'}">
												<td>상영예정</td>
											</c:when>
											<c:when test="${list.state eq '3'}">
												<td>임시등록</td>
											</c:when>
											<c:when test="${list.state eq '0'}">
												<td>상영종료</td>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

									</tr>
								</c:forEach>
								<c:forEach var="i" begin="0" end="${9-fn:length(movielist)}">
									<tr>
										<td colspan="4" style="text-align: center;">-</td>
									</tr>
								</c:forEach>

							</c:otherwise>

						</c:choose>



						<tr>
							<td colspan="3" style="text-align: right;">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary"
									onclick="Openmodal('addmoviemodal')">상영작 추가</button>
							</td>
							<td>
								<button type="button" class="btn btn-primary" onclick="">상영작
									삭제</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="tablediv">
				<span class="fw-bold fs-4 text-primary">상영관 관리</span>
				<div>

					<table class="tablecss" style="width: 400px;">
						<tr>
							<th>상영관이름</th>
							<th>상태</th>
						</tr>
						<c:choose>
							<c:when test="${fn:length(screenlist)>10}">
								<c:forEach var="vo" items="${screenlist}">
									<tr onclick="createSeat(${vo.screencode}, 'screen-time')">
										<td>${vo.name }</td>
										<td>${vo.state }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="vo" items="${screenlist}">
									<tr onclick="createSeat(${vo.screencode}, 'screen-time')">
										<td>${vo.name }</td>
										<td>${vo.state }</td>
									</tr>
								</c:forEach>
								<c:forEach var="i" begin="0" end="${9-fn:length(screenlist)}">
									<tr>
										<td colspan="2" style="text-align: center;">-</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row" style="height: 100px;"></div>


<!-- Modal -->
<div class="modal fade show" tabindex="-1"
	aria-labelledby="exampleModalLiveLabel"
	style="display: none; top: 200px;" aria-hidden="true"
	id="addmoviemodal">
	<div class="modal-dialog" style="box-shadow: 0px 3px 5px grey;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLiveLabel">상영작 추가</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close" onclick="closemodal('addmoviemodal')"></button>
			</div>
			<div class="modal-body">
				<table>
					<tr>
						<td><span>영화이름</span></td>
						<td><div
								style="border: 1px solid; border-radius: 2px; width: 350px;"
								onclick="activeSelectDiv('selectDiv')" id="inputdiv">영화 선택</div>
							<div class="movieselectdiv" id="selectDiv" style="display: none;">
								<ul>
									<c:forEach var="vo" items="${Cmovielist}">
										<li id="${vo.moviecode }"
											onmouseenter="chageClassEnter(event)"
											onmouseout="chageClassOut(event)"
											onclick="moviesSelectEvent(event,'inputdiv','selectDiv','moviecode-movie')">${vo.moviename }</li>
									</c:forEach>

								</ul>
							</div></td>
					</tr>
					<tr>
						<td><span>상영시작일</span></td>
						<td><input type="date" id="startdate"
							onchange="inputhidden(event,'startdate-movie')"></td>
					</tr>

					<tr>
						<td><span>상영종료일</span></td>
						<td><input type="date" id="enddate"
							onchange="inputhidden(event,'enddate-movie')"></td>
					</tr>

					<tr>
						<td><span>상태</span></td>
						<td><select onchange="inputhidden(event,'state-movie')">

								<option value="1">상영중</option>
								<option value="2">상영예정</option>
								<option value="3">임시등록</option>

						</select></td>
					</tr>

				</table>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					onclick="closemodal('addmoviemodal')">Close</button>
				<form:form method="post"
					action="${pageContext.request.contextPath}/admin/schedule/${theatername }/movieadd"
					id="insertMovieForm">
					<!-- 영화코드 -->
					<input type="hidden" value="" name="moviecode" id="moviecode-movie">
					<!-- 상영시작일 -->
					<input type="hidden" value="" name="startdate" id="startdate-movie">
					<!-- 상영종료일 -->
					<input type="hidden" value="" name="enddate" id="enddate-movie">
					<!-- 상태 -->
					<input type="hidden" value="" name="state" id="state-movie">
					<button type="button" class="btn btn-primary"
						onclick="submitbtn()">Save</button>
				</form:form>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade show" tabindex="-1"
	aria-labelledby="exampleModalLiveLabel" style="display: none;"
	aria-hidden="true" id="screen-time">
	<div class="modal-dialog modal-lg"
		style="box-shadow: 0px 3px 5px grey;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLiveLabel">
					상영 스케줄 추가 > <span id="screen-name-span">상영관이름</span>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close" onclick="closemodal('screen-time')"></button>
			</div>
			<div class="modal-body">
				<div id="seatdiv">
					<div class="centerdiv">

						<div id="seat-area">
							<img src="/finalproject/resources/images/icon/screen.jpg"
								alt="스크린" style="width: 100%;">
							<div class="centerdiv">
								<div id="seat"
									style="width: auto; padding: 50px; position: relative;"></div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<span>스케쥴 관리</span>
				</div>
				<table id="timetable" class="timetable">
					<tr>
						<td colspan="5"></td>
					</tr>
					<tr>
						<th>상영영화</th>
						<th>시작시간</th>
						<th>종료시간</th>
						<th>상영종류</th>
						<th>상영일</th>
						<th>상태</th>
					</tr>
					<tbody id="timetable-data" class='timetabletbody'>

					</tbody>

				</table>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					onclick="closemodal('screen-time')">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="Openmodal('addschedulemodal')">ADD</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade show" tabindex="-1"
	aria-labelledby="exampleModalLiveLabel"
	style="display: none; top: 200px;" aria-hidden="true"
	id="addschedulemodal">
	<div class="modal-dialog" style="box-shadow: 0px 3px 5px grey;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLiveLabel">스케줄 추가</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close" onclick="closemodal('addschedulemodal')"></button>
			</div>
			<div class="modal-body">

				<table>
					<tr>
						<td><span>영화이름</span></td>
						<td><div
								style="border: 1px solid; border-radius: 2px; width: 350px;"
								onclick="activeSelectDiv('selectDiv2')" id="inputdiv2">영화
								선택</div>
							<div class="movieselectdiv" id="selectDiv2"
								style="display: none;">
								<ul id="modal-3">
									<c:forEach var="vo" items="${movielist}">
										<li id="${vo.moviecode }"
											onmouseenter="chageClassEnter(event)"
											onmouseout="chageClassOut(event)"
											onclick="moviesSelectEvent(event,'inputdiv2','selectDiv2','moviecode-hidden')">${vo.moviename }</li>
									</c:forEach>

								</ul>
							</div></td>
					</tr>
					<tr>
						<td><span>상영시작시간</span></td>
						<td><input type="time" id="starttime"
							onchange="inputhidden(event,'starttime-hidden')">></td>
					</tr>
					<tr>
						<td><span>상영종료시간</span></td>
						<td><input type="time" id="endtime"
							onchange="inputhidden(event,'endtime-hidden')">></td>
					</tr>
					<tr>
						<td><span>상영일</span></td>
						<td><input type="date" id="screendate"
							onchange="inputhidden(event,'screendate-hidden')"></td>
					</tr>


					<tr>
						<td><span>이벤트</span></td>
						<td><input type="text" id="event"
							onkeyup="inputhidden(event,'event-hidden')"></td>
					</tr>
					<tr>
						<td><span>상태</span></td>
						<td><select onclick="inputhidden(event,'state-hidden')">

								<option value="0">선택</option>
								<option value="1">상영중</option>
								<option value="2">상영예정</option>

						</select></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					onclick="closemodal('addschedulemodal')">Close</button>
				<form:form method="post"
					action="${pageContext.request.contextPath}/admin/schedule/${theatername }/insert"
					id="insertTimeForm">
					<input type="hidden" name="screencode" value=""
						id="screencode-hidden">
					<input type="hidden" name="moviecode" value=""
						id="moviecode-hidden">
					<input type="hidden" name="starttime" value=""
						id="starttime-hidden">
					<input type="hidden" name="endtime" value="" id="endtime-hidden">
					<input type="hidden" name="screendate" value=""
						id="screendate-hidden">
					<input type="hidden" name="state" value="" id="state-hidden">
					<input type="hidden" name="event" value="" id="event-hidden">
					<button type="button" class="btn btn-primary"
						onclick="submitinsertTimebtn()">Save</button>
				</form:form>
			</div>
		</div>
	</div>
</div>


</html>
<script type="text/javascript">

	var today = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
	window.onload = function() {
		setdatemin();

	}
	function submitbtn() {
		let moviecode=	document.getElementById('moviecode-movie');
		if(moviecode.value==''||moviecode.value==null)
		{
		alert("상영작을 선택해주세요.");
		return false;
		}
		let startdate=document.getElementById('startdate-movie');
		if(startdate.value==''||startdate.value==null)
		{
		alert("상영시작일을 선택해주세요");
		return false;
		}
		let enddate=document.getElementById('enddate-movie');
		if(enddate.value==''||enddate.value==null)
		{
		alert("상영종료일을 선택해주세요");
		return false;
		}
		let state=document.getElementById('state-movie');
		if(state.value==''||state.value==null ||state.value== '선택')
		{
		alert("상태를 선택해주세요");
		return false;
		}
		
		document.getElementById('insertMovieForm').submit();
	}
	
	function submitinsertTimebtn() {
		let screencode=	document.getElementById('screencode-hidden');
		if(screencode.value==''||screencode.value==null)
			{
			alert("상영관 정보가 누락되었습니다.");
			return false;
			}
		let moviecode=	document.getElementById('moviecode-hidden');
		if(moviecode.value==''||moviecode.value==null)
			{
			alert("상영작을 선택해주세요.");
			return false;
			}
		let starttime=document.getElementById('starttime-hidden');
		let endtime=document.getElementById('endtime-hidden');
		if(starttime.value==''||starttime.value==null)
			{
			alert("상영시작시간을 선택해주세요");
			return false;
			}
		if(endtime.value==''||endtime.value==null)
		{
		alert("상영종료시간을 선택해주세요");
		return false;
		}
		if(parseInt(starttime.value.substr(0, 2))>parseInt(endtime.value.substr(0, 2)))
		{
		alert("상영시작시간보다 상영종료시간이 이릅니다.");
		return false;
		}
		let screendate=document.getElementById('screendate-hidden');
		if(screendate.value==''||screendate.value==null)
		{
		alert("상영일을 선택해주세요");
		return false;
		}
		let state=document.getElementById('state-hidden');
		if(state.value==''||state.value==null)
		{
		alert("상태를 선택해주세요");
		return false;
		}
		let event=document.getElementById('event-hidden');
		if(event.value==''||event.value==null)
		{
		alert("이벤트 타입을 입력해주세요");
		return false;
		}
		document.getElementById('insertTimeForm').submit();
	}
	function chageClassEnter(event) {
		event.target.className += " bg-primary text-white";
	}
	function chageClassOut(event) {
		event.target.className = "";
	}
	function setdatemin() {
		let startdate = document.getElementById("startdate");
		startdate.min = today;
		let enddate = document.getElementById("enddate");
		enddate.min = today;
		let screendate = document.getElementById("screendate");
		screendate.min = today;
	}
	//선택창 활성화
	function activeSelectDiv(id) {
		let selectDiv = document.getElementById(id);
		selectDiv.style.display = "block";
	}
	//값넣기
	function inputhidden(event,id) {
		let hidden=document.getElementById(id);
		hidden.value=event.target.value;
	}
	function inputhiddenID(event,id) {
		let hidden=document.getElementById(id);
		hidden.value=event.target.id;
	}
	
	//영화 선택 이벤트
	function moviesSelectEvent(event,id,id2,id3) {
		inputhiddenID(event,id3)
		let inputdiv = document.getElementById(id);
		inputdiv.innerText = event.target.innerText;
		event.target.className = " bg-primary text-white";
		let selectDiv = document.getElementById(id2);
		selectDiv.style.display = "none";
	}
	//모달창 띄우기
	function Openmodal(id) {

		document.getElementById(id).style.display = "block";

	}
	//모달창 닫기
	function closemodal(id) {

		document.getElementById(id).style.display = "none";

	}
	
	function cleanseatdiv() {
		let seatArea = document.getElementById("seat");
		while ( seatArea.hasChildNodes() ) 
		{ seatArea.removeChild( seatArea.firstChild ); }
		let timetable=document.getElementById("timetable-data");
		for (var i = timetable.rows.length; i >= 0; i--) {
			//console.log(timetable.rows.length);
			timetable.deleteRow(timetable.rows.length - 1);

		}

	}
	
	function createSeat(screencode, id) {
		let hidden=document.getElementById('screencode-hidden');
		hidden.value=screencode;
		let seatcount = 0;
		getScreenTime(screencode, id);
		Openmodal(id);
		cleanseatdiv();
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
					span.innerText = json.list[seatcount].code.substr(0, 1);
					span.className = 'seat-position';
					//span.style.top = movetop;
					span.style.left = "0px";
					seatArea.appendChild(span);

					for (var j = 0; j < col; j++) {

						let div = document.createElement("div");

						//이쪽은 열띄어쓰기
						if (json.list[seatcount].state != 0) {

							let hiddeninput = document.createElement("input");
							let spanseat = document.createElement("span");
							hiddeninput.setAttribute('type', 'hidden');
							hiddeninput.value = json.list[seatcount].seatcode;
							hiddeninput.id=json.list[seatcount].seatcode;
							div.className = "seat-list";
							div.id = json.list[seatcount].code;
							if (j + 1 < 10) {
								spanseat.innerText = div.id.substr(1, 2);

							} else {
								spanseat.innerText = div.id.substr(1, 2);

							}
							div.appendChild(spanseat);
							div.appendChild(hiddeninput);
							
						} else {
							div.className = "blank";
							
						}

						seatcount++;
						div.style.left = 0 + moveleft + "px";
						seatArea.style.width=0 + moveleft + "px";
						seatArea.appendChild(div);
						moveleft += 28;

					}
					seatArea.innerHTML += "<br>";
					movetop += 20;

				}
				
			}

		}
		xhr.open('get', '/finalproject/admin/schedule/seat-list?screencode='
				+ screencode, true);
		xhr.send();

	}
	
	//시간가져오기
	function getScreenTime(screencode, id) {
	
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				let a=json.timelist[0];
				let timetable=document.getElementById("timetable-data");
				for(var i=0;i<json.timelist.length;i++)
					{
					
					let tr=document.createElement("tr");
					tr.id=json.timelist[i].timecode;
					let td=document.createElement("td");
					td.innerText=json.movienamelist[i];
					tr.onclick=function(event)
					{
						resetseat();
						getseatinfo(event.target.parentNode.id);
					}
					tr.appendChild(td);
					for(key in json.timelist[i])  {
						if(key=='starttime')
						{
							let tdj=document.createElement("td");
							tdj.innerText=json.timelist[i][key];
							tr.appendChild(tdj);
						}
						else if(key=='endtime')
						{
							let tdj=document.createElement("td");
							tdj.innerText=json.timelist[i][key];
							tr.appendChild(tdj);
						}
						else if(key=='event')
						{
							let tdj=document.createElement("td");
							tdj.innerText=json.timelist[i][key];
							tr.appendChild(tdj);
						}
						else if(key=='screendate')
						{
							let tdj=document.createElement("td");
							tdj.innerText=json.timelist[i][key];
							tr.appendChild(tdj);
						}
						else if(key=='state')
						{
							let tdj=document.createElement("td");
							if(json.timelist[i][key]==0 || json.timelist[i][key]==null)
								{
								tdj.innerText='상영완료';
								}
							else if(json.timelist[i][key]==1)
							{
							tdj.innerText='상영중';
							}
							else if(json.timelist[i][key]==2)
							{
							tdj.innerText='상영예정';
							}
							tr.appendChild(tdj);
						}
					
					}
					
					timetable.appendChild(tr);
					}
				
			}

		}
		xhr.open('get', '/finalproject/admin/schedule/time?screencode='
				+ screencode, true);
		xhr.send();

	}

	function resetseat()
	{
		
		
		let seatArea = document.getElementById("seat");
		let divs = seatArea.getElementsByTagName("div");

		for (var z = 0; z < divs.length; z++) {
			if (divs[z].classList.contains('book')) {
			

				if (z+ 1 < 10) {
					divs[z].firstChild.innerText = divs[z].id.substr(1, 2);
					divs[z].classList.remove("book");

				} else {
					divs[z].firstChild.innerText = divs[z].id.substr(1, 2);
					divs[z].classList.remove("book");

				}

			}
		}
	
	}
	function getseatinfo(timecode) {
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				
				for(var i=0;i<json.seatinfolist.length; i++)
				{
					if(json.seatinfolist[i].state==1)
						{
						let seatinput=document.getElementById(json.seatinfolist[i].seatcode);
						
						seatinput.parentNode.className+=" book";
						seatinput.parentNode.firstChild.innerText="";
						}
					
				}
				
			}

		}
		xhr.open('get', '/finalproject/admin/schedule/seatinfo-list?timecode='
				+ timecode, true);
		xhr.send();

	}
	
	
</script>

