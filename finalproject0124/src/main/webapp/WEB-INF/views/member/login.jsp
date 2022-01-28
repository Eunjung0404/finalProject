<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
#find_id {
	font-size: 13px;
}

#find_pwd {
	font-size: 13px;
}
div .main {
	padding-top: 10%;
}
div .button {
	padding-top: 5%;
	padding-left: 30%;
	
}
form {
	margin-left: 35%;
}
table tr td {	
	text-align: left;
}
</style>


<div class="main">
	<form:form method="post" action="${cp }/login" onsubmit="return subm(this)" name="submitForm">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="username"></td>
			</tr>			
			<tr>
				<th>비밀번호</th>				
				<td><input type="password" name="password"></td>
			</tr>
		</table>
<!-- 			<input type="submit" value="로그인" id="login"><br> -->			
	</form:form>
</div>
<div class="button">
	<button type="button" class="btn btn-primary" onclick="subm()" style="width: 200pt;">로그인</button><br>
	<a href="${cp }/findId" id="find_id" >아이디 찾기</a>
	<a href="#" id="find_pwd">비밀번호 찾기</a>
</div>
<script>
	function subm(){
		document.submitForm.submit();
	}
</script>