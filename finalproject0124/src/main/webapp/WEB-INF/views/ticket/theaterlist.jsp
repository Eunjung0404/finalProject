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
					<div class="container grey lighten-5 px-16" style="height: 800px;">
						<div class="row" style="height: 100px;"></div>
						<div class="row no-gutters">
							<div class="col-lg-1 col-xl-3 col"></div>
							<div class="col-lg-10 col-xl-6 col-12">
								<div
									class="v-data-table elevation-1 v-data-table--has-top v-data-table--has-bottom theme--light v-data-table--mobile">
									<header class="v-sheet theme--light v-toolbar v-toolbar--flat"
										style="height: 56px;">
										<div class="v-toolbar__content" style="height: 56px;">
											<div class="v-toolbar__title">등록된 극장</div>
											<hr role="separator" aria-orientation="vertical"
												class="mx-4 v-divider v-divider--inset v-divider--vertical theme--light">
											<div class="spacer"></div>
											<div class="v-dialog__container">
												<!---->
											</div>

										</div>
									</header>
									<div class="v-data-table__wrapper">



										<table>
											<colgroup>
												<col class="">
												<col class="">
												<col class="">
												<col class="">
											</colgroup>
											<thead class="v-data-table-header">
												<tr>
													<th role="columnheader" scope="col"
														aria-label="지점명: Sorted ascending. Activate to sort descending."
														aria-sort="ascending"
														class="text-start sortable active asc"><span>지점명</span><i
														aria-hidden="true"
														class="v-icon notranslate v-data-table-header__icon mdi mdi-arrow-up theme--light"
														style="font-size: 18px;"></i></th>
													<th role="columnheader" scope="col"
														aria-label="지역 분류: Not sorted. Activate to sort ascending."
														aria-sort="none" class="text-start sortable"><span>지역
															분류</span><i aria-hidden="true"
														class="v-icon notranslate v-data-table-header__icon mdi mdi-arrow-up theme--light"
														style="font-size: 18px;"></i></th>
													<th role="columnheader" scope="col"
														aria-label="상태: Not sorted. Activate to sort ascending."
														aria-sort="none" class="text-start sortable"><span>상태</span><i
														aria-hidden="true"
														class="v-icon notranslate v-data-table-header__icon mdi mdi-arrow-up theme--light"
														style="font-size: 18px;"></i></th>

												</tr>
												<tr class="">
													<td class="text-start">건대</td>
													<td class="text-start">서울</td>
													<td class="text-start">정상등록</td>
													<td class="text-start"><button type="button"
															class="v-icon notranslate mr-4 v-icon--link mdi mdi-pencil theme--light"
															style="font-size: 16px;"></button>
														<button type="button"
															class="v-icon notranslate v-icon--link mdi mdi-open-in-new theme--light"
															style="font-size: 16px;"></button></td>
												</tr>
											</thead>

										</table>
									</div>
									<div class="v-data-footer">
										<div class="v-data-footer__select">
											
											<div
												class="v-input v-input--hide-details v-input--is-label-active v-input--is-dirty theme--light v-text-field v-text-field--is-booted v-select">
												<div class="v-input__control">

													<div class="v-menu">
														<!---->
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="col-lg-1 col-xl-3 col"></div>
					</div>
					<div class="row" style="height: 100px;"></div>
				</div>
			</div>
	</div>
	</main>
</div>
</div>
</html>