<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
<style>
.container1 {
	background-color: #f5f5f5;
	text-align: center;
	display: inline-flex;
	flex-direction: column;
	flex-wrap: wrap;
	align-content: space-around;
}

.maindiv {
	display: flex;
	flex-direction: column;
	width: 800px;
	margin-top: 40px;
}

.table {
	margin-top: 30px;
	margin-bottom: 30px;
}

.page {
	margin-top: 10px;
	margin-bottom: 30px;
}

.page a {
	color: gray;
}
</style>
</head>
<body>
	<div class="container1">
		<div class="maindiv">
			<h2>공지사항</h2>
			<c:set var="cp" value="${pageContext.request.contextPath }" />
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }">
			<sec:authentication property="principal.username" var="pinfo" />

			<sec:authorize access="isAuthenticated()">
				<c:if test="${fn:startsWith(pinfo,'admin')}">
					<a href="${cp }/admin/note/insert">공지쓰기</a>
				</c:if>
			</sec:authorize>
			<table border="1" width="500" class="table table-hover">
				<tr>
					<th width="15%;">번호</th>
					<th>제목</th>
					<th width="20%;">작성일</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.notecode }</td>
						<td><a href="${cp }/note/detail?num=${vo.notecode}">${vo.title }</a></td>
						<td>${vo.regdate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="page">
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