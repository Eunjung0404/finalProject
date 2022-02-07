<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<style type="text/css">
	div.comment_cont{position:relative; padding:30px 180px 30px 30px; width:1198px; height:134px;}
	#btnadd{position:absolute; width:146px; height:134px; color:#fff; background:#ec6159; cursor:pointer; border:none;}
	
	#btnReserve{width:160px; height:55px; text-align: center; color:black; background:none; border:1px solid black;}
	
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:#ec6159;}

</style>
<script type="text/javascript" src="/spring13/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<form method="post" action="${cp }/movie/addmovieimg?${_csrf.parameterName}=${_csrf.token}"></form>
<div class="maincontainer" id=""> 
	<!-- 포스터 영화 내용 -->
	<div class="row" id="mainposter">
		<div class="col-md-4 text-center" id="poster">
			<img class="" src="${cp }/resources/images/movieupload/${vo.movieimg}" style="width:290px; height:416px;">
		</div>
		<div class="col-md-8" id="moviebox">
			<div class="col-sm-12 text-left"> 
			<h2 class="title">${vo.moviename }</h2>
			<p class="content">${vo.opendate } 개봉 | ${vo.runtime }분 | ${vo.rating } | ${vo.genre } | ${vo.country }</p>
				<button type="button" id="btnReserve" onclick="">예매</button>
		</div>
	</div>
</div>

배우정보: ${vo.actorinfo }<br>

동영상<br>
<iframe width="1246" height="701" src="${vo.video }" title="YouTube video player" 
frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>




</div>
<!-- 기본정보 배우정보 및 영상, 스틸컷 등등 -->
<div>
	<hr>
		<p>기본정보 배우정보 및 영상, 스틸컷 등등</p>
	<hr>
</div>
<!-- 평점 -->
<div id="commentsForm">
	<p id="reviewtitle">평점</p>
	<div class="comment_top">
		
	<form action="commentWriteOk">
	<span>나의 평점</span>
		<p class="star_rating">
		    <a href="#" class="on">★</a>
		    <a href="#" class="on">★</a>
		    <a href="#" class="on">★</a>
		    <a href="#">★</a>
		    <a href="#">★</a>
		</p>
		<div class="comment_cont">
			<textarea placeholder="별점을 먼저 선택하신 후, 감상을 남겨주세요." rows="3" cols="40" id="reviewcomment"></textarea>
			<input type="button" value="등록" id="btnadd">
		</div>
	</form>
	</div>
</div>
</div>
</body>
<script type="text/javascript">
	//별점 관련
	$( ".star_rating a" ).click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    return false;
});
	
</script>
</html>