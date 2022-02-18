<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/result1.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${result=='success' }">
		<script type="text/javascript">
			alert("등록 되었습니다.");
			location.href="${cp}/qna/list";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("등록 실패");
			location.href="${cp}/qna/list";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>