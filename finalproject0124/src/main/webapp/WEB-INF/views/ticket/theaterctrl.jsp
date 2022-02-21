<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.centerdisplay {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 100px;
}

.tablediv {
	padding: 50px;
}

.tablecss {
	border: 1px solid;
	width: 500px;
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
				<span>상영영화 관리</span>
				<div>

					<table class="tablecss">

						<tr>
							<th>영화이름</th>
							<th>상영시작일</th>
							<th>상영종료일</th>
							<th>영화상태</th>
						</tr>

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



						<tr>
							<td>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary"
									onclick="Openmodal('addmoviemodal')">상영작 추가</button>
							</td>
							<td>상영영화삭제</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="tablediv">
				<span>상영관관리</span>
				<div>

					<table class="tablecss">
						<tr>
							<th>상영관이름</th>
							<th>상태</th>
						</tr>

						<c:forEach var="vo" items="${screenlist}">
							<tr onclick="Openmodal('screen-time')">
								<td>${vo.name }</td>
								<td>${vo.state }</td>
							</tr>
						</c:forEach>
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
								onclick="activeSelectDiv()" id="inputdiv">영화 선택</div>
							<div class="movieselectdiv" id="selectDiv" style="display: none;">
								<ul>
									<c:forEach var="vo" items="${Cmovielist}">
										<li id="${vo.moviecode }"
											onmouseenter="chageClassEnter(event)"
											onmouseout="chageClassOut(event)"
											onclick="moviesSelectEvent(event)">${vo.moviename }</li>
									</c:forEach>

								</ul>
							</div></td>
					</tr>
					<tr>
						<td><span>상영시작일</span></td>
						<td><input type="date" id="startdate"></td>
					</tr>

					<tr>
						<td><span>상영종료일</span></td>
						<td><input type="date" id="enddate"></td>
					</tr>

					<tr>
						<td><span>상태</span></td>
						<td><select>

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
				<button type="button" class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade show" tabindex="-1"
	aria-labelledby="exampleModalLiveLabel"
	style="display: none; top: 200px;" aria-hidden="true" id="screen-time">
	<div class="modal-dialog modal-lg" style="box-shadow: 0px 3px 5px grey;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLiveLabel">상영 스케줄 추가 > <span id="screen-name-span">상영관이름</span></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close" onclick="closemodal('screen-time')"></button>
			</div>
			<div class="modal-body">
				<div id="seatdiv">
					<div>

						<div id="seat-area" class="centerTopPosition">
							<img src="/finalproject/resources/images/icon/screen.jpg"
								alt="스크린" style="width: 100%;">
							<div id="seat" style="width: 100%; padding: 50px;"></div>
						</div>
					</div>
				</div>
				<table>


				</table>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					onclick="closemodal('screen-time')">Close</button>
				<button type="button" class="btn btn-primary">Save</button>
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
	}
	function activeSelectDiv() {
		let selectDiv = document.getElementById("selectDiv");
		selectDiv.style.display = "block";
	}
	function moviesSelectEvent(event) {
		let inputdiv = document.getElementById("inputdiv");
		inputdiv.innerText = event.target.innerText;
		event.target.className = " bg-primary text-white";
		let selectDiv = document.getElementById("selectDiv");
		selectDiv.style.display = "none";
	}
	function Openmodal(id) {

		document.getElementById(id).style.display = "block";

	}
	function closemodal(id) {

		document.getElementById(id).style.display = "none";

	}
</script>

