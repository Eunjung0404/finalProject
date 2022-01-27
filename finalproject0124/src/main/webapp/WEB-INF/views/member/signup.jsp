<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style type="text/css">
	table tr td {
		text-align: left;
	}
	table tr td input[name=tel] {
		width: 40px;
	}
	table tr td input[name=addr] {
		width: calc(100% - 14px);
		/* {속성값 !important } 우선순위 지정 */
	}
	.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
	}
	.valid, .invalid {
		font-size: 11px;
		font-weight: bold;
	}
	.valid { color: green;}
	.invalid { color: red;}
</style>
	<h3>회원가입</h3>
	<p class="w-pct60 right" style="margin: 0 auto; padding-bottom; 5px; font-size: 13px;"></p>
	<form:form method="post" action="${cp }/signup" id="membercheck" name="signupForm" onsubmit="return validation(this)">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" title="아이디" id="mid" name="mid" class="chk" placeholder="ID"/>
					<input type="button" value="중복확인" onclick="idCheck()"><span id=id_check></span>
					<div class="valid">아이디를 입력하세요.(5~12글자)</div>
				</td>
			</tr>
			<tr>	
				<th>비밀번호</th>
				<td>
					<input type="password" title="비밀번호" name="mpwd" id="mpwd" placeholder="PASSWORD" class="chk" >
					<div class="valid">비밀번호를 입력하세요.(8~16글자, 영문 대/소문자, 숫자를 모두 포함)</div>
				</td>
			<tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" title="비밀번호 확인" id="pw_ck" name="pw_ck" class="chk">
					<div class="vaild" id="confirmMsg"></div>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" title="이메일" id="memail" name="memail" class="chk" placeholder="EMAIL" >@
					<select>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="kakao.com">kakao.com</option>
					</select>
					<div class="valid">이메일을 입력하세요.</div>
				</td>
			</tr>			
			<tr>
				<th>성명</th>
				<td>
					<input type="text" class="chk" title="이름" id="mname" name="mname" placeholder="NAME" >
					<div class="valid">이름을 입력하세요.</div>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="birth">
					<span id="delete" style="color: red; position: relative; right: 25px; display: none;"><i class="fas fa-times font-img"></i></span>
					<div class="valid">ex)1999-01-01</div>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>					
					<input type="text" id="mphone" name="mphone" maxlength="11"  placeholder="-없이 숫자만 입력">
<!-- 					<input type="text" name="tel"> -->
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<a class="btn-fill-s" onclick="daum_post()">우편번호 찾기</a>
					<input type="text" name="post" class="w-px60" readonly>
					<input type="text" name="maddr" readonly>
					<input type="text" name="maddr" >					
				</td>
			</tr>
		</table>


		<input type="submit" value="회원가입" onclick="validation()">
		<input type="button" value="취소" id="cancle" onclick="cancl()">
	</form:form>

<!-- <script>
	$('#btn-id').on('click', function(){
		id_check();
	});
	
	function id_check(){
		var $id = $('[name=id]');
		if($id.hasClass('chked')) return;
		console.log('go_check');
		
		var data = join.tag_status($id);
		if(data.code != 'valid'){
			alert('아이디 중복 확인 불필요\n' + data.desc);
			$id.focus();
			return;
		}
		$.ajax({
			type: 'post',
			url: 'id_check',
			data: {id: $id.val()},
			success: function(data){
				data = join.id_usable(data);
				display_status($id.siblings('div'), data);
				$id.addClass('chked');
			},
			error: function(req, text){
				alert(text + ': ' + req.status);
			}
		});
	}
</script> -->



 <script>
 	function validation(){	
 		// 데이터 유효성 검사 정규식 표현
//  		var regExpId = /^[a-zA-Z | ㄱ-ㅎ | ㅏ-ㅣ | 가-힣]/;
//  		var regExpName = /^[가-힣]*$/;
//  		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
//  		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z](-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}&/i;
 		
 		var form = document.signupForm;
 		
 		var id = form.mid.value;
 		var pwd = form.mpwd.value;
 		var name = form.mname.value;
//  		var phone = form.mphone.value;
//  		var email = form.memail.value;

 		if (id == ""){
 			alert("아이디를 입력하세요.");
 			form.mid.focus(); 		
 			return false;
 		}
 		if (id.length < 5 || id.length > 12) {
			alert("아이디를 5~12자 이내로 입력하세요.");
			form.mid.select();
			return false;
 		}
 		if (pwd == ""){
			alert("비밀번호를 입력하세요.");
 			form.mpwd.focus();
 			return false;
 		}
 		if (pwd.length < 5 || pwd.length > 12) {
			alert("비밀번호를 5~12자 이내로 입력하세요.");
			form.mpwd.select();
			return false;
 		}
 		
 		
//  		if (!regExpId.test(id)) {
// 				alert("아이디는 문자로 시작해주세요!");
// 				form.id.select();
// 				return false;
// 		}
//  		if (!isNaN(name.substr(0,1))){
//  			alert("이름은 숫자로 시작할 수 없습니다.");
//  			form.mname.select();
//  			return false;
//  		} 	
//  		if (!regExpName.test(name)){
//  			alert("이름은 한글만 입력해주세요!");
//  			form.mname.select();
//  			return false;
//  		}
//  		if (!regExpPhone.test(phone)){
//  			alert("연락처 입력을 확인해주세요!");
//  			form.mphone.focus();
//  			return false;
//  		}
//  		if (!regExpEmail.test(email)){
//  			alert("이메일 입력을 확인해주세요!");
//  			form.memail.focus();
//  			return false;
//  		}
 		
 		

// 		document.signupForm.submit();

		form.submit();
 	}
 
// 	function idCheck(){
// 		let id = document.getElementById("mid").value;
// 		if (id == '') return;
// 		let xhr = new XMLHttpRequest();
// 		xhr.onreadystatechange=function(){
// 			if (xhr.readyState == 4 && xhr.status == 200){
// 				let data = xhr.responseText;
// 				console.log(data);
// 				let json = JSON.parse(data);
// 				let span = document.getElementById("id_check");
// 				if (json.using == true){
// 					span.innerHTML = "사용중인 아이디 입니다.";
// 				} else{
// 					span.innerHTML = "사용가능한 아이디 입니다.";
// 				}
				
// 			}
// 		}
// 		xhr.open('get','${cp}/idCheck?mid=' + id, true);
// 		xhr.send();
// 	}
	
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





