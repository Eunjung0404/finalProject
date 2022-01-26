<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>note/detail.jsp</title>
</head>
<body>
<h2>공지사항</h2>
	<table border="1" width="600">
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
		<tr>
			<th>수정</th>
			<td><a href="${cp }/note/update?num=${vo.notecode}">수정</a></td>
		</tr>
		<tr>
			<th>삭제</th>
			<td><a href="${cp }/note/delete?num=${vo.notecode}">삭제</a></td>
		</tr>
		<%-- <tr>
			<td>이전글</td>
			<td><a
				href="${pageContext.request.contextPath }/note/detail?num=${prev.num}">${prev.title }</a></td>
		</tr>
		<tr>
			<td>다음글</td>
			<td><a
				href="${pageContext.request.contextPath }/note/detail?num=${next.num}">${next.title }</a></td>
		</tr> --%>
	</table>
	<div>
		<a href="#">목록</a>
	</div>
</body>
</html>