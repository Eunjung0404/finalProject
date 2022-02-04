<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style type="text/css">
h3 {
	padding-top: 5%;
	margin-left: 35%;
}
#membercheck{
	margin-left: 35%;
}
table tr td {	
	text-align: left;
}

table tr td input[name=mphone] {
	width: 185px;
}

table tr td input[name=maddr] {
	width: calc(100% - 14px);
	/* {속성값 !important } 우선순위 지정 */
}
div .sign {
	padding-left: 35%;
}

.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
}

.valid, .invalid {
	font-size: 11px;
	font-weight: bold;
}

.valid {
	color: green;
}

.invalid {
	color: red;
}
</style>
<!-- <script type="text/javascript" src="js/jquery-3.6.0.js"></script> -->
<h3>회원가입</h3>
<hr>
<form:form method="post" action="${cp }/signup" id="membercheck"
	name="signupForm" onsubmit="return validation(this)">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" title="아이디" id="mid" name="mid"
				class="chk" placeholder="ID" maxlength="12"/> 
				<input type="button" value="중복확인" onclick="idCheck()"><span id=id_check></span>
				<input type="button" value="중복확인"><span id=id_check></span>
				<div class="valid">아이디를 입력하세요.(5~12글자)</div></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" title="비밀번호" name="mpwd" id="mpwd"
				placeholder="PASSWORD" class="chk">
				<div class="valid">비밀번호를 입력하세요.(8~16글자, 영문 대/소문자, 숫자를 모두 포함)</div></td>
		<tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" title="비밀번호 확인" id="pw_ck"
				name="pw_ck" class="chk">
				<div class="vaild" id="confirmMsg"></div></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" title="이메일" id="memail" name="memail" class="chk" placeholder="EMAIL">@
			<select class="chk" name="memail1">
				<option class="chk" value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="daum.net">daum.net</option>
				<option value="kakao.com">kakao.com</option>
			</select>
				<div class="valid">이메일을 입력하세요.</div></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" class="chk" title="이름" id="mname"
				name="mname" placeholder="NAME">
				<div class="valid">이름을 입력하세요.</div></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birth"> <span id="delete"
				style="color: red; position: relative; right: 25px; display: none;"><i
					class="fas fa-times font-img"></i></span>
				<div class="valid">ex)1999-01-01</div></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" id="mphone" name="mphone" maxlength="11"
				placeholder="-없이 숫자만 입력"> <!-- 					<input type="text" name="tel"> -->
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><a class="btn-fill-s" onclick="daum_post()">우편번호 찾기</a> <input
				type="text" name="post" class="w-px60" readonly> <input
				type="text" name="maddr" readonly> <input type="text"
				name="maddr"></td>
		</tr>
	</table><br>
</form:form>
	<hr>
	<div class="sign">
		<input type="button" value="회원가입" onclick="validation()" style="width: 200pt;" name="signup">

		<input type="button" value="취소" id="cancle" onclick="cancl()" style="width: 200pt;" name="clncle">
	</div>




<script>
	// 데이터 유효성 검사 정규식 표현
	let regExpId = /^[a-zA-Z | ㄱ-ㅎ | ㅏ-ㅣ | 가-힣]/;		
	let regExpName = /^[가-힣]*$/;
	let regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
	let regExpEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
 		

		
	function idCheck(){
		let id = document.getElementById("mid").value;
		if (id == '') return; 			
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if (xhr.readyState == 4 && xhr.status == 200){
				let data = xhr.responseText;
				console.log(data);
				let json = JSON.parse(data);
				let span = document.getElementById("id_check");
				if (json.using == true){
					if (document.signupForm.mid.value.length < 5 || document.signupForm.mid.value.length > 12){
						span.innerHTML = "사용되고 있거나 형식에 맞지 않는 아이디 입니다.";	
					} 						
				} else{
					span.innerHTML = "사용 가능한 아이디 입니다.";
				} 					
			}
		}
		xhr.open('get','${cp}/idCheck?mid=' + id, true);
		xhr.send();
	}

 		
 	function validation(){			

 		if (document.signupForm.mid.value == ""){
 			alert("아이디를 입력하세요.");
 			form.mid.focus(); 		
 			return false;
 		}
 		if (document.signupForm.mid.value.length < 5 || document.signupForm.mid.value.length > 12) {
			alert("아이디를 5~12자 이내로 입력하세요.");
			form.mid.select();
			return false;
 		}
 		if (!regExpId.test(document.signupForm.mid.value)) {
			alert("아이디는 문자로 시작해주세요!");
			form.id.select();
			return false;
		}
 		if (document.signupForm.mpwd.value == ""){
			alert("비밀번호를 입력하세요.");
 			form.mpwd.focus();
 			return false;
 		}
 		if (document.signupForm.mpwd.value.length < 5 || document.signupForm.mpwd.value.length > 12) {
			alert("비밀번호를 5~12자 이내로 입력하세요.");
			form.mpwd.select();
			return false;
 		}
 		if (document.signupForm.mpwd.value != document.signupForm.pw_ck.value) {
 			alert("비밀번호가 일치하지 않습니다.");
 			form.pw_ck.select();
 			return false;
 		}
 		if (!regExpEmail.test(document.signupForm.memail.value + "@" + document.signupForm.memail1.value)){
 			alert("이메일 입력을 확인해주세요!");
 			form.memail.focus();
 			return false;
 		}
 		if (!isNaN(document.signupForm.mname.value.substr(0,1))){
 			alert("이름은 숫자로 시작할 수 없습니다.");
 			form.mname.select();
 			return false;
 		} 	
 		if (!regExpName.test(document.signupForm.mname.value)){
 			alert("이름은 한글만 입력해주세요!");
 			form.mname.select();
 			return false;
 		}
 		if (!regExpPhone.test(document.signupForm.mphone.value)){
 			alert("연락처 입력을 확인해주세요!");
 			form.mphone.focus();
 			return false;
 		}
		document.signupForm.submit();
 	}
 

	
// 	$(function(){
// 		$('#pw_ck').blur(function(){
// 			if($('#mpwd').val() != $('#pw_ck').val()){
// 				if($('#pw_ck').val() != ''){
// 					alert("비밀번호가 일치하지 않습니다.");
// 					$('#pw_ck').val('');
// 					$('#pw_ck').focus();
// 				}
// 			}
// 		});
// 	});
	function cancl(){
		console.log(document.getElementById(cancle));
		if (document.getElementById(cancle) == null){
			alert("가입을 취소하시겠습니까?");
			location.href = "${cp}/";
		}
	}
</script>

<script>
	$(function(){
		$("#id_check").click(function(){
			let mid = $("input[name='mid']").val();
			$.ajax({
				url: '${cp}/signup?mid=' + mid,
				type: 'post',
				dataType: 'json',
				success: function(data){
					alert(data);
				}
			});
		});
	});
</script>





