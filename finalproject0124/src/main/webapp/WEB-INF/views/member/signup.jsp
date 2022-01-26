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
	<form:form method="post" action="${cp }/signup" id="membercheck" name="member">
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
					<div class="valid">비밀번호를 입력하세요.(영문 대/소문자, 숫자를 모두 포함)</div>
				</td>
			<tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" title="비밀번호 확인" id="pw_ck" name="pw_ck" class="chk">
					<div class="vaild">비밀번호를 다시 입력하세요.</div>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" title="이메일" id="memail" name="memail" class="chk" placeholder="EMAIL">
					<div class="valid">이메일을 입력하세요.</div>
				</td>
			</tr>			
			<tr>
				<th class="w-px160">성명</th>
				<td><input type="text" class="form-control" id="mname" name="mname" placeholder="NAME">
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="birth">
					<span id="delete" style="color: red; position: relative; right: 25px; display: none;"><i class="fas fa-times font-img"></i></span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="mphone" name="mphone">
<!-- 					<input type="text" name="tel"> - -->
<!-- 					<input type="text" name="tel"> - -->
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


		<input type="submit" value="회원가입">
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
					span.innerHTML = "사용중인 아이디 입니다.";
				} else{
					span.innerHTML = "사용가능한 아이디 입니다.";
				}
				
			}
		}
		xhr.open('get','${cp}/idCheck?mid=' + id, true);
		xhr.send();
	}
</script>





