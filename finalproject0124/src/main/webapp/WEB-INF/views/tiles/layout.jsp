<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title><tiles:insertAttribute name="title" /></title>
<style type="text/css">
</style>
</head>

<body>
	<div id="wrap" class="Container">
		<div>
			<div id="header" class="row" style="background-color: black;">
				<!-- tiles_member.xml의 <defintion>의 하위 태그인
				<put-attribute>태그의 name이 header인 JSP를 표시하겠다 -->
				<tiles:insertAttribute name="header" />
			</div>
			<div id="content" class="row">
				<tiles:insertAttribute name="body" />
			</div>

			<div id="footer" class="row">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>

		<div id="sridevar"
			style="z-index: 0; position: absolute; top: 0px; left: 50px;">
			<tiles:insertAttribute name="sidebar" />
		</div>
	</div>


</body>

</html>