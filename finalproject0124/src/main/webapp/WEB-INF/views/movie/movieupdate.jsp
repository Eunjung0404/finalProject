<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div#movieupdateform{
		width:800px; heigth:450px; border:solid 1px #BDBDBD; text-align:center;
		margin:auto; margin-top:20px; 
	}
	input{width: 150pt; height:25pt; border-radius: 2px; margin:3px;}
	
	h1{text-align:center; padding: 20px 0 5px;}
</style>
</head>
<body>
<h1>영화 목록 업데이트</h1>
<div id="movieupdateform">
	<form:form method="post" action="${cp }/movie/update" enctype="multipart/form-data">
		<input type="hidden" name="moviecode" value=${vo.moviecode }>
		<input placeholder="영화이름" type="text" name="moviename" value="${vo.moviename }"><br>
		<input placeholder="상영시간" type="text" name="runtime" value="${vo.runtime }"><br>
		<input placeholder="감독" type="text" name="director" value="${vo.director }"><br>
		<input placeholder="장르" type="text" name="genre" value="${vo.genre }"><br>
		<input placeholder="관람등급" type="text" name="rating" value="${vo.rating }"><br>
		<input placeholder="국가" type="text" name="country" value="${vo.country }"><br>
		<input placeholder="배우정보" type="text" name="actorinfo" value="${vo.actorinfo }"><br>
		<input placeholder="개봉일" type="date" name="opendate" value="${vo.opendate }"><br>
		<input placeholder="영화 상태" type="text" name="state" value="${vo.state }"><br>
		<input placeholder="예고편 주소" type="text" name="video" value="${vo.video }"><br>
		<input placeholder="예매율" type="hidden" name="count" value="0"><br>
		파일명: ${vo.movieimg }<br>
		<input type="file" name="file1"><br>
		<input type="submit" value="수정" style="margin:6px; background-color: #196ab3; min-width: 70px; 
				border: none; line-height: 30px; color: #ffffff; cursor: pointer;">
	</form:form>
</div>
</body>
</html>