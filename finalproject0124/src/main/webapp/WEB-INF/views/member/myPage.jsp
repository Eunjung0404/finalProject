<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<div id=content>
	<div class="infoBox">
		<p><a href="${cp }/member/withdrawal">회원 탈퇴 테스트</a></p>
		<p><a href="#">예매/구매내역</a></p>
		<p><a href="#">예매/구매내역</a></p>
		<p><a href="#">예매/구매내역</a></p>
		<p><button onclick="myInfo()">내 정보 보기</button></p>
	</div>
</div>

<script>
	function myInfo(){
		location.href="${cp}/member/myinfo";
	}
</script>