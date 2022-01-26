<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    

  
  <div>
	 <form:form method="post" action="${cp }/login">
	 	아이디<br>
	 	<input type="text" name="username">
	 	<br>
	 	비밀번호<br>
	 	<input type="password" name="password">
	 	<br>
	 	<br>
	 	
	 	<input type="submit" value="로그인">
	</form:form>
</div>