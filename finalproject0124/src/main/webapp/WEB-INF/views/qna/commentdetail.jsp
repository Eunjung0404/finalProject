<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/commentdetail.jsp</title>
</head>
<body>
<div>
	<i>댓글 폼</i>
</div>
<div>
	<b>댓글</b><br>
	<input type="text" id="content" name="contnet">
</div>
<div>
	<b>아이디</b><br>
	<input type="text" id="id" name="id">
</div>
<div>
	<b>작성일</b><br>
	<input type="text" id="regdate" name="regdate">
</div>
<div>
	<input type="submit" value="수정">
	<input type="submit" value="삭제">
	<input type="button" value="닫기">
</div>
</body>
<script type="text/javascript">
	function remove(commentcode, replyer, callback, error) {
		console.log("===========================");
		console.log(JSON.stringify({
			commentcode : commentcode,
			replyer : replyer
		}));

		$.ajax({
			type : 'delete',
			uri : '/detail/' + commentcode,
			data : JSON.stringify({
				commentcode : commentcode,
				replyer : replyer
			}),
			contentType : "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
</script>
</html>