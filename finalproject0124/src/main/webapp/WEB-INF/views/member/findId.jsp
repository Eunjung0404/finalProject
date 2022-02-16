<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<style>
	div #main{
		padding-top: 100px;
	}
	div #name {
		padding-bottom: 10px;
	}
	div #phone {
		padding-bottom: 10px;
	}
	div #email {
		padding-bottom: 10px;
	}
	input.write{
		border-radius: 0.5rem;
	}
	div #btn1{
	    border: 0;
	    color: #fff;
	    background-color: #503396;
	    height: 34px;
	    padding: 0 10px;
	    border-radius: 4px;
	    margin-right: 10px;
	    margin-top: 10px;
	}
	div #btn2{
	    border: 0;
	    color: #fff;
	    background-color: #503396;
	    height: 34px;
	    padding: 0 10px;
	    border-radius: 4px;
	    margin-right: 10px;
	    margin-top: 10px;
	}
</style>

<div class="container" id="main">
<!--   <h2>아이디 / 비밀번호 찾기</h2> -->
  <p><strong style="font-size: 20px;">아이디 찾기 방법을 선택해 주세요.</strong></p>
  <div id="accordion">
  <form:form name="find_id_form" id="find_id_form" >
	    <div class="card">
	      <div class="card-header">
	        <a class="card-link" data-toggle="collapse" href="#collapseOne">
	          등록된 휴대폰 번호로 찾기
	        </a>
	      </div>      
	      <div id="collapseOne" class="collapse show" data-parent="#accordion">
	        <div class="card-body">
	        	<div id="name">
	        		<input class="write" type="text" name="mname" id="mname" placeholder="이름" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="phone">
	        		<input class="write" type="text" name="mphone" id="mphone" placeholder="휴대폰 번호 ('-'없이 입력)" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="findId">
	        		<button type="button" id="btn1" >아이디 찾기</button>
	        	</div>
	        </div>
	      </div>
	    </div>
    </form:form>   
    
    
    <form:form name="find_id_form2" id="find_id_form2">
	    <div class="card">
	      <div class="card-header">
	        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
	        등록된 이메일 주소로 찾기
	      </a>
	      </div>
	      <div id="collapseTwo" class="collapse" data-parent="#accordion">
	        <div class="card-body">
	        	<div id="name">
	       			<input class="write" type="text" name="mname" id="mname2" placeholder="이름" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="email">
	        		<input class="write" type="email" name="memail" id="memail" placeholder="이메일 주소" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="findId">
	        		<button type="button" id="btn2">아이디 찾기</button>
	        	</div>
	        </div>
	      </div>
	    </div>
    </form:form>
  </div>
</div>


<script>
	//이름과 전화번호로 아이디 찾기
		$("#btn1").on("click", function(){
			let form1 = $("#find_id_form").serialize();
			if(document.getElementById("mname").value == ""){
				alert("이름을 입력해주세요.");
				document.find_id_form.mname.focus();
				return false;
			}
			if (document.getElementById("mphone").value == "") {
				alert("전화번호를 입력해주세요.");
				document.find_id_form.mphone.focus();
				return false;
			}
			$.ajax({
				url: "${cp}/findId",
				type: "POST",
				data: form1,
				dataType: "json",
				success: function(data){
					alert("회원님의 아이디는 [" + data.mid + "] 입니다.");
					location.href="${pageContext.request.contextPath}/login";
				}, error: function(data){
					alert("이름 또는 전화번호가 일치하지 않습니다." );
				}
			});
		});
</script>

<script>
	// 이름과 이메일로 아이디 찾기
		$("#btn2").on("click", function(){
			let form2 = $("#find_id_form2").serialize();
			if (document.getElementById("mname2").value == "") {
				alert("이름을 입력해주세요.");
				document.find_id_form2.mname2.focus();
				return false;
			}
			if (document.getElementById("memail").value == ""){
				alert("이메일을 입력해주세요.");
				document.find_id_form2.memail.focus();
				return false;
			}
			$.ajax({
				url: "${cp}/findId2",
				type:"post",
				data: form2,
				dataType: "json",
				success: function(data){
					alert("회원님의 아이디는 [" + data.mid + "] 입니다.");
					location.href="${cp}/login";
				}, error: function(data){
					alert("이름 또는 이메일이 일치하지 않습니다.");
				}
			});
		});


</script>