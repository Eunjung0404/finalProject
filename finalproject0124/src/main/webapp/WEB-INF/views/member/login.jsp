<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
  
<style>
	#findId {
		font-size: 13px;
		padding-left: 0%;
		margin-left: 45px;
	}
	#findPwd {
		font-size: 13px;
	}
	
	div .main {
		padding-top: 7%;
		padding-left: 40%;
	}
	#loginProcess{
		border: 0;
		color: #fff;
		background-color: #503396;
		height: 46px;
		padding: 0 30px;
		border-radius: 4px;
		margin-right: 10px;
		margin-top: 10px;
	}
	div #login{
		position: absolute;
		margin-left: 25px;
		padding-left: 0px;
		margin-top: 5px;	
		font-size: 14px;
	}
	div #saveId{
		margin-left: 25px;
		padding-left: 160px;
		font-size: 14px;
		margin-top: 5px;
	}
	table tr td {	
		text-align: left;
	}
	th {
		padding-bottom: 8px;
	}
	td {
		padding-bottom: 8px;
		padding-left: 15px;
	}

</style>



<div class="main">
	<form:form method="post" action="${pageContext.request.contextPath }/login" onsubmit="return"  name="submitForm" id="submitForm">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="username" id="username"  value="${getMid }" ><span style="color: red; padding-left: 10px; font-size: 15px;"><strong>${param.LoginFailMessage }</strong></span>
			</tr>			
			<tr>
				<th>비밀번호</th>				
				<td><input type="password" name="password" id="password"></td>
			</tr>
		</table>
	<!-- 			<input type="submit" value="로그인" id="login"><br> -->		
		
	 <div class="form-check" id="login">
		<input type="checkbox" class="form-check-input" id="checkbox1" name="remember-me">
		<label class="form-check-label" for="checkbox1" style="width: 150px;" id="stayLogin">로그인 상태 유지</label>	      
	</div>
	<div class="form-check" id="saveId">
		<input type="checkbox" class="form-check-input" id="checkbox2" name="checkbox2" >
		<label class="form-check-label" for="checkbox2" id="saveBtn">아이디 저장</label>
	</div>
	
	
	<div class="button">
		<button type="button" class="btn btn-primary" id="loginProcess" style="width: 200pt;" >로그인</button><br>
	</div>
	</form:form>
		<input type="button" class="btn" id="findId" onclick="findId()" value="아이디 찾기">
		<input type="button" class="btn" id="findPwd" onclick="findPwd()" value="비밀번호 찾기">
</div>



<script>
	$(function() {
		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				let end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
		let id = getCookie("cookie_id");
		console.log("쿠키아이디:" + id);
		if (id != "") {
			$("#username").val($.cookie('mid'));
			$("#checkbox2").attr("checked", true);
		}
	});

	// 아이디 찾기 페이지로 이동
	function findId() {
		location.href = "${cp}/findId";
	}

	// 비밀번호 찾기 페이지로 이동
	function findPwd() {
		location.href = "${cp}/findPwd";
	}

	// 	// 쿠키 생성
	// 	function setCookie(cookieName, value, exdays){
	// 		var exdate = new Date();
	// 		exdate.setDate(exdate.getDate() + exdays);
	// 		var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	// 		document.cookie = cookieName + "=" + cookieValue;
	// 	}

	// 	// 쿠키 가져오기
	// 	function getCookie(cookieName){
	// 		cookieName = cookieName + '=';
	// 		var cookieData = document.cookie;
	// 		var start = cookieData.indexOf(cookieName);
	// 		var cookieValue = '';

	// 		if (start != -1) {
	// 			start += cookieName.length;
	// 			let end = cookieData.indexOf(';', start);
	// 			if (end == -1) end = cookieData.length;
	// 			cookieValue = cookieData.substring(start, end);
	// 		}
	// 		return unescape(cookieValue);
	// 	}

	// 	// 쿠키 삭제하기
	// 	function deleteCookie(cookieName) {
	// 		let expireDate = new Date();
	// 		expireDate.setDate(expireDate.getDate() - 1);
	// 		document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString();
	// 	}

	$("#loginProcess").click(function() {
		let id = $("#username").val();
		let pwd = $("#password").val();
		let chk = document.getElementById("checkbox2").checked; // 체크박스 체크 여부 (true / false로 담김)
		//	let c = $.cookie('mid');
// 		console.log("내가적은아이디:" + id);
// 		console.log(chk);
		if ($("#username").val() == "") { // 아이디를 입력하지 않았다면
			alert("아이디를 입력해주세요!");
			$("#username").focus();
			return false;
		} else if ($("#password").val() == "") { // 비밀번호를 입력하지 않았다면
			alert("비밀번호를 입력해주세요!");
			$("#password").focus();
			return false;
		} else if (chk == true) { // 아이디 저장 체크박스가 체크 된 경우 (true)
			// 쿠키 생성
			function setCookie(cookieName, value, exdays) {
				var exdate = new Date();
				exdate.setDate(exdate.getDate() + exdays);
				var cookieValue = escape(value)
						+ ((exdays == null) ? "" : "; expires="
								+ exdate.toGMTString());
				document.cookie = cookieName + "=" + cookieValue;
			}
			setCookie("cookie_id", username, 1);
		} else { // 체크가 해제 된 경우 (false)
			function deleteCookie(cookieName) {
				let expireDate = new Date();
				expireDate.setDate(expireDate.getDate() - 1);
				document.cookie = cookieName + "=" + "; expires="
						+ expireDate.toGMTString();
			}
			deleteCookie("cookie_id");
		}
		document.submitForm.submit();
	});
</script>

	

