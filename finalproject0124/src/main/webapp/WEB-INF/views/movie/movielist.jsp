<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트 목록</title>
<style type="text/css">
	tr th td{
		border:solid 1px #BDBDBD;
	}
</style>
</head>
<body>
<h1>영화 목록 리스트</h1>
<table style="border:solid 2px #BDBDBD; width:700px; margin:auto; margin-top:40px;">
	<tr>
		<th>영화코드</th><th>영화이름</th><th>대표이미지</th><th>영화상태</th><th>스틸컷 추가</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.moviecode }</td>
			<td>${vo.moviename }</td>
			<td>${vo.movieimg }</td>
			<td>${vo.state }</td>
			<td><a href="${cp }/movie/addmovieimg?moviecode=${vo.moviecode}">추가하기</a></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>