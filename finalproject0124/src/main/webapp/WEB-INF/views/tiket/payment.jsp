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
</style>
<div class="raw centerPosition">
	<h2 style="padding: 100px;">"결제가 완료되었습니다!"</h2>
</div>

<div class="raw centerPosition">
	<div class="col-3 nonePadding">
		<span style="font-size: 18px; font-weight: bold;">예매정보</span>
		<div style="height: 500px; border: 1px solid gray;">
			<div>
				<img
					src="/finalproject/resources/images/movieupload/${vo.movieimgname}"
					alt="${vo.movieimgname}"
					style="width: 150px; position: absolute; margin-left: 50px; margin-top: 35px;"
					id="posterImg">
			</div>
			<div>
			
				예매번호 <span></span><br> 영화명 ${vo.movienamehtml}><br>
				극장/상영관<span>${vo.theatername}/${vo.screenname}</span><br> 상영일시
				<span></span><br> 좌석
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
		<div style="height: 500px; border: 1px solid gray;">
			결제번호 <span></span><br>결제금액 <span>${vo.totalprice}</span><br> 결제정보 <span>${vo.paymenttype}</span><br> 결제일시<span></span><br>
		</div>
	</div>
</div>
