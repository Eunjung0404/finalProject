<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/password.jsp</title>
<style type="text/css">
.alldiv {
	background-color: #f5f5f5;
	text-align: center;
	height: 500px;
	display: flex;
    justify-content: center;
}

.maindiv {
	border: 1px solid gray;
    border-radius: 10px;
    border-style: groove;
    background-color: #fcfcfc;
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    align-content: space-around;
    width: 600px;
    height: 400px;
    padding: 100px;
    margin-top: 50px;
}
.maindiv h2{
	margin-bottom: 40px;
}
.maindiv form{
	margin-bottom: 60px;
}
</style>
</head>
<body>
	<div class="alldiv">
		<div class="maindiv">

			<h2>비밀번호 입력</h2>
			<form action="${pageContext.request.contextPath }/qna/detail"
				method="post">
				<input type="hidden" name="num" value="${num}">
				<table>
					<tr>
						<th><label for="pwd">비밀번호</label></th>
						<td><input type="password" name="pwd" id="pwd"> <input
							type="submit" value="확인"></td>
					</tr>
				</table>
			</form>
			<a href="${pageContext.request.contextPath }/qna/list">목록으로</a>
		</div>
	</div>
</body>
</html>