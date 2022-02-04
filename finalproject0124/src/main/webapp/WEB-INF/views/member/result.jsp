<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<input type="button" value="홈으로" onclick="home()">
${code}
${result}
${msg}
${vo.mid }
<script>
	function home() {
		location.href = "${cp}/";
	}
</script>