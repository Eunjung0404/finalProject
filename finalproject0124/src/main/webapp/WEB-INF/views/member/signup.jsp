<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>

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


<h3>회원가입</h3>
<hr>
<form:form method="post" action="${cp }/signup" id="membercheck" name="signupForm" onsubmit="return validation(this)">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" title="아이디" id="mid" name="mid" placeholder="아이디를 입력하세요." maxlength="12"/> 				
<!-- 				<button type="button" id="bntIdCheck" onclick="idCheck()"></button> -->
				<input type="button" value="중복검사"  id="idCheck">
				<div class="valid">아이디를 입력하세요.(5~12글자, 영문 소문자, 숫자만 입력 가능)</div>
			</td>
			
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" title="비밀번호" name="mpwd" id="mpwd" maxlength="16" placeholder="비밀번호를 입력하세요." >
				<div class="valid">비밀번호를 입력하세요.(8~16글자, 영문 대/소문자, 숫자를 모두 포함)</div></td>
		<tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" title="비밀번호 확인" id="pw_ck" name="pw_ck" class="chk" maxlength="16">
				<div class="vaild" id="confirmMsg"></div></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" title="이메일"  id="memail1" class="chk" placeholder="이메일을 입력하세요."><span id="middle">@</span>
			<input type="text" id="emailSuffix" disabled value="">
			<select class="chk" id="memail2"  >
				<option  value="" >선택</option>
				<option  value="naver.com" >naver.com</option>				
				<option  value="nate.com" >nate.com</option>				
				<option value="gmail.com">gmail.com</option>
				<option value="daum.net">daum.net</option>
				<option value="kakao.com">kakao.com</option>
				<option  value="1" >직접입력</option>
			</select>
			<input type="hidden" id="totalEmail" name="memail" value="">
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" class="chk" title="이름" id="mname"
				name="mname" placeholder="이름을 입력하세요."></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birth" placeholder="생년월일을 입력하세요."> 
				<div class="valid">ex)1999-01-01</div></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" id="mphone" name="mphone" maxlength="11" placeholder="-없이 숫자만 입력">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><a class="btn-fill-s" onclick="daum_post()">우편번호 찾기</a> <input type="text" name="post" class="w-px60" readonly="readonly"> 
			<input type="text" name="maddr" readonly="readonly" > 
				<input type="text" name="maddr"></td>
		</tr>
	</table><br>

</form:form>
	<hr>
	<div class="sign">
		<input type="button" value="회원가입" onclick="validation()" style="width: 200pt;" name="signup">
		<input type="button" value="취소" id="cancle"  style="width: 200pt;" name="clncle">
	</div>
<!-- 	<input type="button" value="테스트" id="testButton"> -->
	
<script>
	// 데이터 유효성 검사 정규식 표현
	let regExpName = /^[가-힣]*$/;
	let regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
	let cnt = 0;
	
// 	let regExpEmail = /^[A-Za-z0-9_\\.\\-]+@[A-Za-z0-9\\-]+\\.[A-Za-z0-9\\-]+$/;	
// 	let email = $("#memail1").val();
// 	let middle = $("#middle").text();
// 	let address = $("#memail2").val();
	
// 	$("#testButton").click(function(){
// 		alert(email);		
// 	});
	
	// 아이디 중복검사
	$("#idCheck").click(function(){
		$.ajax({
			url: "${cp}/idCheck?mid=" + document.getElementById("mid").value,
			type: "get",			
			dataType: 'json',
			success: function(n){
// 				console.log(cnt);
				cnt++;
// 				console.log(cnt);
				if(document.getElementById("mid").value == "") {
					alert("아이디를 입력해주세요.");
					document.signupForm.mid.focus();
					cnt = 0;
					return false;
				}
				if(document.getElementById("mid").value.length < 5 || document.getElementById("mid").value.length > 12) {
					alert("아이디는 5~12자 이내로 입력하세요.");
					cnt = 0;
					return false;
				}
				if(n == 1){
					alert("이미 사용중인 아이디 입니다.");
					document.signupForm.mid.select();
					cnt = 0;
					return false;
				} else {
					alert("사용 가능한 아이디 입니다.");	
					document.signupForm.mpwd.focus();
				}
			}		
		});
	});
	
	// 이메일 선택 입력
	$('#memail2').change(function(){
		$("#memail2 option:selected").each(function(){
			if ($(this).val() == '1'){	// 직접 입력일 경우
				$("#emailSuffix").val('');		// 값 초기화
				$("#emailSuffix").attr("disabled", false);	// 활성화
			} else if ($(this).val()=="") {	// 선택란을 선택했을 경우
				$("#emailSuffix").val("");	// 값 초기화
				$("#emailSuffix").attr("disabled", true);	// 비활성화
			} else {	// 직접 입력이 아닐 경우
				$("#emailSuffix").val($(this).text());		// 선택값 입력
				$("#emailSuffix").attr("disabled", true);		// 비활성화
			}
		});
	});

 	// 데이터 유효성 검사
    	function validation(){ 		
 		if (document.signupForm.mid.value == ""){
 			alert("아이디를 입력하세요.");
 			document.signupForm.mid.focus();  			
 			return false;
 		}
//  		if (document.signupForm.mid.value.length < 5 || document.signupForm.mid.value.length > 12) {
// 			alert("아이디를 5~12자 이내로 입력하세요.");
// 			document.signupForm.mid.select();			
// 			return false;
//  		}
 		if (document.signupForm.mpwd.value == ""){
			alert("비밀번호를 입력하세요.");
 			document.signupForm.mpwd.focus();
 			cnt = 0;
 			return false;
 		}
 		if (document.signupForm.mpwd.value.length < 8 || document.signupForm.mpwd.value.length > 16) {
			alert("비밀번호를 8~16자 이내로 입력하세요.");
			document.signupForm.mpwd.select();
			return false;
 		}
 		if (document.signupForm.mpwd.value != document.signupForm.pw_ck.value) {
 			alert("비밀번호가 일치하지 않습니다.");
 			document.singupForm.pw_ck.select();
 			return false;
 		}
 		if ($("#memail1").val() == "" && $("#memail2").val() == "") {
 			alert("이메일을 입력해주세요."); 	
 			document.signupForm.memail1.focus();
 			return false; 			
 		}
 		if ($("#mname").val() == ""){
 			alert("이름을 입력해주세요.");
 			document.signupForm.mname.focus();
 			return false;
 		} 	
 		if (!isNaN(document.signupForm.mname.value.substr(0,1))){
 			alert("이름은 숫자로 시작할 수 없습니다.");
 			document.signupForm.mname.select();
 			return false;
 		} 	
 		if (!regExpName.test(document.signupForm.mname.value)){
 			alert("이름은 한글만 입력해주세요!");
 			document.signupForm.mname.select();
 			return false;
 		}
 		if (!regExpPhone.test(document.signupForm.mphone.value)){
 			alert("연락처 입력을 확인해주세요!");
 			document.signupForm.mphone.focus();
 			return false;
 		}
 		if (cnt == 0) {
 			alert("아이디 중복검사를 해주세요.");
 			return false;
 		}
 		$("#totalEmail").val($("#memail1").val() + $("#middle").text() + $("#memail2").val()); 		
		document.signupForm.submit();
		alert("회원이 되신 것을 축하합니다!");
 	} 
 

 	$("#cancle").click(function(){
		console.log(document.getElementById(cancle));
		if (document.getElementById(cancle) == null){
			alert("회원 가입이 취소되었습니다.");
			location.href = "${cp}/"; 		
		}
 	});
</script>






