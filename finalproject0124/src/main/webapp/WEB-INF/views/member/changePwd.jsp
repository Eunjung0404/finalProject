<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form action="${cp }/changePwd" method="POST" class="content">
	<div class="textbox">
		<input type="password" name="mpwd" id="mpwd">
		<label>새 비밀번호</label>
		
	</div>
	
<!-- 	<div class="textbox"> -->
<!-- 		<input type="password" id="mpwd2" onchange="isSame();"> -->
<!-- 		<label>새 비밀번호 확인</label> -->
<!-- 		<div class="error"> -->
<!-- 			Invalied password -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	<span id=same></span>
	<br><br>
	<input type="hidden" name="memail" value="${memail }">
	<input type="submit" id="check" value="비밀번호 변경">
</form:form>