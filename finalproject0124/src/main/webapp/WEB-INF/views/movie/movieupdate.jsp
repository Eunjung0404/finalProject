<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>영화 목록 업데이트</h1>
<form method="post" action="${cp }/movie/update?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
	<input placeholder="영화이름" type="text" name="moviename"><br>
		<input placeholder="상영시간" type="text" name="runtime"><br>
		<input placeholder="감독" type="text" name="director"><br>
		<input placeholder="장르" type="text" name="genre"><br>
		<input placeholder="관람등급" type="text" name="rating"><br>
		<input placeholder="국가" type="text" name="country"><br>
		<input placeholder="배우정보" type="text" name="actorinfo"><br>
		<input placeholder="예고편 주소" type="text" name="video"><br>
		<input placeholder="예매율" type="hidden" name="count" value="0"><br>
		파일명: ${vo.movieimg }<br>
		<input type="file" name="moviefile"><br>
		<input type="submit" value="수정" style="margin:6px; background-color: #196ab3; min-width: 70px; 
			border: none; line-height: 30px; color: #ffffff; cursor: pointer;">
</form>
</body>
</html>