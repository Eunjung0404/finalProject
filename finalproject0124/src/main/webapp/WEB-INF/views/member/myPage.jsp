<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form method="post" action="${cp }/member/edit">
	<div class="form-group">
		<label for="id">아이디</label> 
			<input type="text" class="form-control" id="mid" name="mid" value="${vo.mid }" readonly="readonly">
		<div class="eheck_font" id="idCheck"></div>
	</div>


	<div class="form-group">
		<label for="pwd">비밀번호</label> <input type="password" name="mpwd"
			id="mpwd" value="${vo.mpwd }">
		<div class="eheck_font" id="pwd_check"></div>
	</div>


	<div class="form-group">
		<label for="name">이름</label> <input type="text" class="form-control"
			id="mname" name="mname" value="${vo.mname }">
		<div class="eheck_font" id="name_check"></div>
	</div>

	<div class="form-group">
		<label for="birth">생년월일</label> <input type="tel" class="form-control"
			id="birth" name="birth" value="${vo.birth }">
		<div class="eheck_font" id="birth_check"></div>
	</div>

	<div class="form-group">
		<label for="email">이메일 주소</label> <input type="email"
			class="form-control" id="memail" name="memail" value="${vo.memail }">
		<div class="eheck_font" id="email_check"></div>
	</div>

	<div class="form-group">
		<label for="phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input type="tel"
			class="form-control" id="mphone" name="mphone"
			value="${vo.mphone }">
		<div class="eheck_font" id="phone_check"></div>
	</div>

	<div class="form-group">
		<label for="addr">주소</label> <input type="text" class="form-control"
			id="maddr" name="maddr" value="${vo.maddr }">
		<div class="eheck_font" id="address_check"></div>
	</div>
	
	<input type="submit" value="수정">
</form:form>	
	
