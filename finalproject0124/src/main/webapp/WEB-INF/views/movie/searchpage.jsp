<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 검색</title>
</head>
<body>
<h2>검색</h2>
<c:forEach var="vo" items="${list }"> 
<div>
	<img class="" src="${cp }/resources/images/movieupload/${vo.movieimg}" style="width:290px; height:416px;">
</div>
<div>
	${vo.moviename }
</div>
</c:forEach>
</body>
</html>