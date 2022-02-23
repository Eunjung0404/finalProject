<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp</title>
<style type="text/css">
	#backgroundColor{background-color:#f5f5f5;}
	
	#result{margin: 0 auto; text-align:center; width:500px; border:solid 1px #BDBDBD; margin-top: 50px; margin-bottom: 50px; background-color: white;}
	.listbtn{background-color: #196ab3; min-width: 70px; 
			border: none; line-height: 30px; color: #ffffff; cursor: pointer; margin-top:30px; margin-bottom: 30px;}
	.h1font{margin-top: 20px;}
</style>
</head>
<body>
<div id="backgroundColor">
	<div id="result">
		<c:choose>
			<c:when test="${msg=='success' }">
				<h1 class="h1font">요청작업 성공!!</h1>
			</c:when>
			<c:otherwise>
				<h1 class="h1font">요청작업 실패!!</h1>
			</c:otherwise>
		</c:choose>
		<button type="button" class="listbtn" onclick="location.href='${cp }/admin/movie/list'">리스트 페이지로</button>
		<button type="button" class="listbtn" onclick="location.href='${cp }/'">홈으로</button>
	</div>
</div>
</body>
</html>