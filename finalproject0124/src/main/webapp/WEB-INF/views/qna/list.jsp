<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/list.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>문의 게시판</h2>
		<c:set var="cp" value="${pageContext.request.contextPath }" />
		<table border="1" width="500" class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.qnacode }</td>
						<td>${vo.mid }</td>
						<td><a href="${cp }/qna/detail?num=${vo.qnacode}">${vo.title }</a></td>
						<td>${vo.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div>
			<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==param.pageNum }">
						<a
							href="${cp }/qna/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span>${i }</span></a>
					</c:when>
					<c:otherwise>
						<a
							href="${cp }/qna/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span>${i }</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div>
			<form method="post" action="${cp }/qna/list">
				<select name="field">
					<option value="title"
						<c:if test="${field=='title'}">selected</c:if>>제목</option>
					<option value="mid" <c:if test="${field=='mid'}">selected</c:if>>작성자</option>
				</select> <input type="text" name="keyword" value="${keyword }"> <input
					type="submit" value="검색">
			</form>
		</div>
	</div>
</body>
</html>