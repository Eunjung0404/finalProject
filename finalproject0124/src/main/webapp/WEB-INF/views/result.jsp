<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
상태 ${msg }
</body>
</html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<input type="button" value="홈으로" onclick="home()">
${code}
${result}
<script>
	function home() {
		location.href = "${cp}/";
	}
</script>

