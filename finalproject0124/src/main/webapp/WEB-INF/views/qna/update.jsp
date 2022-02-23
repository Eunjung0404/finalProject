<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/update.jsp</title>
</head>
<body>
	<h2>문의하기</h2>
	<form method="post"
		action="${pageContext.request.contextPath }/qna/update">
		<table>
			<tr>
				<th><label for="qnacode">글번호</label></th>
				<td><input type="text" name="qnacode" value="${vo.qnacode }" readonly="readonly"></td>
			</tr>
			<tr>
				<th><label for="mid">작성자</label></th>
				<td><input type="text" name="mid" id="mid" readonly="readonly"
					value="${vo.mid }"></td>
			</tr>
			<tr>
				<th><label for="title">문의제목</label></th>
				<td><input type="text" name="title" id="title" readonly="readonly"
					value="${vo.title }"></td>
			</tr>
			<tr>
				<th><label for="content">문의내용</label></th>
				<td><textarea rows="5" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<th><label for="pwd">비밀번호</label></th>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
		</table>
		<input type="submit" value="등록"><input type="reset" value="취소">
	</form>
</body>
</html>