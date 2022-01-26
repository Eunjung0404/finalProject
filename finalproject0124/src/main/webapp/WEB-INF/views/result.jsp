<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>상태 ${msg }
<input type="button" value="홈으로" onclick="home()">
${code} ${result}
</body>
<script>
	function home() {
		location.href = "${cp}/";
	}
</script>
</html>