<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
	div .content {
		padding-left: auto;
		padding-right: auto;
	}
	table {
		margin-left: 150px;	
		border-top: 1px solid ;			
	}
	tbody {
		display: table-row-group;
		vertical-align: middle;
		border-color: inherit;
	}
	tr {
		display: table-row;
		vertical-align: inherit;;
		border-color: inherit;;
		border-bottom: 1px solid #d1d5dd;
	}
	th {
		background-color: #f7f8f9;		
	}	
	.bord-form tbody td, .board-form tbody th {
		position: relative;
		height: 50px;
		padding: 7px 15px;
		text-align: left;
		border-bottom: 1px solid #d1d5dd;
	}
	table td {
		padding-left: 15px;
	}
	div .title {
		padding-top: 100px;
		padding-left: 150px;
	}
	p {
		margin-left: 150px;
		margin-bottom: 10px;
	}
	div #btn {
		text-align: center;
	}
	.changePwdForm {
		margin: auto;
	}
	#check {
		border: 0;
		color: #fff;
		background-color: #503396;
		height: 46px;
		padding: 0 30px;
		border-radius: 4px;
		margin-right: 10px;
	}
	#check1 {
		border-width: 0.5px;
		border-color: #503396;
		color: #503396;
		background-color: #fff;
		height: 46px;
		padding: 0 30px;
		border-radius: 4px;
	}	
</style>

<div class="content">
<div class="title">
	<h1>비밀번호 변경</h1>
</div>
<p>•현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</p>

<form:form action="${cp }/changePwd" method="POST" class="changePwdForm" name="changePwdForm" onsubmit="return changePwd(this)">
	<table class="board-form">
		<tbody>
			<tr>
				<th scope="row">
					<label for="pwnow">현재 비밀번호</label>
				</th>
				<td><input type="password" name="mpwd" id="mpwd" ></td>
			</tr>
			<tr>
				<th scope="row">
					<label for="pwnew">새 비밀번호</label>
				</th>
				<td><input type="password" name="mpwd" id="mpwd1"><span style="font-size: 13px; font-style: italic; margin-left: 10px">※8~16글자, 영문 대/소문자, 숫자를 모두 포함</span></td>
			</tr>
			<tr>
				<th scope="row">
					<label for="repwnew">새 비밀번호 재입력</label>
				</th>
				<td><input type="password" id="mpwd2" onchange="isSame();"></td>
			</tr>		
		</tbody>
	</table>
	
	<br>
	<br>
	
	<input type="hidden" name="memail" value="${memail }">
</form:form>

<p>•생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</p>
<p>•비밀번호는 3~6개월마다 꼭 바꿔주세요.</p>
<p>•비밀번호 변경시 로그아웃됩니다. 변경한 비밀번호로 다시 로그인해주세요.</p><br><br>
	<div id="btn">
		<button type="button" id="check" onclick="changePwd()">수정</button>
		<button type="button" id="check1" onclick="changePwdCancle()">취소</button>
	</div>
</div>



<script>
	let mpwd1 = document.getElementById("mpwd1").value;
	let mpwd2 = document.getElementById("mpwd2").value;
	
	function changePwd(){
		if(mpwd1 != mpwd2) {
			alert("비밀번호가 일치하지 않습니다.");		
			return false;
		} 
		document.changePwdForm.submit;
	}
	function changePwdCancle(){
		location.href="${cp}/member/mypage";
	}
</script>