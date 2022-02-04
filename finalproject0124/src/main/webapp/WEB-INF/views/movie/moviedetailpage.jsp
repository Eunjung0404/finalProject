<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<style type="text/css">
	div.comment_cont{position:relative; padding:30px 180px 30px 30px; width:1198px; height:134px;}
	#btnadd{position:absolute; width:146px; height:134px; color:#fff; background:#ec6159; cursor:pointer; border:none;}
	
	#btnReserve{width:160px; height:55px; text-align: center; color:black; background:none; border:1px solid black;}
</style>
<script type="text/javascript" src="/spring13/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<form method="post" action="${cp }/movie/addmovieimg?${_csrf.parameterName}=${_csrf.token}"></form>
<div id="mainimg">
	<!-- 포스터 -->
	<img class="" src="${cp }/resources/images/movieupload/${vo.movieimg}" style="width:290px; height:416px;">
</div>
<div>
	<h3 class="title">${vo.moviename }</h3>
	<p class="content">${vo.opendate } | ${vo.runtime }분 | ${vo.rating } | ${vo.genre } | ${vo.country }</p>
</div>
<div class="btn_area">
	<button type="button" id="btnReserve" onclick="">예매</button>
</div>
<div>
배우정보: ${vo.actorinfo }<br>

동영상<br>
<iframe width="1246" height="701" src="https://www.youtube.com/embed/W7edvITC9g4" title="YouTube video player" 
frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>




</div>
<!-- 기본정보 배우정보 및 영상, 스틸컷 등등 -->
<div>
	<hr>
		<p>기본정보 배우정보 및 영상, 스틸컷 등등</p>
	<hr>
</div>
<!-- 평점 -->
<div id="commentsForm">
	<p id="reviewtitle">평점</p>
	<div class="comment_top">
		<span>나의 평점</span>
		<div class="star_area" id="star_eve">
			
		</div>
	</div>
	<div class="comment_cont">
		<textarea placeholder="별점을 먼저 선택하신 후, 감상을 남겨주세요." rows="3" cols="40" id="reviewcomment"></textarea>
		<input type="button" value="등록" id="btnadd" onclick="commentbtn()">
	</div>
</div>
</body>
</html>