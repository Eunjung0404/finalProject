<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>note/list.jsp</title>
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
		<h2>공지사항</h2>
		<c:set var="cp" value="${pageContext.request.contextPath }" />
		<table border="1" width="500" class="table table-hover">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.notecode }</td>
					<td><a href="${cp }/note/detail?num=${vo.notecode}">${vo.title }</a></td>
					<td>${vo.content }</td>
					<td>${vo.regdate }</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==param.pageNum }">
						<a
							href="${cp }/note/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span>${i }</span></a>
					</c:when>
					<c:otherwise>
						<a
							href="${cp }/note/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span>${i }</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</body>
</html>