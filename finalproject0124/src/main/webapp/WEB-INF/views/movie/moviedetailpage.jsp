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
	
	#mainposter{flex-direction: row; align-content: center; justify-content: center;}
	#poster{width: 290px; height: 413.45px; margin-right: 40px;}
	#moviebox{width: 700px; height: 100%; border: none; float: left; }
	#movietext{color: #777;}
	.movietext1{color: #777; border-left:1px solid #e5e5e5; padding-left: 10px; margin-right: 5px;}
	.movietext2{color: #777;}
	.director1{font-weight: number 600;}
	
	#movieYouTube{ left: 30%; width: 1000px; height: 500px; margin: auto; margin-top: 60px;}
	
	.slidshow-container{width: 1000px; height: 600px; margin:0 auto; margin-top: 80px;}
	
	#commentsForm{display: flex; margin-top: 30px; flex-direction: column; align-content: center; justify-content: center; align-items: center;}
	#ratingh4{float: left; width: 1000px}
	
	div.comment_cont{width:1000px; height:134px;}
	#btnadd{position:absolute; width:146px; height:134px; color:#fff; background:#ec6159; cursor:pointer; border:none;}
	#btnNotLogin{position:absolute; width:146px; height:134px; color:#fff; background:#ec6159; cursor:pointer; border:none;}
	
	#star_span{color:#ec6159; border-color:#ec6159; font-size: 23px;}
	
	#btnReserve{width:160px; height:55px; text-align: center; color:black; background:none; border:1px solid black; margin-top: 70px;}
	#btnReserve:hover{color:#ec6159; border-color:#ec6159;}
	
	div.comm1{width:1000px; height:120px; padding:9px; margin-top:2px; background-color: #fff;}
	
	textarea{
		height: 134px; width: 854px; border: none; font-size:13px; text-align:left; padding-top: 45px; resize:none;
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
	#delBtn{border: 0; outline: 0; color:#BDBDBD; float: right; background-color:transparent;}
	
	
	/* 스틸컷 관련 */
	.slider{margin:0 auto;}
	.bx-viewport{height: 500px !important;}
	
	/* 페이징 관련 */
	.page{text-align:center; margin-top:20px; margin-bottom:20px; }
	.page span{text-align:center; color:black; text-align: center; padding: 8px 16px; text-decoration: none; border-radius:30%;}
	.page span.active{background-color: #ec6159; color: white;}
	.page span:hover:not(.active){background-color: #ec6159; color: white;}
	
	#pageBtn1{margin-right: 5px;}
	
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script type="text/javascript" src="/spring13/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript"> 
	//스틸컷
	$(document).ready(function(){ 
		$(".slider").bxSlider({
			mode:'horizontal',
			speed:3000, //슬라이드 넘어가는 시간, 3초
			pause:5000, //슬라이드 멈추는 시간, 3초
			pager:true, //페이지 표시
			slideWidth:1150,
			autoHover: true
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
						document.getElementById("comments").value='';
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
	
	//평점 삭제
	function removeReview(reviewcode) {
		$.ajax({
			url:'${cp}/review/delete',
			data:{"reviewcode":reviewcode}, //삭제할 PK번호
			dataType:'json',
			success:function(data){
				if(data.msg=='success'){
					reviewlist(1);
				}else{
					alert("삭제에 실패했습니다. 다시 한 번 확인해 주세요");
				}
			}
		});
	}
	
	//평점 리스트
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
					let reviewcode=d.reviewcode; //삭제를 위한 PK번호
					let html="<div class='comm1'>";
					//여기에 별점 표시
					let span="";
					for(let i=0; i<score; i++){
						span += "<span id='star_span'>★</span>";
					}
					html += span + "<br>";
					html += "<span id='com' style='line-height:35px;'>" + comments + "</span><br>";
					html += "<span id='idreg' style='font-size:12px; color:#8C8C8C; line-height:35px;'>"+ mid + "  |  " + regdate +"</span>";
					
					//로그인 했을 때 삭제버튼  표시
					let username=$("#mid").val();
					let str="admin";
					//alert("username" + username);
					if(username==d.mid || username==str.substring(0,5)){ //|| username=='admin' 관리자 계정 substring으로 앞의 5글자만 뽑아오기
							html += " <input type='button' id='delBtn' value='삭제' onclick='removeReview("+reviewcode+")' >";
							
					}
					html+="</div>";
			
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
						pageHTML += "<a href='javascript:reviewlist(" + i + ")'><span id='pageBtn1'>" + i + "</span></a>";
					}else{
						pageHTML += "<a href='javascript:reviewlist(" + i + ")'><span id='pageBtn2'>" + i + "</span></a>";
					}
				}
				
				//다음 페이지 버튼
				if(endPage<pageCount){
					pageHTML += "<a href='javascript:reviewlist(" + (endPage+1) + ")'>다음</a>";
				}
				$(".page").html(pageHTML);
				
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
	<div class="maincontainer"> 
		<!-- 포스터 영화 내용 -->
		<div class="row" id="mainposter">
			<div id="poster">
				<img class="" src="${cp }/resources/images/movieupload/${vo.movieimg}" style="width:290px; height:413.45px;">
			</div>
			<div id="moviebox">
				<h2 class="title" style="font-weight: bold; font-size: 50px; margin-top: 30px;">${vo.moviename }</h2>
					
				<p class="starAvg">평점 ${avg.avgscore }</p>
					
				<span id="movietext">${vo.opendate } 개봉</span>
				<span class="movietext1">${vo.runtime }분</span>
				<span class="movietext1">${vo.rating }</span>
				<span class="movietext1">${vo.genre }</span>
				<span class="movietext1">${vo.country }</span><br><br>
				<span class="movietext2">감독 : </span><span class="director1">${vo.director }</span><br>
				<span class="movietext2">배우 : </span><span class="director1">${vo.actorinfo }</span><br>
				<br><button type="button" id="btnReserve" onclick="location.href='${cp}/ticket?moviecode=${vo.moviecode}'">예매</button>
			</div>
		</div>
	</div>
	
	
	
	<div id="movieYouTube">
		<h4>동영상</h4>
		<iframe width="1000" height="500" src="${vo.video }" title="YouTube video player" 
		frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
		</iframe>
	</div><br>
	
	

	<!-- 영상, 스틸컷 등등 -->
	<div class="slidshow-container">
		<h4>스틸컷</h4>
		<div class="slider" style="width:1000px; height: 500px;">
			<c:forEach var="imglist" items="${imglist }">
				<img src="${cp }/resources/images/stillcutupload/${imglist.imgname}">
			</c:forEach>
		</div>
	</div>
		
		
		
		<!-- 평점 -->

		<div id="commentsForm">
		<h4><div id="ratingh4">평점</div></h4>
			<div class="comment_top" style="margin-bottom: 50px; ">
					<div class="ag_tit" style="float:left; margin-top: 22px; margin-right: 5px;">나의 평점</div>
					<div class="star-rating" style="float:left;">
						<input type="radio" id="1-stars" name="score" value="5" /><label
							for="1-stars" class="star">★</label> <input type="radio"
							id="2-stars" name="score" value="4" /><label for="2-stars"
							class="star">★</label> <input type="radio" id="3-stars"
							name="score" value="3" /><label for="3-stars" class="star">★</label>
						<input type="radio" id="4-stars" name="score" value="2" /><label
							for="4-stars" class="star">★</label> <input type="radio"
							id="5-star" name="score" value="1" checked="checked" /><label for="5-star"
							class="star">★</label>
					</div><br>
					
					<div class="comment_cont">
						<sec:authorize access="isAuthenticated()"> <!-- 로그인 했을 경우 -->
							<sec:authentication property="principal.username" var="username" />
							<textarea placeholder="별점을 먼저 선택하신 후, 감상을 남겨주세요. 
욕설, 비속어, 타인을 비방하는 문구를 사용하시면 운영자가 임의로 삭제할 수 있습니다." id="comments"></textarea>
							<input type="hidden" id="mid" name="mid" value="${username }">
							<input type="hidden" id="regdate" name="regdate">
							<input type="button" value="등록" id="btnadd">
						</sec:authorize>
					</div>

					<sec:authorize access="isAnonymous()"> <!-- 로그인 안했을 경우 -->
						<div class="comment_cont">
							<textarea placeholder="별점을 먼저 선택하신 후, 감상을 남겨주세요. 
욕설, 비속어, 타인을 비방하는 문구를 사용하시면 운영자가 임의로 삭제할 수 있습니다." id="comments"></textarea>
							<input type="button" value="등록" id="btnNotLogin">
						</div>
					</sec:authorize>

			</div>
			
			<div id="commentsList">
			</div>
			
			<!--  <button id="moreList"><span>더보기</span></button> -->
		</div> 
		<div class="page">
		</div>
		
</div> <!-- 배경색 div -->
</body>


</html>