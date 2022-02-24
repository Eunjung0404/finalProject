\<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style>

div #textBox {
	position: relative;
	padding-left: 0px;
	padding-top: 50px;
	padding-right: 100px;
	padding-bottom: 50px;
	padding-top: 0px;
	margin: 0 auto;
	text-align: center;
}


#btn1 {
	border: 0;
	color: #fff;
	background-color: #503396;
	height: 46px;
	padding: 0 30px;
	border-radius: 4px;
	margin-right: 10px;
}

#btn2 {
	border-width: 0.5px;
	border-color: #503396;
	color: #503396;
	background-color: #fff;
	height: 46px;
	padding: 0 30px;
	border-radius: 4px;
}
#ticketCancle {
	border: 0;
	color: #fff;
	background-color: #503396;
	height: 46px;
	padding: 0 30px;
	border-radius: 4px;
	margin-right: 10px;
	float: right;
}

.w3-teal {
	background-color: #503396;
	color: #fff!important;
}

.w3-table tr {
	width: 100%;
}
.w3-table th td {
	width: 20%;
}

ul.pagination {
	padding-left: 160%;
	margin-top: 50px;
}

/* 문의사항 상세보기 */
.input-textarea.view {
	color: #000!important;
	background-color: #fff;
	height: 330px;
}
.input-textarea {
 padding: 10px;
 
}
h3 {
	padding-top: 3%;
}
#pageNum {
	text-align: center;
}

table#ticketList {
	width: 75%;
	padding-top: 5%;
}

a#detailQuestion:hover {
	color: #8041D9;
}
div#review {
	padding-top: 3%;
}
table#searchTable {
	width: 100%;
}
span#star_span{
	color: #503396;
}
div#mySidebar{
	text-decoration: none;
}
div#mySidebar a:hover {
	color: red;
	text-decoration: none;
}
div#mySidebar a:active {
	color: red;
	background-color: red;
}
div#ticketingShow{
	margin-bottom: 50px;
    width: 500px;
   	height: 300px;
    padding-left: 20px;
    padding-top: 10px;
    margin-left: 10%;
}

</style>

<%-- <%
Cookie[] cookies = request.getCookies();
String id = "";
for (Cookie c : cookies) {
	String name = c.getName();
	if (name.equals("mid")) {
		id = c.getValue();
	}
}
%> --%>


<input type="hidden" value="${getMid }" id="idData">

<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large"
  onclick="w3_close()">Close &times;</button>
  <a type="button" id="ticketHistoryBtn" class="w3-bar-item w3-button" >예매 및 취소 내역</a>
  <a type="button" id="reviewBtn" class="w3-bar-item w3-button" >나의 평점 모아보기</a>
  <a type="button" id="questionBtn" class="w3-bar-item w3-button" >나의 문의내역</a>
  <a type="button" id="changeInfoBtn" class="w3-bar-item w3-button"  >개인정보 수정</a>
</div>

<div id="main">

<div class="w3-teal" >
  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
  <div class="w3-container">
    <h1>My Page</h1>
  </div>
</div>
</div>  

<div id="textBox" style="display: none;">
	<hr>
	<a id="title2"><strong>회원님의 개인정보 보호를 위해 비밀번호를 입력하셔야 합니다.</strong></a><br>
	<br> <a id="title3">로그인 시 사용하시는 비밀번호를 입력해주세요.</a><br><br>
	<form:form name="pwdForm" id="pwdForm" action="${cp}/member/doMyinfo"
		onsubmit="return">
		<input type="password" name="mpwd" id="mpwd"
			placeholder="비밀번호를 입력해주세요."
			style="height: 50px; width: 400px; text-align: center" maxlength="16">
		<br>
	</form:form>
	<hr>
	<button type="button" id="btn1" style="text-align: center">확인</button>
	<button type="button" id="btn2" style="text-align: center">취소</button>
</div>




<div class="w3-container" id="questionTable" style="display: none;">
<h3><strong>나의 문의내역</strong></h3>
<input type="button" value="1:1 문의하기" id="qnaBtn" style="margin-left: 65%; background-color: #FFFFFF; border-width: 1px; border-radius: 4px; height: 40px; border-color: #503396; color: #503396;">
<div id="search" >
	<form:form id="keywordForm" >
	<select name="field" style="margin-left: 55%; height: 40px; margin-right: 1%; border-radius: 4px; width: 70px; text-align: center;">
		<option>전체</option>
		<option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
		<option value="regdate" <c:if test="${field=='regdate'}">selected</c:if>>작성일</option>
	</select>
	<input type="text" name="keyword" placeholder="검색어를 입력해주세요." style="border: 0.1px solid gray; margin-left: 0%; margin-top: 1%; height: 40px; border-radius: 4px;">
	<input type="hidden" name="mid" value="${getMid }">
	<button	type="button" style="border-style: solid; border-width: 0px; background-color: white;" >
		<span class="material-icons-outlined" id="searchBtn"
					style="color: gray; font-size: 30px;">search</span>
	</button>
	</form:form>
</div>
<hr>
  <table class="w3-table" id="question" >
  </table>
  
<!--   <table class="w3-table" id="detail"> -->
<!--   </table> -->
  <div id="pagination">
  </div>
</div>

<div class="" id="detail">

</div>

<div id="reviewList">
</div>

<div class="container mt-3" id="ticketingList" style="display: none; margin-bottom: 10%;">
</div>

<div id="searchShow">

</div>

<form:form id="idDataFrom">
	<input type="hidden" value="${getMid }" id="idData" name="mid">
	<input type="hidden" name='qnacode' id="qnacode">
</form:form>


<script>
	
	let ticketingBtn = document.getElementById("ticketingBtn");
	let reviewBtn = document.getElementById('reviewBtn');
	let questionBtn = document.getElementById("questionBtn");
	let changeInfoBtn = document.getElementById('changeInfoBtn');
	
	function w3_open() {
		document.getElementById("main").style.marginLeft = "25%";
		document.getElementById("questionTable").style.marginLeft = "25%";
		document.getElementById("searchShow").style.marginLeft = "25%";
		document.getElementById("detail").style.marginLeft = "25%";
		document.getElementById("textBox").style.marginLeft = "15%";
		document.getElementById("reviewList").style.marginLeft = "25%";
		document.getElementById("ticketingList").style.marginLeft = "25%";
		document.getElementById("mySidebar").style.width = "25%";
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("openNav").style.display = 'none';
	}
	function w3_close() {
		document.getElementById("main").style.marginLeft = "0%";
		document.getElementById("questionTable").style.marginLeft = "3%";
		document.getElementById("searchShow").style.marginLeft = "3%";
		document.getElementById("textBox").style.marginLeft = "0%";
		document.getElementById("reviewList").style.marginLeft = "3%";
		document.getElementById("ticketingList").style.marginLeft = "0%";
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("openNav").style.display = "inline-block";
		$("#questionTable").empty();
		$("#detail").empty();
		$("#reviewList").empty();						// 리뷰내역 페이지 숨김
		$("#textBox").hide();				// 개인정보 변경 비밀번호 입력 페이지 숨김
		$("#ticketingList").empty();
		$("#searchShow").empty();
	}

	
	// QnA 상세 보기
// 	let idForm = $("#idDataFrom").serialize();
	//.log(data.qnacode);
	function detailQuesion(qnacode,id){
		$("#question").empty();
		$.ajax({
			url: "${cp}/member/detailQuestion",
			data:{"qnacode":qnacode,"mid": id},
			type: "GET",
			dataType: "JSON",
			success: function(data){
				let output = "";
				output += "<div id='detail'><a>" + data.mname + "</a><span>" + " | " + "</span><a>" + data.mphone + "</a><span>" + " | " + "</span><a>" + data.memail
						+ "</a><span>" + " | " + "</span>" + data.regdate + "</a><br>";
				output += "<hr>";
				output += "</div>";
				output += "<div id='cont'>";
				output += "<textarea rows='5' cols='100' style='border:none;' id='inqCn' readonly='readonly'>" + data.content + "</textarea>";
				output += "</div>";
				$("#detail").append(output);
			}, error: function(){
				console.log("문의내역 상세정보 받아오기 실패!");
			}
		});
	}

	// 회원 정보 변경을 하기 위해서 비밀번호 확인을 한 번 더 요청
	$("#changeInfoBtn").on("click", function(){
		$("#textBox").show();
		$("#questionTable").hide();
		$("#reviewList").empty();
		$("#detail").empty();
		$("#ticketingList").empty();
		$("#searchShow").empty();
	});
	
	$("#btn1").click(function() {
		let form1 = $("#pwdForm").serialize();
		$.ajax({
			url : "${cp}/member/pwdVali",
			type : "POST",
			data : form1,
			dataType : "JSON",
			success : function(data) {
				if (data == 0) {
					alert("비밀번호가 일치하지 않습니다.");
				} else {
					document.pwdForm.submit(); // 비밀번호가 일치하면 나의 정보 페이지로 이동
				}
			}
		});
	});
	
// 	문의내역 결과물 출력
	function page(pageNum) {
		let id = $("#idData").val();
		$("#question").empty();
		$.ajax({
			url : "${cp}/member/question",
			type : "post",
			data: {"mid": id,pageNum:pageNum},
			dataType : "JSON",
			success : function(data) {
				let output = '';
				let search = '';
				output += '<thead>';
				output += '<tr>';
				output += '<th style="width: 20%;">글번호</th><th>제목</th><th>작성일</th>';
				output += '</tr>';
				output += '</thead>';
				
				for (let i = 0; i < data.list.length; i++) {
					let id= data.list[i].mid;
			
					output += '<tbody>';
					output += '<tr>';
					output += "<td>" + data.list[i].qnacode +"</td><td><a type='button' id='detailQuestion' onclick='detailQuesion("+ data.list[i].qnacode +",\""+ id +"\")'>"
					+ data.list[i].title + "</a></td><td>"
					+ data.list[i].regdate + "</td>";

					output += '</tr>';
					output += '</tbody>';
					}
					// 페이징 처리
					let startPage = data.startPageNum;
					let endPage = data.endPageNum;
					let pageCount = data.pageCount;
					let pagination = "";
					
					pagination += "<ul class='pagination'>";
 					if (startPage > 10) {
 						pagination += "<li class='page-item'><a class='page-link' id='pageNum' href='javascript:page(" + (startPage-1) + ")' >&laquo;</a>'";
 					}
 					for (let i = startPage; i <= endPage; i++) {
 						if (i == pageNum) {
							
 							pagination += "<li class='page-item active'><a class='page-link' id='pageNum' href='javascript:page(" + i + ")'>" + i + "</a>";
 						} else {
 							pagination += "<li class='page-item'><a class='page-link' id='pageNum' href='javascript:page(" + i + ")'>" + i + "</a>";
 						}
 					}
 					if (endPage < data.pageCount) {
 						pagination += "<li class='page-item'><a class='page-link' id='pageNum' href='javascript:page(" + (endPage+1) + ")'>&raquo;</a>";
 					}
 					pagination += "</ul>";
 					
 					$("#question").append(output);					// 문의내역 테이블 정보 출력
 					$("#question").append(pagination);			// 페이징 정보 출력
			}, error: function(){
				console.log("문의내역 불러오기 실패");
			}
		});
	}

	$("#questionBtn").click(function(e) {
		$("#question").empty();
		page(1); // 문의내역 페이지 출력
		$("#questionTable").show();
		$("#pageShow").show();
		$("#detail").empty();
		$("#reviewList").empty();						// 리뷰내역 페이지 숨김
		$("#textBox").hide();				// 개인정보 변경 비밀번호 입력 페이지 숨김
		$("#ticketingList").empty();			// 예매내역 페이지 숨김
		$("#searchShow").empty();
	});
	
	// 	리뷰 내역 결과 출력하기
	function reviewPage(pageNum) {
		let id = document.getElementById("idData").value;
		console.log("reviewPage" + pageNum);
		$.ajax({
			url: "${cp}/member/myreview",
			type: "GET",
			dataType: "JSON",
			data: {"mid": id, pageNum:pageNum},
			success: function(data){
				$("#reviewList").empty();
				console.log(data.reviewList);
				let output = "";
				
				for(let i=0; i < data.reviewList.length; i++) {
					output += "<div id='review'>"; 
					output += "<a style='font-size: 20px;'><strong>" + data.reviewList[i].moviename + "</strong></a><br>" + "<a>평점: </a>";
					for(let j=0; j < data.reviewList[i].score; j++) {
						output += "<span id='star_span'>" + '★' + "</span>";
					}
					output += "<br>" + data.reviewList[i].comments + "<br>";
					output += data.reviewList[i].mid + " | " + data.reviewList[i].regdate;
					output += "</div>";
					output += "<hr>";
				}
				
				// 페이징 처리
				let startPage = data.startPageNum;
				let endPage = data.endPageNum;
				let pageCount = data.pageCount;
				let rowBlockCount = data.rowBlockCount;
				let pagination = ""
				console.log(startPage, endPage, pageCount, rowBlockCount);
				pagination += "<div class='w3-center'>";
					if (startPage > 5) {
						pagination += "<a class='w3-bar-item w3-button' id='pageNum' href='javascript:reviewPage(" + (startPage-1) + ")' >&laquo;</a>'";
					}
					for (let i = startPage; i <= endPage; i++) {
						if (i == pageNum) {
							pagination += "<div class='w3-bar'>";
							pagination += "<a class='w3-button' id='pageNum' href='javascript:reviewPage(" + i + ")'>" + i + "</a>";
							pagination += "</div>";
						} else {
							pagination += "<div class='w3-bar'>";
							pagination += "<a class='w3-button' id='pageNum' href='javascript:reviewPage(" + i + ")'>" + i + "</a>";
							pagination += "</div>";
						}
					}
					if (endPage < data.pageCount) {
						pagination += "<a class='w3-button' id='pageNum' href='javascript:reviewPage(" + (endPage+1) + ")'>&raquo;</a>";
					}
				pagination += "</div>";
					
				$("#reviewList").append(output);
				$("#reviewList").append(pagination);
				
			}
		});
	}
	
	$("#reviewBtn").on("click", function(){
		$("#reviewList").empty();
		reviewPage(1);		// 리뷰내역 페이지 출력
		$("#questionTable").hide();
		$("#detail").empty();
		$("#textBox").hide();				// 개인정보 변경 비밀번호 입력 페이지 숨김
		$("#ticketingList").hide();		// 예매내역 페이지 숨김
		$("#searchShow").empty();
	});
	
// 	// 예매 내역 결과 출력하기
	function ticketHistoryPage(pageNum) {
		let id = document.getElementById("idData").value;
		$
				.ajax({
					url : "/finalproject/member/history",
					type : "GET",
					dataType : "JSON",
					data : {
						"mid" : id,
						pageNum : pageNum
					},
					success : function(data) {
						console.log(data.reviewList);
						let output = "";

						output += "<h2>" + '예매 내역' + "</h2><br>";
						output += "<table class='table' id='ticketList'>";
						output += "<thead>";
						output += "<tr>";
						output += "<th>" + '예매번호' + "</th>";
						output += "<th>" + '영화명' + "</th>";
						output += "<th>" + '극장/상영관' + "</th>";
						output += "<th>" + '관람일시' + "</th>";
						output += "<th>" + '관람인원' + "</th>";
						output += "<th>" + '상태' + "</th>";
						output += "<th>" + '취소' + "</th>";
						output += "</tr>";
						output += "</thead>";
						output += "<tbody>";
						$(data.list)
								.each(
										function(index, result) {

											output += "<tr id='"+result.reservationcode +"'>";
											output += "<td>"
													+ result.reservationcode
													+ "</td>";
											output += "<td>" + result.moviename
													+ "</td>";
											output += "<td>"
													+ result.theatername + "/"
													+ result.screenname
													+ "</td>";
											output += "<td>" +data.datelist[index] + "</td>";
											output += "<td>" + result.people
													+ "</td>";
											if (result.state == 1) {
												output += "<td>예매완료</td>";
											} else if (result.state == 2) {
												output += "<td>관람완료</td>";
											} else if (result.state == 0) {
												output += "<td>취소완료</td>";
											}
										
											if (result.state == 1) {
												output += "<td>"
														+ "<a href='javascript:cancel("
														+'"'+ result.reservationcode +'",'
														+ '"'+data.codelist[index]+'"'+")'><span>예매취소</span></a>"
														+ "</td>";
											} else {
												output += "<td>-</td>";
											}
											output += "</tr>";
											//cancel(reservationcode,moviename)
										});
						output += "</tbody>";
						output += "</table>";

						//페이징 
						let startPage = data.startPageNum;
						let endPage = data.endPageNum;
						let pageCount = data.totalPageCount;
						let PageHtml = "";
						if (startPage > 5) {
							PageHtml += "<a href='javascript:ticketHistoryPage("
									+ (startPage - 1) + ")'><span>[이전]</span>"
						}
						for (let i = startPage; i <= endPage; i++) {
							if (i == pageNum) {
								PageHtml += "<a href='javascript:ticketHistoryPage("
										+ i
										+ ")'><span style='color:blue'>["
										+ i + "]</span>"
							} else {
								PageHtml += "<a href='javascript:ticketHistoryPage("
										+ i
										+ ")'><span style='color:gray'>["
										+ i + "]</span>"
							}
						}
						if (endPage < pageCount) {
							PageHtml += "<a href='javascript:ticketHistoryPage("
									+ (endPage + 1) + ")'><span>[다음]</span>"
						}
						$("#pageCount").html(PageHtml);

						//$("#ticketingList").append(output);
						$("#ticketingList").html(output);
					}

				});

	}

// 		$("#ticketingList").empty();
// 		let id = document.getElementById("idData").value;
// 		let output = '';
// 		$.ajax({
// 			url: "${cp}/member/ticketHistory",
// 			type: "GET",
// 			dataType: "JSON",
// 			data: {"mid": id, pageNum:pageNum},
// 			success: function(data){
// 				console.log(data.ticketList);
// // 				output += "<h2>" + '예매 내역' + "</h2><br>";
// // 				output += "<table class='table' id='ticketList'>";
// // 				output += "<thead>";
// // 				output += "<tr>";
// // 				output += "<th>" + '예매번호' + "</th>";
// // 				output += "<th>" + '영화명' + "</th>";
// // 				output += "<th>" + '극장/상영관' + "</th>";
// // 				output += "<th>" + '관람일시' + "</th>";
// // 				output += "<th>" + '관람인원' + "</th>";
// // // 				output += "<th>" + '관람좌석' + "</th>";
// // 				output += "</tr>";
// // 				output += "</thead>";
// // 				output += "<tbody>";
// 				output += "<h2 style='padding-top: 2%; padding-left: 5%;'>예매내역" + "</h2>";
// 				output += "<hr>";
// 				for(let i=0; i < data.ticketList.length; i++) {
// 					let reservationcode = data.ticketList[i].reservationcode;
					
// 					output += "<div id='ticketingShow' style='border: 1px solid; border-radius: 8px;'>";
// 					output += "<p><strong style='padding-right: 10%;'>예매번호</strong>" + reservationcode + "</p>"
// 					output += "<p><strong style='padding-right: 13%;'>영화명</strong>" + data.ticketList[i].moviename + "</p>";
// 					output += "<p><strong style='padding-right: 5%;'>극장/상영관</strong>" + data.ticketList[i].theatername + '/' + data.ticketList[i].screenname + "</p>";
// 					output += "<p><strong style='padding-right: 10%;'>관람인원</strong>" + data.ticketList[i].people + "</p>";
// 					output += "<p><strong style='padding-right: 10%;'>관람일시</strong>" +  data.ticketList[i].screendate + '&nbsp;'+ data.ticketList[i].starttime + "</p>";
// 					output += "<p><strong style='padding-right: 10%;'>관람좌석</strong>" + data.ticketList[i].seatname + "</p>";
// 					output += "<input type='button' value='예매취소' id='ticketCancle' onclick='ticketingCancle(" + reservationcode + ")'>";
// 					output += "</div>";
// // 					output += "<tr>";
// // 					output += "<td>" + data.ticketList[i].reservationcode + "</td>";
// // 					output += "<td>" + data.ticketList[i].moviename + "</td>";
// // 					output += "<td>" + data.ticketList[i].theatername + '/' + data.ticketList[i].screenname + "</td>";
// // 					output += "<td>" + data.ticketList[i].screendate + "</td>";
// // 					output += "<td>" + data.ticketList[i].people + "</td>";
// // 					output += "<td>" + 'H열 8' + "</td>";
// // 					output += "<td><a href='#'>취소" + "</a></td>";
// // 					output += "<a type='button' id='cancleBtn' onclick='ticketingCancle(" + reservationcode + ")'>" + '취소' + "</a>";
// // 					output += "</tr>";
// 				}
// // 				output += "</tbody>";
// // 				output += "</table>";
				
// 				// 페이징 처리
// 				let startPage = data.startPageNum;
// 				let endPage = data.endPageNum;
// 				let pageCount = data.pageCount;
// 				let rowBlockCount = data.rowBlockCount;
// 				let pagination = "";
// 				console.log(startPage, endPage, pageCount, rowBlockCount);
// 				pagination += "<div class='w3-center'>";
// 					if (startPage > 2) {
// 						pagination += "<a class='w3-bar-item w3-button' id='pageNum' href='javascript:ticketHistoryPage(" + (startPage-1) + ")' >&laquo;</a>'";
// 					}
// 					for (let i = startPage; i <= endPage; i++) {
// 						if (i == pageNum) {
// 							pagination += "<div class='w3-bar'>";
// 							pagination += "<a class='w3-button' id='pageNum' href='javascript:ticketHistoryPage(" + i + ")'>" + i + "</a>";
// 							pagination += "</div>";
// 						} else {
// 							pagination += "<div class='w3-bar'>";
// 							pagination += "<a class='w3-button' id='pageNum' href='javascript:ticketHistoryPage(" + i + ")'>" + i + "</a>";
// 							pagination += "</div>";
// 						}
// 					}
// 					if (endPage < data.pageCount) {
// 						pagination += "<a class='w3-button' id='pageNum' href='javascript:ticketHistoryPage(" + (endPage+1) + ")'>&raquo;</a>";
// 					}
// 				pagination += "</div>";
				
// 				$("#ticketingList").append(output);
// 				$("#ticketingList").append(pagination);
// 			}
// 		});
// 	}
	
	$("#ticketHistoryBtn").on("click", function(){
		ticketHistoryPage(1);
		$("#ticketingList").show();
		$("#questionTable").hide();
		$("#detail").empty();
		$("#reviewList").empty();						// 리뷰내역 페이지 숨김
		$("#textBox").hide();				// 개인정보 변경 비밀번호 입력 페이지 숨김
		$("#searchShow").empty();
	});

	
	// 예매 취소
// 	function ticketingCancle(reservationcode){
		function cancel(reservationcode,moviecode) {
			$.ajax({
				url : '/finalproject/member/cancel', 
				data:{"reservationcode":reservationcode,"moviecode":moviecode},
				dataType : 'json',
				success : function(data)
				{

					alert("취소가 완료되었습니다.");
					ticketHistoryPage(1);
				}
				});
		}
		
// 		function ticketHistoryPage(pageNum) {			
// 			if (confirm("예매를 취소하시겠습니까?") == false) {
// 				return false;
// 			}
// 			$.ajax({
// 				url: "${cp}/member/ticketingCancle",
// 				data: {"reservationcode": reservationcode},
// 				dataType: "JSON",
// 				success: function(data){
// 					if (data == 1) {
// 						ticketHistoryPage(1);
// 					} else {
// 						alert("예매를 취소할 수 없습니다. 관리자에 문의해주세요.");
// 					}
// 				}
// 			});
// 		}
	

	$("#qnaBtn").on("click", function() {
		location.href = "${cp}/qna/insert";
	});
	
	// 검색기능
	$("#searchBtn").on("click", function(){
		let searchForm = $("#keywordForm").serialize();
		$.ajax({
			url:"${cp}/member/question",
			type: "post",
			dataType: "JSON",
			data: searchForm,
			success: function(data) {
				console.log(data.list);
// 				$("#searchShow").empty();
				let output = '';
				output += '<table id="searchTable" >';
				output += '<thead>';
				output += '<tr>';
				output += '<th style="width: 20%;">글번호</th><th>제목</th><th>작성일</th>';
				output += '</tr>';
				output += '</thead>';
				for (let i = 0; i < data.list.length; i++) {
					let id= data.list[i].mid;
					output += '<tbody>';
					output += '<tr>';
					output += "<td>" + data.list[i].qnacode +"</td><td><a type='button' id='detailQuestion' onclick='detailQuesion("+ data.list[i].qnacode +",\""+ id +"\")'>"
					+ data.list[i].title + "</a></td><td>"
					+ data.list[i].regdate + "</td>";
					output += '</tr>';
					output += '</tbody>';
					}
				output += '</table>';
					// 페이징 처리
				let startPage = data.startPageNum;
				let endPage = data.endPageNum;
				let pageCount = data.pageCount;
				let pagination = "";
					
				pagination += "<ul class='pagination'>";
				if (startPage > 10) {
					pagination += "<li class='page-item'><a class='page-link' id='pageNum' href='javascript:page(" + (startPage-1) + ")' >&laquo;</a>'";
				}
				for (let i = startPage; i <= endPage; i++) {
				if (i == pageNum) {
					
						pagination += "<li class='page-item active'><a class='page-link' id='pageNum' href='javascript:page(" + i + ")'>" + i + "</a>";
					} else {
						pagination += "<li class='page-item'><a class='page-link' id='pageNum' href='javascript:page(" + i + ")'>" + i + "</a>";
					}
				}
				if (endPage < data.pageCount) {
					pagination += "<li class='page-item'><a class='page-link' id='pageNum' href='javascript:page(" + (endPage+1) + ")'>&raquo;</a>";
				}
				pagination += "</ul>";
					
				$("#question").empty();
				$("#question").append(output);
				$("#question").append(pagination);
 					
				
 					
			}, error: function() {
				alert("검색 기능 실패");
			}
		});
	});
	

	// 마우스 오버
	$("#qnaBtn").mouseover(function(){
		$("#qnaBtn").css("background-color", "#EFF2FB")
	});
	$("#qnaBtn").mouseout(function(){
		$("#qnaBtn").css("background-color", "#ffffff")
	});
</script>




