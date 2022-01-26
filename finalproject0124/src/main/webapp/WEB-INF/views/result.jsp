<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
상태 ${msg }
<input type="button" value="홈으로" onclick="home()">
${code} ${result}
<script>
	function home() {
		location.href = "${cp}/";
	}
</script>

