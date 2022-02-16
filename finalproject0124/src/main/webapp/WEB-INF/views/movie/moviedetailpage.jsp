<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<style type="text/css">
	#backgroundColor{background-color:#f5f5f5;}
	
	div.comment_cont{position:relative; padding:30px 180px 30px 30px; width:1198px; height:134px;}
	#btnadd{position:absolute; width:146px; height:134px; color:#fff; background:#ec6159; cursor:pointer; border:none;}
	#btnNotLogin{position:absolute; width:146px; height:134px; color:#fff; background:#ec6159; cursor:pointer; border:none;}
	
	#star_span{color:#ec6159; border-color:#ec6159;}
	
	#btnReserve{width:160px; height:55px; text-align: center; color:black; background:none; border:1px solid black;}
	#btnReserve:hover{color:#ec6159; border-color:#ec6159;}
	
	div.comm1{width:400px; height:100px; border:1px solid #aaa; padding:5px; margin-top:5px;}
	
	textarea{
		height: 134px; width: 510px; border: none;
	}
	
	/* 별점 관련 */
	.star-rating{
		border:solid 1px #ccc;
		display: flex;
		flex-direction: row-reverse;
		font-size:2.5em;
		justify-content:space-around;
		padding:0 .2em;
		text-align:center;
		width:5em;
		border: 0;
	}
	/* 라디오 버튼 숨기기 */
	.star-rating input[type=radio] {
  		display:none;
	}
	.star-rating label {
		color:#ccc;
		cursor:pointer;
	}
	.star-rating :checked ~ label {
	  	color:#ec6159;
	}
	article {
	  background-color:#ffe;
	  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
	  color:#006;
	  font-family:cursive;
	  font-style:italic;
	  margin:4em;
	  max-width:30em;
	  padding:2em;
	}
	
	/* 스틸컷 관련*/
	
	
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script type="text/javascript" src="/spring13/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">
	//스틸컷
	$(document).ready(function(){ 
		$(".slider").bxSlider({
			auto:true,
			speed:500
		});
	});

	//리뷰 작성
	$(function () {
		$("#btnadd").click(function() {
			let score=$("input[name='score']:checked").val();
			let mid=$("#mid").val();
			let comments=$("#comments").val();
			let blank = /^\s+|\s+$/g;
			
			if(comments == ''){
				alert("내용을 입력해주세요.");
				return;
			}
			
			//alert(mid +"," + comments);
			$.ajax({
				url:'${cp}/review/insert',
				data:{"mid":mid, "moviecode":${vo.moviecode}, "score":score, "comments":comments},
				dataType:'json',
				success:function(data){
					if(data.msg=='success'){
						reviewlist(1);
						//alert('success!');
					}else{
						alert("등록 실패!");
					}
				}
			});
		});
		reviewlist(1);
	});
	//로그인 안할 경우
	$(function () {
		$("#btnNotLogin").click(function() {
			alert("로그인이 필요한 서비스 입니다.");
		});
	});
	
	//리뷰 리스트
	
	function reviewlist(pageNum) {
		$("#commentsList").empty();
		$.ajax({
			url:'${cp}/review/list',
			data:{'pageNum':pageNum, 'moviecode':${vo.moviecode}},
			dataType:'json',
			success:function(data){
				$(data.list).each(function(i,d){
					let score=d.score;
					let mid=d.mid;
					let comments=d.comments;
					let regdate=d.regdate;
					let html="<div class='comm1'>";
					//여기에 별점 표시
					let span="";
					for(let i=0; i<score; i++){
						span += "<span id='star_span'>★</span>";
					}
					html += span + "<br>";
					html += comments + "<br>";
					html += mid + "  |  " + regdate + "<br>";
					html += "</div>";
					$("#commentsList").append(html);
				});
				//페이징
				let startPage=data.startPageNum;
				let endPage=data.endPageNum;
				let pageCount=data.pageCount;
				let pageHTML="";
				
				//이전 페이지 버튼
				if(startPage>5){
					pageHTML += "<a href='javascript:reviewlist(" + (startPage-1) + ")'>이전</a>";
				}
				
				for(let i=startPage; i<=endPage; i++){
					if(i==pageNum){
						pageHTML += "<a href='javascript:reviewlist(" + i + ")'><span style='color:bule'>[" + i + "]</span></a>";
					}else{
						pageHTML += "<a href='javascript:reviewlist(" + i + ")'><span style='color:gray'>[" + i + "]</span></a>";
					}
				}
				
				//다음 페이지 버튼
				if(endPage<pageCount){
					pageHTML += "<a href='javascript:reviewlist(" + (endPage+1) + ")'>다음</a>";
				}
				$("#page").html(pageHTML);
				
			}
		     //error:function(request,status,error){
		     //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		     //}
		});
		
//		$(function () {
//			$("div.comm1").slice(0,10).show();
//			$("#moreList").click(function(e) {
//				e.preventDefault();
//				$("div.comm1:hidden").slice(0,10).show();
//					if($("div.comm1:hidden").length==0){
//						alert("볼 수 있는 댓글이 없습니다");
//					}
//			});
//		});		
		
	}
</script>
</head>

<body>
<form method="post" action="${cp }/movie/addmovieimg?${_csrf.parameterName}=${_csrf.token}"></form>
<div id="backgroundColor">
	<div class="maincontainer" id=""> 
		<!-- 포스터 영화 내용 -->
		<div class="row" id="mainposter">
			<div class="col-md-4 text-center" id="poster">
				<img class="" src="${cp }/resources/images/movieupload/${vo.movieimg}" style="width:290px; height:416px;">
			</div>
			<div class="col-md-8" id="moviebox">
				<div class="col-sm-12 text-left"> 
				<h2 class="title" style="font-weight: bold;">${vo.moviename }</h2>
				<p class="content">${vo.opendate } 개봉 | ${vo.runtime }분 | ${vo.rating } | ${vo.genre } | ${vo.country }</p>
					<button type="button" id="btnReserve" onclick="">예매</button>
			</div>
		</div>
	</div>
	
	배우정보: ${vo.actorinfo }<br>
	
	<h3>동영상</h3>
	<iframe width="1246" height="701" src="${vo.video }" title="YouTube video player" 
	frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	
	
	
	
	</div>
	<!-- 기본정보 배우정보 및 영상, 스틸컷 등등 -->
	<h3>스틸컷</h3>
		<div class="slidshow-container">
		<c:forEach var="imglist" items="${imglist }">
			<div class="slider">
				<img src="${cp }/resources/images/stillcutupload/${imglist.imgname}" style="width:290px; height:416px;">
			</div>
		</c:forEach>
		
		
		
		
		<!-- 평점 -->
		<div id="commentsForm">
			<p id="reviewtitle">평점</p>
			<div class="comment_top">
				<form action="commentWriteOk">
					<span>나의 평점</span>
					<div class="star-rating">
						<input type="radio" id="1-stars" name="score" value="5" /><label
							for="1-stars" class="star">★</label> <input type="radio"
							id="2-stars" name="score" value="4" /><label for="2-stars"
							class="star">★</label> <input type="radio" id="3-stars"
							name="score" value="3" /><label for="3-stars" class="star">★</label>
						<input type="radio" id="4-stars" name="score" value="2" /><label
							for="4-stars" class="star">★</label> <input type="radio"
							id="5-star" name="score" value="1" checked="checked" /><label for="5-star"
							class="star">★</label>
					</div>
					
					<div class="comment_cont">
						<sec:authorize access="isAuthenticated()"> <!-- 로그인 했을 경우 -->
							<sec:authentication property="principal.username" var="username" />
							<textarea placeholder="별점을 먼저 선택하신 후, 감상을 남겨주세요." rows="5"
								cols="50" id="comments"></textarea>
							<input type="hidden" id="mid" name="mid" value="${username }">
							<input type="hidden" id="regdate" name="regdate">
							<input type="button" value="등록" id="btnadd">
						</sec:authorize>
					</div>

					<sec:authorize access="isAnonymous()"> <!-- 로그인 안했을 경우 -->
						<div class="comment_cont">
							<textarea placeholder="별점을 먼저 선택하신 후, 감상을 남겨주세요." rows="5"
								cols="50" id="comments"></textarea>
							<input type="button" value="등록" id="btnNotLogin"><br>
						</div>
					</sec:authorize>
				</form>
			</div>

			<div id="commentsList">
			</div>
			<div id="page"></div>
			<!--  <button id="moreList"><span>더보기</span></button> -->
		</div>
	</div>
</body>


</html>