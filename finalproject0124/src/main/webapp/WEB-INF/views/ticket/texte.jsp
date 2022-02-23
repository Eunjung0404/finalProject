<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<%
Cookie[] cookies = request.getCookies();
String id = "";
for (Cookie c : cookies) {
	String name = c.getName();
	if (name.equals("mid")) {
		id = c.getValue();
	}
}
%>

<input type="hidden" value="<%=id%>" id="idData">

<div class="container mt-3" id="ticketingList" style="display: block;">


</div>
<div id="pageCount"></div>





<script type="text/javascript">
	$(function() {
		ticketHistoryPage();

	});

	function cancel(reservationcode,moviecode) {
		$.ajax({
			url : '/finalproject/member/cancel', 
			data:{"reservationcode":reservationcode,"moviecode":moviecode},
			dataType : 'json',
			success : function(data)
			{

				alert("취소가 완료되었습니다.");
				ticketHistoryPage(1);
			}
			});
	}
	
	function ticketHistoryPage(pageNum) {

		let id = document.getElementById("idData").value;
		$
				.ajax({
					url : "/finalproject/member/history",
					type : "GET",
					dataType : "JSON",
					data : {
						"mid" : id,
						pageNum : pageNum
					},
					success : function(data) {
						console.log(data.reviewList);
						let output = "";

						output += "<h2>" + '예매 내역' + "</h2><br>";
						output += "<table class='table' id='ticketList'>";
						output += "<thead>";
						output += "<tr>";
						output += "<th>" + '예매번호' + "</th>";
						output += "<th>" + '영화명' + "</th>";
						output += "<th>" + '극장/상영관' + "</th>";
						output += "<th>" + '관람일시' + "</th>";
						output += "<th>" + '관람인원' + "</th>";
						output += "<th>" + '상태' + "</th>";
						output += "<th>" + '취소' + "</th>";
						output += "</tr>";
						output += "</thead>";
						output += "<tbody>";
						$(data.list)
								.each(
										function(index, result) {

											output += "<tr id='"+result.reservationcode +"'>";
											output += "<td>"
													+ result.reservationcode
													+ "</td>";
											output += "<td>" + result.moviename
													+ "</td>";
											output += "<td>"
													+ result.theatername + "/"
													+ result.screenname
													+ "</td>";
											output += "<td>" +data.datelist[index] + "</td>";
											output += "<td>" + result.people
													+ "</td>";
											if (result.state == 1) {
												output += "<td>예매완료</td>";
											} else if (result.state == 2) {
												output += "<td>관람완료</td>";
											} else if (result.state == 0) {
												output += "<td>취소완료</td>";
											}
										
											if (result.state == 1) {
												output += "<td>"
														+ "<a href='javascript:cancel("
														+'"'+ result.reservationcode +'",'
														+ '"'+data.codelist[index]+'"'+")'><span>예매취소</span></a>"
														+ "</td>";
											} else {
												output += "<td>-</td>";
											}
											output += "</tr>";
											//cancel(reservationcode,moviename)
										});
						output += "</tbody>";
						output += "</table>";

						//페이징 
						let startPage = data.startPageNum;
						let endPage = data.endPageNum;
						let pageCount = data.totalPageCount;
						let PageHtml = "";
						if (startPage > 5) {
							PageHtml += "<a href='javascript:ticketHistoryPage("
									+ (startPage - 1) + ")'><span>[이전]</span>"
						}
						for (let i = startPage; i <= endPage; i++) {
							if (i == pageNum) {
								PageHtml += "<a href='javascript:ticketHistoryPage("
										+ i
										+ ")'><span style='color:blue'>["
										+ i + "]</span>"
							} else {
								PageHtml += "<a href='javascript:ticketHistoryPage("
										+ i
										+ ")'><span style='color:gray'>["
										+ i + "]</span>"
							}
						}
						if (endPage < pageCount) {
							PageHtml += "<a href='javascript:ticketHistoryPage("
									+ (endPage + 1) + ")'><span>[다음]</span>"
						}
						$("#pageCount").html(PageHtml);

						//$("#ticketingList").append(output);
						$("#ticketingList").html(output);
					}

				});

	}
</script>




