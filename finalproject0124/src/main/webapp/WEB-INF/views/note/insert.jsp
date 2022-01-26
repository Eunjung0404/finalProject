<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>note/insert.jsp</title>
</head>
<body>
	<h2>공지쓰기</h2>
	<form method="post"
		action="${pageContext.request.contextPath }/note/insert">
		<table>
			<tr>
				<th><label for="title">공지제목</label></th>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<th><label for="content">공지내용</label></th>
				<td><textarea rows="5" cols="50" name="content"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="등록"><input type="reset" value="취소">
	</form>
</body>
</html>