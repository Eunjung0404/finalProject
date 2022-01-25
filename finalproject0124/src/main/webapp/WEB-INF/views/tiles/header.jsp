<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#drop {
	display: none;
}
#drop li {
	margin-top: 10px;
	margin-bottom:20px;
	list-style: none;
	position: relative;
	left:-15px;
	text-align: center;
}

#drop li a {

	text-decoration:none;
	color: white;
	
}

#menu:hover #drop {
	display: block;
}

</style>

<nav class="py-1 bg-dark ">
	<div class="container d-flex flex-wrap">
		<ul class="nav me-auto">
			<li class="nav-item"><a href="#"
				class="nav-link link-light px-2 active" aria-current="page">Home</a></li>
		</ul>
		<ul class="nav">
			<li class="nav-item"><a href="#"
				class="nav-link text-white px-2">로그인</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link text-white px-2">마이페이지</a></li>
			<li class="nav-item"><a href="#"
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
			<li><a href="#" class="nav-link text-white" style="margin-left:30px;margin-right:30px;">예매</a>
				<div id="drop">
					<ul>
						<li><a href="">빠른예매</a></li>
						<li><a href="">예매안내</a></li>
					</ul>
				</div></li>
			<li><a href="#" class="nav-link text-white" style="margin-left:30px;margin-right:30px;">영화</a>
				<div id="drop">
					<ul>
						<li><a href="">빠른예매</a></li>
						<li><a href="">예매안내</a></li>
					</ul>
				</div></li>
			<li><a href="#" class="nav-link text-white" style="margin-left:30px;margin-right:30px;">매거진</a>
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
		<form class="col-12 col-lg-auto mb-3 mb-lg-0">
			<img src="/finalproject/resources/images/icon/search.png">
		</form>
	</div>
</header>
<script type="text/javascript">
	
</script>
