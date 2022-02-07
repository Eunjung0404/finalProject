<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<form method="post" action="${cp}/admin/login">
		아이디 <input type="text" name="aid"><br>
		비밀번호 <input type="password" name="apwd"><br>
		<!-- <input type="text" name="${_csrf.parameterName }" value="${_csrf.token }">-->
		<input type="submit" value="로그인">
	</form>
</div>

