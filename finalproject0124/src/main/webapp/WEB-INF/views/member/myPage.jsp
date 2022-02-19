<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


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
  <a type="button" id="ticketingBtn" class="w3-bar-item w3-button">예매 및 취소 내역</a>
  <a type="button" id="reviewBtn" class="w3-bar-item w3-button">나의 평점 모아보기</a>
  <input type="button"  value="나의 문의내역" id="questionBtn" class="w3-bar-item w3-button" disabled="disabled">
  <input type="button" id="changeInfoBtn" class="w3-bar-item w3-button" value="개인정보 수정" disabled="disabled">
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



<div class="w3-container" id="questionTable">
  <table class="w3-table" id="question">
  </table>
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
		document.getElementById("textBox").style.marginLeft = "25%";
		document.getElementById("mySidebar").style.width = "25%";
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("openNav").style.display = 'none';
		questionBtn.disabled = false;	
		changeInfoBtn.disabled = false;
	}
	function w3_close() {
		document.getElementById("main").style.marginLeft = "0%";
		document.getElementById("questionTable").style.marginLeft = "0%";
		document.getElementById("textBox").style.marginLeft = "0%";
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("openNav").style.display = "inline-block";
	}


	$("#questionBtn").click(function(e){
		questionBtn.disabled = true;			// 문의내역 버튼을 클릭했을 때 문의내역 버튼 비활성화
		page(1);					// 문의내역 버튼을 클릭했을 때 문의내역 페이지 출력
	});
	
	// QnA 상세 보기
	let idForm = $("#idDataFrom").serialize();
	//.log(data.qnacode);
	function detailQuesion(qnacode,id){

		$.ajax({
			url: "${cp}/member/detailQuestion",
			data:{"qnacode":qnacode,"mid": id},
			type: "GET",
			dataType: "JSON",
			success: function(data){
// 				console.log(data.title);
				let output = "";
// 				output += 
			}, error: function(){
				console.log("문의내역 상세정보 받아오기 실패!");
			}
		});
	}

	// 회원 정보 변경을 하기 위해서 비밀번호 확인을 한 번 더 요청
	$("#changeInfoBtn").on("click", function(){
		document.getElementById("questionBtn").disabled = false;
		$("#question").empty();
		$("#textBox").show();
		document.getElementById("changeInfoBtn").disabled = true;
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
	
	function page(pageNum) {
		$.ajax({
			url : "${cp}/member/question",
			type : "post",
			data: {"mid": document.getElementById("idData").value,pageNum:pageNum},
			dataType : "JSON",
			success : function(data) {
			   $("#question").empty();
					let output = '';
					output += '<thead>';
					output += '<tr>';
					output += '<th>글번호</th><th>제목</th><th>작성일</th>';
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
 					$("#question").append(output);					// 테이블 정보 출력
 					$("#question").append(pagination);			// 페이징 정보 출력
			},
			error : function() {
				alert("실패");
			}
		});
	}

</script>




