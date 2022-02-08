<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<form:form action="${cp }/member/doMyinfo">
	<input type="text" name="mname" placeholder="이름을 입력해주세요.">
	<input type="email" name="memail" placeholder="이메일을 입력해주세요.">
	<input type="submit" value="확인">
</form:form>

