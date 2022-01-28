<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
</head>
<body>
<form method="post" action="${cp }/movie/addmovieimg?${_csrf.parameterName}=${_csrf.token}"></form>
<div id="mainimg">
	
</div>
<div>
	<p class="title">${vo.title }</p>
	<p class="content">${vo.opendate } | ${vo.runtime }분 | ${vo.rating } | ${vo.genre } | ${vo.country }</p>
</div>
<a href="#">예매</a>
<div>
배우정보: ${actorinfo }

예고편주소: ${video }



</div>
<!-- 기본정보 배우정보 및 영상등등 -->
<div>
	<hr>
		
	<hr>
</div>
</body>
</html>