<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트 목록</title>
<style type="text/css">
	tr, th, td{border:solid 1px #BDBDBD; text-align:center;}
	
	#pageing{margin:auto;}
	
	h1{text-align:center; padding: 20px 0 5px;}
</style>
</head>
<body>
<h1>영화 목록 리스트</h1>
<table style="border:solid 2px #BDBDBD; width:700px; margin:auto; margin-top:20px;">
	<tr>
		<th>영화코드</th><th>영화이름</th><th>대표이미지</th><th>영화상태</th>
		<th>스틸컷 추가</th><th>수정하기</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.moviecode }</td>
			<td>${vo.moviename }</td>
			<td>${vo.movieimg }</td>
			<td>${vo.state }</td>
			<td><a href="${cp }/movie/addmovieimg?moviecode=${vo.moviecode}">추가하기</a></td>
			<td><a href="${cp }/movie/update?moviecode=${vo.moviecode}">수정</a></td>
		</tr>
	</c:forEach>
</table>

<div style="text-align: center;">
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${1==param.pageNum }">
				<a href="${cp }/admin/movie/list?pageNum=${i}"><span style='color:blue'>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/movie/list?pageNum=${i}"><span style='color:gray'>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<span style="text-align: center;"><a href="${cp }/admin/movie/movieinsert">영화 등록하기</a></span>
</body>
</html>