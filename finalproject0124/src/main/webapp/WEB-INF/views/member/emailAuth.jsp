<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <span>입력한 이메일로 받은 인증번호를 입력하세요.(인증번호가 맞아야 비밀번호를 변경하실 수 있습니다.)</span>
    <br>
    <br>
    
    <form:form method="post" action="${cp }/emailAuthVali">
    	<input type="hidden" name="num" value="${num}">
    	<div class=content>
    		<div class="textbox">
    			인증번호 입력: <input type="text" name="emailAuth" placeholder="인증번호를 입력하세요.">
    			<div class="error"></div>
    		</div>
    	</div><br>
    	
    	<input type="submit" id="check" value="인증번호 전송">
    </form:form>