<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieinsert.jsp</title>
<style type="text/css">
	div#movieinsertform{
		width:800px; heigth:450px; border:solid 1px #BDBDBD; text-align:center;
		margin:auto; margin-top:40px; 
	}
	input{
		width: 150pt; height:25pt; border-radius: 2px; margin:3px;
	}
	
</style>
</head>
<body>
<div id="movieinsertform">
	<h2>영화 업로드</h2>
	<form method="post" action="${cp }/movie/movieinsert?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		<input placeholder="영화이름" type="text" name="moviename"><br>
		<input placeholder="상영시간" type="text" name="runtime"><br>
		<input placeholder="감독" type="text" name="director"><br>
		<input placeholder="장르" type="text" name="genre"><br>
		<input placeholder="관람등급" type="text" name="rating"><br>
		<input placeholder="국가" type="text" name="country"><br>
		<input placeholder="배우정보" type="text" name="actorinfo"><br>
		<input placeholder="개봉일" type="date" name="opendate"><br>
		<input placeholder="영화상태" type="text" name="state"><br>
		<input placeholder="예고편 주소" type="text" name="video"><br>
		<input type="file" name="moviefile"><br>
		<input type="submit" value="업로드" style="margin:6px; background-color: #196ab3; min-width: 70px; 
			border: none; line-height: 30px; color: #ffffff; cursor: pointer;">
	</form>
</div>
</body>
</html>