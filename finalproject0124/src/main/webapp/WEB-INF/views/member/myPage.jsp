<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" 	uri="http://www.springframework.org/security/tags"%>

<style>

 	div .infoBox {
 		position: relative;
 		padding-left: 5%;
  		padding-top: 5%; 
  		padding-bottom: 2%; 
  		
  		margin-top: 10%;
  		margin-right: 80%;
  		
		border: 2px solid #000000;
		border-radius: 20px;
/* 		margin-right: 150px; */
		
	} 
	div #content {
		

 			
	}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="username" />
</sec:authorize>


<div id=content>
	<div class="infoBox">
		<p><a href="#">예매/구매내역</a></p>
		<p><a href="#">예매/구매내역</a></p>
		<p><a href="#">예매/구매내역</a></p>
		<p><a href="${cp }/member/myinfo">내 정보 보기</a></p>
		<p>${username }</p>
	</div>
</div>


