\<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

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

.w3-teal {
	background-color: #49434e;
	color: #fff!important;
}

.w3-table tr {
	width: 100%;
}
.w3-table th td {
	width: 20%;
}

ul.pagination {
	padding-left: 50%;
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

</style>

<%
Cookie[] cookies = request.getCookies();
String id = "";
for (Cookie c : cookies) {
	String name = c.getName();
	if (name.equals("mid")) {
		id = c.getValue();
	}
}
%>

	<input type="hidden" value="<%=id %>" id="idData">

<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large"
  onclick="w3_close()">Close &times;</button>
  <input type="button" id="ticketHistoryBtn" value="예매 및 취소 내역" class="w3-bar-item w3-button" >
  <input type="button" id="reviewBtn" value="나의 평점 모아보기" class="w3-bar-item w3-button" >
  <input type="button"  value="나의 문의내역" id="questionBtn" class="w3-bar-item w3-button" >
  <input type="button" id="changeInfoBtn" class="w3-bar-item w3-button" value="개인정보 수정" >
</div>

<div id="main">

<div class="w3-teal">
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
<input type="button" value="1:1 문의하기" id="qnaBtn" style="margin-left: 66.5%; background-color: #FFFFFF; border-width: 1px; border-radius: 4px; height: 40px; border-color: #503396; color: #503396;">
<div>
	<select style="margin-left: 55%; height: 40px; margin-right: 1%; border-radius: 4px; width: 70px; text-align: center;">
		<option>전체</option>
		<option>미답변</option>
		<option>답변</option>
	</select>
	<input type="text" placeholder="검색어를 입력해주세요." style="border: 0.1px solid gray; margin-left: 0%; margin-top: 1%; height: 40px; border-radius: 4px;">
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

<div class="container mt-3" id="ticketingList" style="display: none;">
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
		document.getElementById("textBox").style.marginLeft = "0%";
		document.getElementById("reviewList").style.marginLeft = "3%";
		document.getElementById("ticketingList").style.marginLeft = "0%";
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("openNav").style.display = "inline-block";
		$("#questionTable").hide();
		$("#detail").empty();
		$("#reviewList").empty();						// 리뷰내역 페이지 숨김
		$("#textBox").hide();				// 개인정보 변경 비밀번호 입력 페이지 숨김
		$("#ticketingList").empty();
	}

	
	// QnA 상세 보기
	let idForm = $("#idDataFrom").serialize();
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
		$("#question").empty();
		$.ajax({
			url : "${cp}/member/question",
			type : "post",
			data: {"mid": document.getElementById("idData").value,pageNum:pageNum},
			dataType : "JSON",
			success : function(data) {
				let output = '';
				output += '<thead>';
				output += '<tr>';
				output += '<th style="width: 0px;">글번호</th><th>제목</th><th>작성일</th>';
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
					
// 					pagination += "<div class='w3-center'>";
					pagination += "<ul class='pagination'>";
 					if (startPage > 10) {
 						pagination += "<li class='page-item'><a class='page-link' id='pageNum' href='javascript:page(" + (startPage-1) + ")' >&laquo;</a>'";
 					}
 					for (let i = startPage; i <= endPage; i++) {
 						if (i == pageNum) {
//  							pagination += "<div class='w3-bar'>";
							
 							pagination += "<li class='page-item active'><a class='page-link' id='pageNum' href='javascript:page(" + i + ")'>" + i + "</a>";
//  							pagination += "</div>";
 						} else {
//  							pagination += "<div class='w3-bar'>";
 							pagination += "<li class='page-item'><a class='page-link' id='pageNum' href='javascript:page(" + i + ")'>" + i + "</a>";
//  							pagination += "</div>";
 						}
 					}
 					if (endPage < data.pageCount) {
 						pagination += "<li class='page-item'><a class='page-link' id='pageNum' href='javascript:page(" + (endPage+1) + ")'>&raquo;</a>";
 					}
 					pagination += "</ul>";
//  					pagination += "</div>";
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
	});
	
	// 	리뷰 내역 결과 출력하기
	function reviewPage(pageNum) {
		let id = document.getElementById("idData").value;
		$.ajax({
			url: "${cp}/member/myreview",
			type: "GET",
			dataType: "JSON",
			data: {"mid": id, pageNum:pageNum},
			success: function(data){
// 				console.log(data.reviewList);
				let output = "";
				
				for(let i=0; i < data.reviewList.length; i++) {
					output += "<div id='review'>"; 
// 					console.log(data.reviewList[i].score);
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
				let pagination = "";
				
				pagination += "<div class='w3-center'>";
					if (startPage > 10) {
						pagination += "<a class='w3-bar-item w3-button' id='pageNum' href='javascript:questionList(" + (startPage-1) + ")' >&laquo;</a>'";
					}
					for (let i = startPage; i <= endPage; i++) {
						if (i == pageNum) {
							pagination += "<div class='w3-bar'>";
							pagination += "<a class='w3-button' id='pageNum' href='javascript:page(" + i + ")'>" + i + "</a>";
							pagination += "</div>";
						} else {
							pagination += "<div class='w3-bar'>";
							pagination += "<a class='w3-button' id='pageNum' href='javascript:page(" + i + ")'>" + i + "</a>";
							pagination += "</div>";
						}
					}
					if (endPage < data.pageCount) {
						pagination += "<a class='w3-button' id='pageNum' href='javascript:page(" + (endPage+1) + ")'>&raquo;</a>";
					}
				pagination += "</div>";
					
				$("#reviewList").append(output);
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
	});
	
// 	// 예매 내역 결과 출력하기
	function ticketHistoryPage() {
// 		let id = document.getElementById("idData").value;
// 		$.ajax({
// 			url: "${cp}/member/myTicketingHistory",
// 			type: "GET",
// 			dataType: "JSON",
// 			data: {"mid": id, pageNum:pageNum},
// 			success: function(data){
// // 				console.log(data.reviewList);
// 				let output = "";
				
// 				for(let i=0; i < data.ticketHistoryList.length; i++) {
// 					output += "<div id='ticket'>"; 
// 					output += "</div>";
// 				}
// 				$("#ticketingList").append(output);
// 			}
// 		});
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
		output += "<th>" + '관람좌석' + "</th>";
		output += "</tr>";
		output += "</thead>";
		output += "<tbody>";
		output += "<tr>";
		output += "<td>" + '9521-603-41525' + "</td>";
		output += "<td>" + '더배트맨' + "</td>";
		output += "<td>" + '강남/1관' + "</td>";
		output += "<td>" + '2022.03.06(일) 15:20' + "</td>";
		output += "<td>" + '성인 1명' + "</td>";
		output += "<td>" + 'H열 8' + "</td>";
		output += "</tr>";
		output += "<tr>";
		output += "<td>" + '9521-603-41525' + "</td>";
		output += "<td>" + '언차티드' + "</td>";
		output += "<td>" + '강남/1관' + "</td>";
		output += "<td>" + '2022.03.06(일) 15:20' + "</td>";
		output += "<td>" + '성인 1명' + "</td>";
		output += "<td>" + 'H열 8' + "</td>";
		output += "</tr>";
		output += "</tbody>";
		output += "</table>";
		
		$("#ticketingList").append(output);
	}
	$("#ticketHistoryBtn").on("click", function(){
		$("#ticketingList").empty();
		ticketHistoryPage();
		$("#ticketingList").show();
		$("#questionTable").hide();
		$("#detail").empty();
		$("#reviewList").empty();						// 리뷰내역 페이지 숨김
		$("#textBox").hide();				// 개인정보 변경 비밀번호 입력 페이지 숨김
	});

	

	$("#qnaBtn").on("click", function() {
		location.href = "${cp}/qna/insert";
	});
	
	
	// 마우스 오버
	$("#qnaBtn").mouseover(function(){
		$("#qnaBtn").css("background-color", "#EFF2FB")
	});
	$("#qnaBtn").mouseout(function(){
		$("#qnaBtn").css("background-color", "#ffffff")
	});
</script>




