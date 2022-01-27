<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/result.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${result=='success' }">
		<script type="text/javascript">
			alert("확인 되었습니다.");
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("실패 되었습니다.");
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>