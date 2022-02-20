<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<style type="text/css">
	#backgroundColor{background-color: #f5f5f5; width: 100%; height: 100%;}
	.maincontainer{width:900px; border-width: none; margin: auto;}
	
	#btnReserve{width:160px; height:55px; text-align: center; color:white; background:#ec6159; border:0;}
	.title{font: boldder;}
	
	#movietext{color: #777;}
	.movietext1{color: #777; border-left:1px solid #e5e5e5; padding-left: 10px; margin-right: 5px;}
	.movietext2{color: #777;}
	
	#searchresult{text-align: center; padding: 60px 0 50px; font-size:30px; font-weight:bolder; color:#2b2b2b;}
	
	.searchli{list-style: none; color: #777; font-size: 13px; margin:auto; padding-top:0; width:454px;}
</style>
<script type="text/javascript" src="/spring13/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<div id="backgroundColor">
	<div id="searchresult">검색 결과</div><br>
	<div class="maincontainer">
	<c:choose>
	<c:when test="${fn: length(list) > 0 }">
		<c:forEach var="vo" items="${list }">
			<div class="row" id="mainposter">
				<div class="col-md-4 text-center" id="poster">
					<a href="${cp }/movie/detail?moviecode=${vo.moviecode}"><img class="" src="${cp }/resources/images/movieupload/${vo.movieimg}" style="width:200px; height:100%;"></a>
				</div>
				<div class="col-md-7" id="moviebox">
					<div class="col-sm-12 text-left" >
						<h4 class="title">${vo.moviename }</h4><br>
						<span id="movietext">${vo.opendate } 개봉</span>
						<span class="movietext1">${vo.runtime }분</span>
						<span class="movietext1">${vo.rating }</span>
						<span class="movietext1">${vo.genre }</span>
						<span class="movietext1">${vo.country }</span><br><br>
						<span class="movietext2">감독 : </span><span>${vo.director }</span><br>
						<span class="movietext2">배우 : </span><span>${vo.actorinfo }</span><br><br>
						<button type="button" id="btnReserve" onclick="">예매</button>
						
					</div>
				</div>
			</div>
			<p><hr></p>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<p style="text-align: center; color:#2b2b2b; font-size:18px; font-weight:bold;">검색된 결과가 없습니다.</p>
		<ul>
			<li class="searchli">- 단어의 철자가 정확한지 확인해 보세요.</li>
			<li class="searchli">- 한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.</li>
			<li class="searchli" style="margin-bottom: 80px;">- 검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.</li>
		</ul>
	</c:otherwise>
	</c:choose>
	</div>
	</div>
</div>
</body>
</html>