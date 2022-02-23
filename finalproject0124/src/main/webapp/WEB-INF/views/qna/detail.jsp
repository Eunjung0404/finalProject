<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/detail.jsp</title>
<style>
.comm1 {
	width: 400px;
	height: 100px;
	border: 1px solid #aaa;
	padding: 5px;
	margin-top: 5px;
}
</style>
<script type="text/javascript"
	src="/finalproject/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){
	$("#btnAdd").click(function(){
	//	alert('ddd')
		let id=$("#id").val();
		let content=$("#content1").val();
		alert(content)
		$.ajax({
			url:'${cp}/comment/insert',
			data:{"id":id,"content":content,"qnacode":'${vo.qnacode}'},
			dataType:'json',
			success:function(data){
				if(data.code=='success'){
					//alert('등록 성공!');
					list(1);
				}else{
					alert('등록 실패!');
				}
			}
		});
	});
	list(1);
  });


function removeComm(commentcode){
	//alert('삭제');
	$.ajax({
		url:'${cp}/comment/delete',
		data:{"commentcode":commentcode},
		dataType:'json',
		success:function(data){
			if(data.code=='success'){
				//alert('등록 성공!');
				list(1);
			}else{
				alert('삭제 실패!');
			}
		}
	});
}

function list(pageNum){
	$("#commList").empty();
	$.ajax({
		url:'${cp}/comment/list',
		data:{'pageNum':pageNum,'qnacode':${vo.qnacode}},
		dataType:'json',
		success:function(data){
			$(data.list).each(function(i,d){
				//console.log(d.commentcode);
				let id=d.id;
				let content=d.content;
				let commentcode=d.commentcode;
				let html="<div class='comm1'>" ;
				html += "ID : " + id +"<br>" ;
				html += "댓글 : " + content +"<br>";
				
				html += "<input type='button' value='삭제' onclick='removeComm("+ commentcode + ")'  >" ;
				html += "</div>";
				$("#commList").append(html);				
			});
			
			//페이징처리
			let startPage=data.startPageNum;
			let endPage=data.endPageNum;
			let pageCount=data.pageCount;
			let pageHTML="";
			
			if(startPage>5){
				pageHTML += "<a href='javascript:list("+ (startPage-1) +")'>이전</a>";
			}		
			for(let i=startPage;i<=endPage;i++){
				if(i==pageNum){
					pageHTML +="<a href='javascript:list("+ i + ")'><span>["+ i +"]</span></a>";
				}else{
					pageHTML +="<a href='javascript:list("+ i + ")'><span>["+ i +"]</span></a>";
				}
			}
			if(endPage<pageCount){
				pageHTML += "<a href='javascript:list("+ (endPage+1) +")'>다음</a>";
			}
			$("#page").html(pageHTML);
		}
	});
}

</script>
</head>
<body>
	<!-- <table class="table table-hover">
		<thead>
			<tr>
				<th scope="col" _msthash="2586857" _msttexthash="4987255">형</th>
				<th scope="col" _msthash="2586987" _msttexthash="15530073">열 제목</th>
				<th scope="col" _msthash="2587117" _msttexthash="15530073">열 제목</th>
				<th scope="col" _msthash="2587247" _msttexthash="15530073">열 제목</th>
			</tr>
		</thead>
		<tbody>
			<tr class="table-active">
				<th scope="row" _msthash="2594735" _msttexthash="22410817">활동적인</th>
				<td _msthash="2594449" _msttexthash="23261004">열 콘텐츠</td>
				<td _msthash="2594579" _msttexthash="23261004">열 콘텐츠</td>
				<td _msthash="2594709" _msttexthash="23261004">열 콘텐츠</td>
			</tr>
		</tbody>
	</table> -->
	<div>
		<h2>문의내역</h2>
		<form action="${pageContext.request.contextPath }/qna/detail"
			method="post">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }">
			<table class="table table-hover">
				<tr>
					<td msthash="2594449" _msttexthash="23261004">글번호</td>
					<td>${vo.qnacode }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${vo.mid }</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${vo.title }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<div style="width: 400px; height: 200px">${vo.content }</div>
					</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${vo.regdate }</td>
				</tr>
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username eq vo.mid }">
						<tr>
							<th>수정</th>
							<td><a href="${cp }/qna/update?qnacode=${vo.qnacode}">수정</a></td>
						</tr>
						<tr>
							<th>삭제</th>
							<td><a href="${cp }/qna/delete?qnacode=${vo.qnacode}">삭제</a></td>
						</tr>
					</c:if>
				</sec:authorize>
			</table>
		</form>
	</div>
	<div id="commList"></div>
	<div id="page"></div>
	<div id="commentForm">
		<b>아이디</b> <input type="text" id="id" name="id"
			value='<sec:authentication property="principal.username"/>'
			readonly="readonly"> <br> <b>댓글</b>
		<textarea rows="3" cols="40" id="content1"></textarea>
		<br> <input type="button" value="등록" id="btnAdd">
	</div>
</body>
</html>