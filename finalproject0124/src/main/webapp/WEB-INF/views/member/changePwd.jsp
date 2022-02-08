<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>




<form:form action="${cp }/changePwd" method="POST" class="content" name="changePwdForm" onsubmit="return changePwd(this)">
	<table>
		<tr>
			<th>현재 비밀번호</th>
			<td><input type="password" name="mpwd" id="mpwd" value="${mpwd.mpwd }"></td>
		</tr>
		<tr>
			<th>새 비밀번호</th>
			<td><input type="password" name="mpwd" id="mpwd1"></td>		 
		</tr>
		<tr>
			<th>새 비밀번호 재입력</th>
			<td><input type="password" id="mpwd2" onchange="isSame();"></td>
		</tr>
		
	</table>
	<span id=same></span>
	<br><br>
	<input type="hidden" name="memail" value="${memail }">
</form:form>
	<input type="button" id="check" value="비밀번호 변경" onclick="changePwd()">

<script>
	let mpwd1 = document.getElementById("mpwd1").value;
	let mpwd2 = document.getElementById("mpwd2").value;
	
	function changePwd(){
		if(mpwd1 != mpwd2) {
			alert("비밀번호가 올바르지 않습니다.");		
			return false;
		} 
		document.changePwdForm.submit;
	}
</script>