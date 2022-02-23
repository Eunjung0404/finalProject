<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#backgroundColor{background-color:#f5f5f5; }
	
	div#movieimgform{
		width:500px; border:solid 1px #BDBDBD; text-align:center;
		margin:auto; margin-top:80px; margin-bottom: 80px; background-color: white;
	}
	h2{text-align:center; padding: 20px 0 5px;}
</style>
</head>
<body>
<div id="backgroundColor">
	<div id="movieimgform">
		<h2>포토이미지 추가</h2>
		<form method="post" action="${cp }/movie/addmovieimg?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		
			<input type="hidden" name="moviecode" value="${param.moviecode }"> <!-- value 속성의 vo.xxx -->
			<input multiple="multiple" type="file" name="photofile"><br>
			
			<input type="submit" value="이미지 추가" style="margin:6px; background-color: #196ab3; min-width: 70px; 
				border: none; line-height: 30px; color: #ffffff; cursor: pointer; margin-bottom: 20px;">
		</form>
	</div>
</div>
</body>
</html>