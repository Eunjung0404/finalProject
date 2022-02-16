<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/insert.jsp</title>
<style type="text/css">
#maindiv {
	width: 100%;
	height: 800px;
	background-color: #EAEAEA;
}
#maindiv h2{
	text-align: center;
	margin-top: 60px;
	margin-bottom: 80px;
}
#fmdiv{
	position: absolute;
	left: 560px;
}
#tbdiv {
}
</style>
</head>
<body>
	<div id="maindiv">
		<h2>문의하기</h2>
		<div id="fmdiv">
			<form method="post"
				action="${pageContext.request.contextPath }/qna/insert">
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }">
				<div id="tbdiv">
					<table>
						<tr>
							<th><label for="mid">작성자</label></th>
							<td><input id="mid" name="mid"
								value='<sec:authentication property="principal.username"/>'
								readonly="readonly"></td>
						</tr>
						<tr>
							<th><label for="title">문의제목</label></th>
							<td><select name="title" size="1" id="title">
									<option>::분류 선택::</option>
									<option value="영화예매 문의">영화예매 문의</option>
									<option value="결제/취소 문의">결제/취소 문의</option>
									<option value="시사회/이벤트 문의">시사회/이벤트 문의</option>
									<option value="기타 문의">기타 문의</option>
							</select></td>
						</tr>
						<tr>
							<th><label for="content">문의내용</label></th>
							<td><textarea rows="5" cols="50" name="content"></textarea></td>
						</tr>
						<tr>
							<th><label for="pwd">비밀번호</label></th>
							<td><input type="password" name="pwd" id="pwd"
								placeholder="숫자 4자리"></td>
						</tr>
					</table>
				</div>
				<input type="submit" value="등록"><input type="reset"
					value="취소">
			</form>
		</div>
	</div>
</body>
</html>