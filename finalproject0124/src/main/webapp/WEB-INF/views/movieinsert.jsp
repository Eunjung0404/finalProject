<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homemovietest.jsp</title>
</head>
<body>
<h1>영화 업로드</h1>
<form method="post" action="${pageContext.request.contextPath }/movieinsert" enctype="multipart/form-data">
	영화이름 <input type="text" name="moviename"><br>
	상영시간 <input type="text" name="runtime"><br>
	감독 <input type="text" name="director"><br>
	장르 <input type="text" name="genre"><br>
	관람등급 <input type="text" name="rating"><br>
	국가 <input type="text" name="country"><br>
	배우정보 <input type="text" name="actorinfo"><br>
	개봉일 <input type="text" name="opendate"><br>
	첨부파일<br>
	<input type="file" name="file1"><br>
	<input type="submit" value="확인">
</form>
</body>
</html>