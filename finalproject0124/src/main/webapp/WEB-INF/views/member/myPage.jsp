<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>

  
<style>
 	div .menuBox {
 		position: absolute;
 		padding-left: 20px;
  		padding-top: 30px; 
  		padding-bottom: 25px; 
  		
  		margin-top: 10%;
  		margin-right: 80%;
  		
		border: 2px solid #000000;
		border-radius: 20px;
/* 		margin-right: 150px; */
		
	} 
	div #textBox {
		position: relative;
		padding-left: 300px;
		padding-top: 50px;
		padding-right: 100px;
		padding-bottom: 50px;		
		padding-top: 0px;
		margin: 0 auto;
		text-align: center;
	}
	div #titleBox {
		position: relative;
		padding-left: 300px;
		padding-top: 50px;
		padding-right: 100px;
		margin: 0 auto;
	}
	div #mainBox {
		position: relative;
		padding-left: 300px;
		padding-top: 50px;
		padding-right: 100px;
		margin: 0 auto;
	}
	div #myTheater{
		width: 600px;
		height: 100px;
		border:  solid 2px #8C8C8C;
		text-align: center;
	}	
	#title2 {
		font-size: 20px;
	}
	#title3{
		font-size: 17px;
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
</style>


<div id=content>
	<div class="menuBox">		
		<p><a type="button" id="mainList">메인으로 보여질 페이지</a></p>		
		<p><a href="#">예매/구매내역</a></p>
		<p><a href="#">예매/구매내역</a></p>
		<p><a type="button" id="myinfo">내 정보 보기</a></p>		
	</div>
	
	<div id="titleBox" style="display:none">
		<h1>회원정보</h1>
	</div>
	
	<div id="textBox" style="display:none">		
		<hr>
		<a  id="title2"><strong>회원님의 개인정보 보호를 위해 비밀번호를 입력하셔야 합니다.</strong></a><br><br>
		<a id="title3">로그인 시 사용하시는 비밀번호를 입력해주세요.</a><br><br>
<!-- 		<input type="text" name="mname" placeholder="이름을 입력해주세요."><br> -->
<!-- 		<input type="email" name="memail" placeholder="이메일을 입력해주세요."><br> -->
<%-- 		<form:form method="POST" action="${cp }/member/pwdVali"  name="pwdForm"> --%>
<!-- 			<input type="password" name="mpwd" id="mpwd" placeholder="비밀번호를 입력해주세요." ><br> -->
			
<%-- 		</form:form> --%>
		<form:form  name="pwdForm" id="pwdForm">
			<input type="password" name="mpwd" id="mpwd" placeholder="비밀번호를 입력해주세요."  style="height: 50px; width: 400px; text-align: center" maxlength="16"><br>
			
		</form:form>
		<hr>
		<button type="button" id="btn1" style="text-align: center">확인</button>
		<button type="button" id="btn2" style="text-align: center">취소</button>
	</div>
	
	<!-- <div id="mainBox" style="display:block">
		<div id="ticketing">
			<a style="font-size: 12px; color: #8C8C8C;">나의 극장 </a>
			<a style="font-size: 7px; color: #8C8C8C;">더보기 ></a>
			<div id="myTheater">
				<a style="padding-top: 50px">나의 극장을 설정해주세요.</a>
			</div>
		</div>
	</div> -->
</div>

 <script> 	
	$("#myinfo").click(function(){		
			$("#textBox").show();	
			$("#titleBox").show();	
	});
	$("#btn1").click(function(){
		let form1 = $("#pwdForm").serialize();
 		$.ajax({
 			url: "${cp}/member/pwdVali",
 			type: "POST",
 			data: form1,
 			dataType: "JSON",
 			success: function(data){
 				if (data == 0){
 					alert("비밀번호가 일치하지 않습니다!");
 				} else {
 					location.href="${cp}/member/doMyinfo";		// 비밀번호가 일치하면 나의 정보 페이지로 이동
 				}
 			}
 		});
	});	
</script> 




