<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>note/detail.jsp</title>
<style type="text/css">
	#all {
	background-color: #f5f5f5;
	text-align: center;
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	align-items: center;
}
h2 {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}
#list {
	border: 1px solid gray;
	border-radius: 10px;
	border-style: groove;
	background-color: #fcfcfc;
	margin-bottom: 30px;
}
td a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div id="all">
		<h2>공지사항</h2>
		<div id="list">
			<form action="${pageContext.request.contextPath }/note/detail">
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }">
				<table class="table table-hover">
					<tr>
						<td>제목</td>
						<td>${vo.title }</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${vo.regdate }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<div style="width: 400px; height: 200px">${vo.content }</div>
						</td>
					</tr>
					<!-- 관리자만 보이게 만들기(수정,삭제) -->
					<sec:authentication property="principal.username" var="pinfo" />
			
					<sec:authorize access="isAuthenticated()">
						<c:if test="${fn:startsWith(pinfo,'admin')}">
							<tr>
								<th>수정</th>
								<td><a href="${cp }/note/update?num=${vo.notecode}">수정</a></td>
							</tr>
							<tr>
								<th>삭제</th>
								<td><a href="${cp }/note/delete?num=${vo.notecode}">삭제</a></td>
							</tr>
						</c:if>
					</sec:authorize>
					
				</table>
			</form>
		</div>
		<div>
			<a href="${pageContext.request.contextPath }/note/list">목록으로</a>
		</div>
	</div>
</body>
</html>