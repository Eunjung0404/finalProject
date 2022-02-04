<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#ppbtn {
	background-color: none;
	border: 1px solid gray;
}

#ppbtn:hover {
	background-color: olive;
	border: none;
}

#seat-area {
	border: 1px solid gray;
}
</style>
<!-- 인원수 및 기타... -->
<div class="row centerPosition">
	<div class="col-8 nonePadding"
		style="border: 1px solid gray; margin-top: 100px">

		인원수 선택
		<div id="people">성인:</div>
		<div id="theater-info">상영관/시간 정보:</div>
		<div id="seat-info">선택한 좌석번호</div>
	</div>
</div>
<!-- 좌석 -->
<div class="row centerPosition">
	<div class="col-8 nonePadding">
		<div id="seat-area" class="centerTopPosition">
			<img src="/finalproject/resources/images/icon/screen.jpg" alt="스크린"
				style="width: 70%;"> 좌석정보
		</div>
	</div>
</div>
<!-- 결제정보 -->
<div class="row centerPosition">
	<div class="col-8 nonePadding">
	...
	</div>
</div>
<script type="text/javascript">
	window.onload = function() {
		createPPbtn();
	}
	//인원수
	function createPPbtn() {
		let div = document.getElementById("people");
		for (var i = 0; i < 7; i++) {
			let btn = document.createElement("button");
			btn.value = i;
			btn.innerText = i;
			btn.id = "ppbtn";
			div.appendChild(btn);

		}

	}
</script>