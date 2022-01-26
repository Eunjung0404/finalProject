<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<style>
#poster figcaption {
	width: 300px;
	height: 400px;
	background-color: rgba(0, 0, 0, 0.7);
	position: absolute; /* 이미지와 겹치게 처리 */
	top: 0;
	color: #fff;
	text-align: center;
	line-height: 40px;
	opacity: 0; /* 처음엔 안보이고 */
	transition: 0.3s;
}

#poster {
	position: relative;
	left: 50px;
}

#poster li {
	list-style: none;
	float: left;
	width: 300px;
	height: 400px;
	margin-right: 10px;
	margin-left: 10px;
}

#poster li figcaption a {
	position: relative;
	top: 150px;
	border: 2px solid white;
	padding-right: 15px;
	padding-left: 15px;
	padding-bottom: 5px;
	padding-top: 5px;
	text-decoration: none;
	color: white;
}

#poster li figcaption a:hover {
	border: 2px solid red;
	color: red;
}

#poster li figure {
	width: 300px;
	height: 400px
}

#poster li:hover figcaption, #poster li:focus figcaption {
	/* 마우스를 올리면 보이게 처리 */
	opacity: 1;
}

/*top5*/
#top5 figcaption {
	width: 150px;
	height: 200px;
	background-color: rgba(0, 0, 0, 0.7);
	position: absolute; /* 이미지와 겹치게 처리 */
	top: 0;
	color: #fff;
	text-align: center;
	line-height: 50px;
	opacity: 0; /* 처음엔 안보이고 */
	transition: 0.3s;
}

#top5 {
	position: relative;
	left: 430px;
}

#top5 li {
	list-style: none;
	float: left;
	width: 150px;
	height: 200px;
	margin-right: 10px;
	margin-left: 10px;
}

#top5 li figcaption a {
	position: relative;
	top: 40px;
	border: 2px solid white;
	padding-right: 15px;
	padding-left: 15px;
	padding-bottom: 5px;
	padding-top: 5px;
	text-decoration: none;
	color: white;
}

#top5 li figcaption a:hover {
	border: 2px solid red;
	color: red;
}

#top5 li figure {
	width: 300px;
	height: 400px
}

#top5 li:hover figcaption, #poster li:focus figcaption {
	/* 마우스를 올리면 보이게 처리 */
	opacity: 1;
}
@keyframes cardRotate
{
 from{ transform: rotateY(0deg);}
 to{ transform: rotateY(360deg);}
 
}


#top5 li:hover {
  animation:cardRotate;
 animation-duration:2s;
}
#Youtube-modal {
	display: none; position : absolute;
	top: 130px;
	left: 350px;
	position: absolute;
}

#Youtube-modal button {
	position: relative;
	left: 1000px;
	background: none;
	border: none;
}

#Youtube-modal button:hover {
	background: black;
	opacity: 50%;
}

.carousel::before {
display: block;
content: "";
width:250px;
height: 700px;
position:absolute;
top:-225px;
left:0;
z-index:1;
background:  linear-gradient(to right, rgba(255, 255, 255, 1), rgba(0, 0, 0, 0));
}
.carousel::after {
display: block;
content: "";
width:250px;
height: 700px;
position:absolute;
top:-225px;
right:0;
z-index:1;
background:linear-gradient(to left, rgba(255, 255, 255, 1), rgba(0, 0, 0, 0));

}
</style>



<!-- 상단 -->
<div class=" container"
	style="height: 700px; background-image: linear-gradient(to top, rgba(0, 0, 0, 1), rgba(0, 0, 0, 0)), url('/finalproject/resources/images/detail/spiderman.jpg');">

	<!-- 영화제목 타이틀 -->
	<div class="text-center row"
		style="margin-top: 80px; margin-bottom: 80px;">
		<a href="javascript:playPreview();"><img style="width: 70px;"
			src="/finalproject/resources/images/icon/play.png"></a><br> <span
			class="display-5 text-white fw-bold ">스파이더맨:노웨이홈</span>
	</div>
	<!-- 영화 예매율 1-5 -->
	<div class="row justify-content-md-center" style="height: 300px;">


		<ul id="top5">


				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/경관의피.jpg"
							alt="경관의피" style="width: 150px; height: 200px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>


				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/노웨이홈.jpg"
							alt="경관의피" style="width: 150px; height: 200px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>


				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/해적.jpg"
							alt="경관의피" style="width: 150px; height: 200px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>


				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/특송.jpg"
							alt="경관의피" style="width: 150px; height: 200px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>


				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/웨스트사이드스토리.jpg"
							alt="경관의피" style="width: 150px; height: 200px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>

		</ul>




	</div>
	<!-- 영화 예고편 iframe src부분만 변경 -->
	<div id="Youtube-modal">
		<div>
			<div id="gd-video">
				<button id="gd-close" onclick="endPreview()">
					<img style="width: 70px;"
						src="/finalproject/resources/images/icon/close.png">
				</button>
				<br>
				<iframe id="preview" width="1000" height="500" src=""
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>

			</div>
		</div>
	</div>
</div>
<!-- 영화들.. -->
<div style="height: 700px;">


	<ul class=" nav row justify-content-md-center"
		style="margin-top: 100px;">
		<li class="col-1 text-black fw-bold">예매순위</li>
		<li class="col-1  text-black fw-bold">개봉예정작</li>
		<li class="col-1 text-black fw-bold">박스오피스</li>
		<li class="col-1 text-black fw-bold">영화제영화</li>
	</ul>
	<div class="carousel slide" >
		<button class="carousel-control-prev" type="button" id="prevbtn"
			onclick=" PrevPoster()" style="z-index:2;">
			<img style="width: 70px;"
				src="/finalproject/resources/images/icon/arrow2.png">
		</button>

		<!-- 영화이미지 -->
		<div class="row justify-content-md-center"
			style="height: 400px; margin-top: 100px; z-index: 0; overflow: hidden;">

			<ul id="poster" class="justify-content-md-center">

				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/경관의피.jpg"
							alt="경관의피" style="width: 300px; height: 400px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>

				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/노웨이홈.jpg"
							alt="경관의피" style="width: 300px; height: 400px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>

				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/씽2게더.jpg"
							alt="경관의피" style="width: 300px; height: 400px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>

				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/해적.jpg" alt="경관의피"
							style="width: 300px; height: 400px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure>

						<img src="/finalproject/resources/images/detail/특송.jpg" alt="경관의피"
							style="width: 300px; height: 400px;">
						<figcaption>
							<a href="">예매</a><br> <a href="">정보</a>
						</figcaption>
					</figure>
				</li>




			</ul>

		</div>

		<button class="carousel-control-next" type="button" id="nextbtn"
			onclick="nextPoster()" style="z-index:2;">
			<img style="width: 70px;"
				src="/finalproject/resources/images/icon/arrow.png">
		</button>
	</div>
</div>

<!-- 공지사항등.. -->

<div style="height: 300px;">
	<div class="container d-flex flex-wrap justify-content-center "
		style="margin-top: 100px; margin-bottom: 50px;">

		<hr class="col-12">
		<span class="fs-4 text-black">공지사항</span>

		<ul
			class="nav col-12 col-lg-auto me-lg-auto justify-content-center mx-5">
			<li><a href="#" class="nav-link px-2 text-secondary">공지사항 내용</a></li>

		</ul>
		<hr class="col-12">

	</div>

</div>

<script type="text/javascript">
	//나중에에 ajax로 처리해주기
	var srcs = [ "/finalproject/resources/images/detail/경관의피.jpg",
			"/finalproject/resources/images/detail/노웨이홈.jpg",
			"/finalproject/resources/images/detail/씽2게더.jpg",
			"/finalproject/resources/images/detail/해적.jpg",
			"/finalproject/resources/images/detail/특송.jpg",
			"/finalproject/resources/images/detail/웨스트사이드스토리.jpg",
			"/finalproject/resources/images/detail/어나더라운드.jpg" ];
	let ul = document.getElementById('poster');
	var imgs = ul.getElementsByTagName("img");
	var n = 0;
	var nextbtn = document.getElementById('nextbtn');
	var prevbtn = document.getElementById('prevbtn');
	function nextPoster() {
		n++;
		prevbtn.disabled = false;
		if (n > 2) {
			nextbtn.disabled = true;

		} else {
			for (var i = 0; i < imgs.length; i++) {
				console.log(n + i);
				imgs[i].src = srcs[n + i];
			}
		}
	}
	function PrevPoster() {
		n--;
		nextbtn.disabled = false;
		if (n < 0) {
			prevbtn.disabled = true;
		} else {
			for (var i = 0; i < imgs.length; i++) {

				console.log(n + i);
				imgs[i].src = srcs[n + i];
			}
		}
	}

	//예고편 재생
	function playPreview() {
		let YoutubeModal = document.getElementById('Youtube-modal');
		YoutubeModal.style.display = 'block';
		let iframe = document.getElementById("preview")
		iframe.src = "https://www.youtube.com/embed/W7edvITC9g4";
	}
	function endPreview() {
		let YoutubeModal = document.getElementById('Youtube-modal');
		let iframe = document.getElementById("preview")
		iframe.src = "";
		YoutubeModal.style.display = 'none';
	}

</script>