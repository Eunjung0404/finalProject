<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>note/list.jsp</title>
</head>
<body>
<h2>공지사항</h2>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<table border="1" width="500">
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
	<c:forEach var= "i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==param.pageNum }">
				<a href="${cp }/note/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/note/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
</body>
</html>