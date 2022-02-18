<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 검색</title>
<style type="text/css">
	#backgroundColor{background-color: #f5f5f5;}
	
	#btnReserve{width:160px; height:55px; text-align: center; color:white; background:#ec6159; border:0;}
</style>
<script type="text/javascript" src="/spring13/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<div id="backgroundColor">
	<h3>검색 결과</h3>
	<div class="maincontainer"></div>
	<c:choose>
	<c:when test="${fn: length(list) > 0 }">
		<c:forEach var="vo" items="${list }">
			<div class="row" id="mainposter">
				<div class="col-md-4 text-center" id="poster">
					<a href="${cp }/movie/detail?moviecode=${vo.moviecode}"><img class="" src="${cp }/resources/images/movieupload/${vo.movieimg}" style="width:290px; height:416px;"></a>
				</div>
				<div class="col-md-8" id="moviebox">
					<div class="col-sm-12 text-left">
						<h4 class="title">${vo.moviename }</h4><br>
						${vo.opendate } 개봉 | ${vo.runtime }분 | ${vo.rating } | ${vo.genre } | ${vo.country }<br>
						<button type="button" id="btnReserve" onclick="">예매</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<p>검색된 결과가 없습니다.</p>
	</c:otherwise>
	</c:choose>
	</div>
</div>
</body>
</html>