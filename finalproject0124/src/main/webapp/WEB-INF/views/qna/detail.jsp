<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/detail.jsp</title>
</head>
<body>
	<h1>문의내역</h1>
	<form action="" method="post">
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }">
		<table border="1" width="600">
			<tr>
				<td>글번호</td>
				<td>${vo.qnacode }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${vo.mid }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${vo.title }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<div style="width: 400px; height: 200px">${vo.content }</div>
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${vo.regdate }</td>
			</tr>
			<sec:authentication property="principal" var="pinfo" />
			<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.username eq vo.mid }">
					<tr>
						<th>수정</th>
						<td><a href="${cp }/qna/update?num=${vo.qnacode}">수정</a></td>
					</tr>
					<tr>
						<th>삭제</th>
						<td><a href="${cp }/qna/delete?num=${vo.qnacode}">삭제</a></td>
					</tr>
				</c:if>
			</sec:authorize>
			<tr>
				<th><div>
						<b>댓글</b>
						<sec:authorize access="isAuthenticated()">
							<button>등록</button>
						</sec:authorize>
					</div></th>
			</tr>
			<tr>
				<td>이전글</td>
				<td><a
					href="${pageContext.request.contextPath }/qna/detail?num=${prev.num}">${prev.title }</a></td>
			</tr>
			<tr>
				<td>다음글</td>
				<td><a
					href="${pageContext.request.contextPath }/qna/detail?num=${next.num}">${next.title }</a></td>
			</tr>
		</table>
	</form>
</body>
</html>