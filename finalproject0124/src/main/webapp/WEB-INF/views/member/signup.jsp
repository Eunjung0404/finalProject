<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    <h3>회원가입</h3>
    
    <form:form method="post" action="${pageContext.request.contextPath }/member/signup">
    	아이디
    	<br>
    	<input type="text" name="mid">    	
    	<br>
    	비밀번호
    	<br>
    	<input type="password" name="mpwd">
    	<br>
    	이름
    	<br>
    	<input type="text" name="mname">
    	<br>
    	이메일
    	<br>
    	<input type="text" name="memail">
    	<br>
    	주소
    	<br>
    	<input type="text" name="maddr">
    	<br>
    	전화번호
    	<br>
    	<input type="text" name="mphone">
    	<br>	
    	생년월일
    	<br>
    	<input type="text" name="birth">
    	<br>
    	<input type="submit" value="회원가입">
    </form:form>