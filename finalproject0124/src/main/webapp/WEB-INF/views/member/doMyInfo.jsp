<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div>
    	<form method="get" action="${cp }/member/doMyinfo?mid=${vo.mid }&mphone=${vo.mphone }">
	    	<input type="text" name="mid" placeholder="아이디">
	    	<input type="text" name="mphone" placeholder="전화번호">    	
	    	<input type="submit" value="확인">
    	</form>
    </div>