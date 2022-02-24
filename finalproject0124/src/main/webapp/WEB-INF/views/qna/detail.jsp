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
#all {
	background-color: #f5f5f5;
	text-align: center;
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	align-items: center;
}

.comm1 {
	width: 400px;
	height: 100px;
	border: 1px solid #aaa;
	border-radius: 10px;
	padding: 10px;
	margin-top: 30px;
	margin-bottom: 20px;
}

h2 {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

#list {
	border: 1px solid gray;
	border-radius: 10px;
	border-style: groove;
	background-color: #fcfcfc;
	margin-bottom: 30px;
}

td a {
	text-decoration: none;
}

.iddiv {
	margin: 20px;
}

.commdiv {
	margin: 10px;
}

.commdiv b {
	position: relative;
	bottom: 30px;
}

.commList {
	margin-top: 30px;
	margin-bottom: 10px;
}
#btnAdd{
	width: 60px;
	height: 30px;
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
					pageHTML +="<a href='javascript:list("+ i + ")'><span style='color:black'>["+ i +"]</span></a>";
				}else{
					pageHTML +="<a href='javascript:list("+ i + ")'><span style='color:black'>["+ i +"]</span></a>";
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
	<div id="all">
		<h2>문의내역</h2>
		<div id="list">
			<form action="${pageContext.request.contextPath }/qna/detail"
				method="post">
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }">
				<table class="table table-hover">
					<tr>
						<th>글번호</th>
						<td>${vo.qnacode }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${vo.mid }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${vo.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div style="width: 400px; height: 200px">${vo.content }</div>
						</td>
					</tr>
					<tr>
						<th>작성일</th>
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
								<td><a href="${cp }/qna/delete?qnacode=${vo.qnacode}" style="color:red">삭제</a></td>
							</tr>
						</c:if>
					</sec:authorize>
				</table>
			</form>
		</div>
		<div id="commentForm">
			<div class="iddiv">
				<b>ID</b> <input type="text" id="id" name="id"
					value='<sec:authentication property="principal.username"/>'
					readonly="readonly"> <br>
			</div>
			<div class="commdiv">
				<b>댓글</b>
				<textarea rows="3" cols="40" id="content1"></textarea>
			</div>
			<br> <input type="button" value="등록" id="btnAdd">
		</div>
		<div id="commList"></div>
		<div id="page"></div>
	</div>
</body>
</html>