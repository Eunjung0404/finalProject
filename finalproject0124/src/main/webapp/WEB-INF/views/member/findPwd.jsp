<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>




<div class="findPwdForm">
	<form:form action="${cp}/emailAuth" method="post" name="find_pwd_form">
		<div class="textbox">
			<input type="text" id="mname" name="mname" placeholder="이름을 입력하세요."/>
		</div>
		
		<div class="textbox">
			<input type="email" id="memail" name="memail" placeholder="이메일을 입력하세요."/>
		</div><br><br>
		
		<input type="submit" id="check" value="비밀번호 찾기">
</form:form>
</div>