<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div#movieimgform{
		width:800px; heigth:450px; border:solid 1px #BDBDBD; text-align:center;
		margin:auto; margin-top:40px; 
	}
</style>
</head>
<body>
<div id="movieimgform">
	<h2>포토이미지 추가</h2>
	<form method="post" action="${cp }/movie/addmovieimg?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		<input multiple="multiple" type="file" name="photofile"><br>
		<input type="submit" value="이미지 추가" style="margin:6px; background-color: #196ab3; min-width: 70px; 
			border: none; line-height: 30px; color: #ffffff; cursor: pointer;">
	</form>
</div>
</body>
</html>