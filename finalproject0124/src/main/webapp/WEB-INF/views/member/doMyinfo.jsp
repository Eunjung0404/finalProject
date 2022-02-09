<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<form:form method="post" action="#" id="editForm">
   <table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="mid" value="${info.mid }" readonly="readonly"></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="button" value="비밀번호 변경" onclick="changePwdForm()"></td>
		<tr>
	
		<tr>
			<th>이메일</th>
			<td><input type="email" name="memail" value="${info.memail }"></td>
		</tr>
		
		<tr>
			<th>성명</th>
			<td><input type="text" name="mname" value="${info.mname }"></td>
		</tr>
		
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birth" value="${info.birth }"></td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="mphone" value="${info.mphone }"></td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td><input type="text" name="maddr" value="${info.maddr }"></td>
		</tr>
		
	</table><br>
</form:form>

<button type="submit" id="bnt1">수정</button>
<button id="btn2" onclick="cancle()">취소</button>

<script>
	function cancle() {		
		location.href="${cp}/member/mypage";
	}
	function changePwdForm(){
		location.href="${cp}/member/changePwdForm";
	}
</script>
