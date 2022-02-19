<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.nonePadding {
	padding: 0px;
}

.centerPosition {
	display: flex;
	align-items: center;
	justify-content: center;
}

.centerTopPosition {
	display: flex;
	align-items: center;
	flex-direction: column;
}

.setcenter {
	height: 500px;
	border: 1px solid gray;
	display: flex;
	align-items: center;
	flex-direction: column;
	overflow: hidden;
	position: relative;
	position: relative;
	justify-content: center;
}

.rating {
	padding-top: 5px;
	margin: 5px;
	display: inline-block;
	width: 25px;
	height: 22px;
	line-height: 1;
	text-align: center;
	font-size: 13px;
	display: inline-block;
}

#rating15 {
	color: orange;
	border: 1px solid orange;
	padding-top: 5px;
}

#rating12 {
	color: green;
	border: 1px solid green;
}

#ratingALL {
	color: aqua;
	border: 1px solid aqua;
}
</style>
<div class="raw centerPosition">
	<h2 style="padding: 100px;">"결제가 완료되었습니다!"</h2>
</div>

<div class="raw centerPosition">
	<div class="col-3 nonePadding">
		<span style="font-size: 18px; font-weight: bold;">예매정보</span>
		<div class="setcenter">
			<div id="movieposterinfo"
				style="height: 100%; width: 100%;position: absolute;z-index: 0; background-size: 5000px; filter: brightness(40%) blur(20px); transform: scale(1.1);background-image:url(${pageContext.request.contextPath}/resources/images/movieupload/${vo.movieimgname});">
			</div>
			<div style="z-index: 1;">
				<img
					src="/finalproject/resources/images/movieupload/${vo.movieimgname}"
					alt="${vo.movieimgname}" style="width: 150px; z-index: 1;"
					id="posterImg">
			</div>
			<div style="z-index: 1; color: white">

				<span style="font-size: 15px; font-weight: bold;">예매번호</span> <span>${reservationcode}</span><br>
				<span style="font-size: 15px; font-weight: bold;">영화명</span> <span>${vo.movienamehtml}</span><br>
				<span style="font-size: 15px; font-weight: bold;">극장/상영관</span> <span>${vo.theatername}/${vo.screenname}</span><br>
				<span style="font-size: 15px; font-weight: bold;">상영일시</span> <span>${vo.screendate }/${vo.screentime }</span><br>
				<span style="font-size: 15px; font-weight: bold;">좌석</span>
				<c:forEach var="list" items="${vo.seatname}">
					<span>${list }</span>
				</c:forEach>
				<br>
			</div>
		</div>
	</div>
	<div class="col-1 nonePadding"></div>
	<div class="col-3 nonePadding">
		<span style="font-size: 18px; font-weight: bold;">결제정보</span>
		<div class="setcenter">
			<div>
				<span style="font-size: 15px; font-weight: bold;">결제번호</span> <span>${paymentcode}</span><br>
				<span style="font-size: 15px; font-weight: bold;">결제금액</span> <span>${vo.totalprice}</span><br>
				<span style="font-size: 15px; font-weight: bold;">결제정보</span> <span>${vo.paymenttype}</span><br>
				<span style="font-size: 15px; font-weight: bold;">결제일시</span> <span>${paymentdate}</span><br>
			</div>

		</div>
	</div>
</div>
