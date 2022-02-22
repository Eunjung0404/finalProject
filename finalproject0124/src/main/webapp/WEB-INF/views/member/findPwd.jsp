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
  <p><strong style="font-size: 20px;">비밀번호 찾기 방법을 선택해 주세요.</strong></p>
  <div id="accordion">
  <form:form name="find_pwd_form" id="find_pwd_form" >
	    <div class="card">
	      <div class="card-header">
	        <a class="card-link" data-toggle="collapse" href="#collapseOne">
	          등록된 전화번호로 찾기
	        </a>
	      </div>      
	      <div id="collapseOne" class="collapse show" data-parent="#accordion">
	        <div class="card-body">
	        	<div id="name">
	        		<input class="write" type="text" name="mid" id="mid" placeholder="아이디" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="phone">
	        		<input class="write" type="text" name="mphone" id="mphone" placeholder="휴대폰 번호 ('-'없이 입력)" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="findId">
	        		<button type="button" id="btn1" >비밀번호 찾기</button>
	        	</div>
	        </div>
	      </div>
	    </div>
    </form:form>   
    
    
    <form:form name="find_pwd_form2" id="find_pwd_form2">
	    <div class="card">
	      <div class="card-header">
	        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
	        등록된 이메일 주소로 찾기
	      </a>
	      </div>
	      <div id="collapseTwo" class="collapse" data-parent="#accordion">
	        <div class="card-body">
	        	<div id="name">
	       			<input class="write" type="text" name="mid" id="mid2" placeholder="아이디" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="email">
	        		<input class="write" type="email" name="memail" id="memail" placeholder="이메일 주소" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="findId">
	        		<button type="button" id="btn2">비밀번호 찾기</button>
	        	</div>
	        </div>
	      </div>
	    </div>
    </form:form>
  </div>
</div>
    
    <script>
    	$("#btn1").on("click", function(){
    		let form1 = $("#find_pwd_form").serialize();
    		if ($("#mid").val() == "") { 
    			alert("아이디를 입력해주세요.");
    			$("#mid").focus();
    			return false;
    		} else if ($("#mphone").val() == "") {
    			alert("전화번호를 입력해주세요.");
    			$("#mphone").focus();
    			return false;
    		}
    		$.ajax({
    			url: "${cp}/findPwd2",
    			type: "post",
    			data: form1,
    			dataType: "json",
    			success: function(data){
    				location.href="${cp}/findPwdForm";
    				let email = data.memail;
    			}, error: function(){
    				alert("아이디 또는 전화번호가 일치하지 않습니다.");
    			}
    		});    		
    	});
    	
    	$("#btn2").on("click", function(){
    		let form2 = $("#find_pwd_form2").serialize();
    		let mid = $("#mid2").val();
    		let memail = $("#memail").val();
    		if ($("#mid2").val() == "") { 
    			alert("아이디를 입력해주세요.");
    			$("#mid2").focus();
    			return false;
    		} else if ($("#memail").val() == "") {
    			alert("이메일을 입력해주세요.");
    			$("#memail").focus();
    			return false;
    		}
    		$.ajax({
    			url: "${cp}/findPwd",
    			type: "POST",
    			data: form2,
    			dataType: "json",
    			success: function(data){
    				alert("해당 이메일로 인증번호를 보냈습니다.");
//     				console.log(data);
    				location.href="${cp}/emailAuth?mid=" + mid + "&memail=" + memail;
    			}, error: function(){
    				alert("아이디 또는 이메일이 일치하지 않습니다.");
    				console.log(data);
    			}
    		});    		
    	});
    </script>