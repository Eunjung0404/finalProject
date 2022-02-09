<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
    rel="stylesheet">
<style>
#drop {
	display: none;
}

#drop li {
	margin-top: 10px;
	margin-bottom: 20px;
	list-style: none;
	position: relative;
	left: -15px;
	text-align: center;
}

#drop li a {
	text-decoration: none;
	color: white;
}

#menu:hover #drop {
	display: block;
}

<!-- 검색창 -->
</style>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>
<nav class="py-1 bg-dark ">
	<div class="container d-flex flex-wrap">
		<ul class="nav me-auto">
			<li class="nav-item"><a href="${cp }/"
				class="nav-link link-light px-2 active" aria-current="page">Home</a></li>
		</ul>
 
		<ul class="nav">
			<sec:authorize access="isAnonymous()">
				<li class="nav-item"><a href="${cp }/login"
					class="nav-link text-white px-2">로그인</a></li>
				<li class="nav-item"><a href="${cp}/signup"
					class="nav-link text-white px-2">회원가입</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="username" />
				<sec:authentication property="principal.username" />님 반갑습니다.
					  <script>
						function logout() {
							var f = document.Frm;
							f.action = "${cp}/logout";
							f.method = "post";
							f.submit();
						}
					</script>
				<form:form method="post" name="Frm" id="Frm">
					<li class="nav-item"><a href="javascript:logout()"
						class="nav-link text-white px-2">로그아웃</a></li>
				</form:form>
			</sec:authorize>

			<li class="nav-item"><a href="${cp }/member/mypage"
				class="nav-link text-white px-2">마이페이지</a></li>

				<li class="nav-item"><a href="${cp }/qna/qnahome"
					class="nav-link text-white px-2">고객센터</a></li>


		</ul>
	</div>
</nav>

<header class="py-2  bg-dark ">
	<div class="container d-flex flex-wrap justify-content-center ">
		<a href="/"
			class="d-flex  mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
			<span class="fs-4 text-white">프로젝트명</span>
		</a>
		<ul id="menu"
			class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 ">
			<li><a href="#" class="nav-link text-white"
				style="margin-left: 30px; margin-right: 30px;">예매</a>
				<div id="drop">
					<ul>
						<li><a href="">빠른예매</a></li>
						<li><a href="">예매안내</a></li>
					</ul>
				</div></li>
			<li><a href="#" class="nav-link text-white"
				style="margin-left: 30px; margin-right: 30px;">영화</a>
				<div id="drop">
					<ul>
						<li><a href="">빠른예매</a></li>
						<li><a href="">예매안내</a></li>
					</ul>
				</div></li>
			<li><a href="#" class="nav-link text-white"
				style="margin-left: 30px; margin-right: 30px;">매거진</a>
				<div id="drop">
					<ul>
						<li><a href="">빠른예매</a></li>
						<li><a href="">예매안내</a></li>
						<li><a href="">예매안내</a></li>
						<li><a href="">예매안내</a></li>
						<li><a href="">예매안내</a></li>
						<li><a href="">예매안내</a></li>
						<li><a href="">예매안내</a></li>
					</ul>
				</div></li>

		</ul>
		<!-- 서치아이콘 클릭  -->
			<form class="col-12 col-lg-auto mb-3 mb-lg-0" method="get" action="${cp }/movie/search">
			<!-- <a href="#"><img src="/finalproject/resources/images/icon/search.png" id="searchbtn"></a> -->
				<input type="text" id="searchbar" placeholder="검색어를 입력하세요" name="keyword" 
				style="border-style: solid; border-width: 0 0 2px 0; padding: 5px; word-break: break-all;
					border-color: LightGray; background-color: transparent; color: white;">
				
				<button type="submit" style="border:none; background-color:transparent;"><span class="material-icons-outlined" id="searchmenu" style="color: white; font-size: 30px;">search</span></button>
			</form>
			
			
			
		</div>
</header>
<script type="text/javascript">

</script>
