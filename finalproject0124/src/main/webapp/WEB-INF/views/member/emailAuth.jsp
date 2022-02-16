<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
	div #textBox {
		position: relative;
		padding-left: 50px;
		padding-top: 50px;
		padding-right: 100px;
		padding-bottom: 200px;		
		padding-top: 200px;
		margin: 0 auto;
		text-align: center;
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
	#emailAuth{
		height: 50px;
		width: 200px;
		text-align: center;
		border-radius: 8px;
		border: 0px;
	}
</style>

<div id="textBox">
    <span>입력한 이메일로 받은 인증번호를 입력하세요.(인증번호가 일치해야 비밀번호를 변경하실 수 있습니다.)</span>
    <br>
    <br>
    
    <form:form method="post" action="${cp }/emailAuthVali">
    	<input type="hidden" name="num" value="${num}">
    	<div class=content>
    		<div class="textbox">
    			<strong>인증번호 입력: </strong><input type="text" name="emailAuth" id="emailAuth" placeholder="인증번호를 입력하세요." maxlength="6">
    			<div class="error"></div>
    		</div>
    	</div><br>
    	
    	<input type="submit" id="check" value="인증번호 전송">
    </form:form>
</div>