<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="icon" href="/favicon.ico">
<title>관리자 페이지</title>
<link href="${cp }/resources/admin/css/chunk-vendors.css" rel="preload"
	as="style">

<link href="${cp }/resources/admin/css/chunk-vendors.css"
	rel="stylesheet">
</head>
<style>
.centerdisplay {
	display: flex;
	justify-content: center;
	align-items: center;
	padding:100px;
}

.tablecss {
	border: 1px solid;
	width: 500px;
}
</style>
</head>
<div data-app="true"
	class="v-application v-application--is-ltr theme--light" id="app">
	<div class="v-application--wrap">
		<main class="v-main" data-booted="true" style="padding: 0px;">
			<div class="v-main__wrap">
				<div class="grey lighten-5">
					<header class="v-sheet theme--dark v-toolbar" style="height: 56px;">
						<div class="v-toolbar__content" style="height: 56px;">
							<button type="button"
								class="v-btn v-btn--icon v-btn--round theme--dark v-size--default">
								<span class="v-btn__content"><i aria-hidden="true"
									class="v-icon notranslate mdi mdi-reply theme--dark"></i></span>
							</button>
							<div class="v-toolbar__title">관리자 메뉴 &gt; 스케쥴관리</div>
						</div>
					</header>

					<div class="col ">
						<div class="centerdisplay">
							<div>
								<sapn>상영영화 관리
								<div>

									<table class="tablecss">
										<tr>
											<th>영화이름</th>
											<th>영화상태</th>
										</tr>

									</table>
								</div>
							</div>
							<div>
								<sapn>상영관관리
								<div>

									<table class="tablecss">
										<tr>
											<th>상영관이름</th>
											<th>상태</th>
										</tr>

									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="height: 100px;"></div>
			</div>
		</main>
	</div>
</div>

</html>