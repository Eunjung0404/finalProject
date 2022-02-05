<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div>
    	<form method="get" action="${cp }/member/doMyinfo?mid=${vo.mid }&mphone=${vo.mphone }">
	    	<input type="password" name="mpwd" id="mpwd" placeholder="비밀번호를 입력하세요.">	
	    	<input type="submit" value="확인">
    	</form>
    </div>