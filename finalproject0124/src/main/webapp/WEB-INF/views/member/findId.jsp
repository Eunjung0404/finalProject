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
</style>

<div class="container" id="main">
<!--   <h2>아이디 / 비밀번호 찾기</h2> -->
  <p><strong style="font-size: 20px;">아이디 찾기 방법을 선택해 주세요.</strong></p>
  <div id="accordion">
  <form:form action="${cp }/findId" method="post" name="find_id_form" onsubmit="return findId(this)">
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
        		<button id="btn1">아이디 찾기</button>
        	</div>
        </div>
      </div>
    </div>
<!--         		<input type="button" onclick="findId()" id="btn1" value="아이디 찾기"> -->
    </form:form>   
    
    
    <form:form method="post" action="${cp }/findId2" name="find_id_form2" onsubmit="return findId2(this)">
	    <div class="card">
	      <div class="card-header">
	        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
	        등록된 이메일 주소로 찾기
	      </a>
	      </div>
	      <div id="collapseTwo" class="collapse" data-parent="#accordion">
	        <div class="card-body">
	        	<div id="name">
	       			<input class="write" type="text" name="mname" id="mname" placeholder="이름" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="email">
	        		<input class="write" type="email" name="memail" id="memail" placeholder="이메일 주소" style="width: 500pt; height: 30pt;"><br>
	        	</div>
	        	<div id="findId">
	        		<button id="btn2">아이디 찾기</button>
	        	</div>
	        </div>
	      </div>
	    </div>
    </form:form>
  </div>
</div>


<script>
	function findId(){
		if (document.find_id_form.mname.value == "" || document.find_id_form.mphone.value == "" ){
			alert("이름과 전화번호를 입력해주세요.");
			return false;
		}
		document.find_id_form.submit();
	}
	function findId2(){
		if (document.find_id_form2.mname.value == "" || document.find_id_form2.memail.value == ""){
			alert("이름과 이메일을 입력해주세요.");
			return false;
		}
		document.find_id_form2.submit();
	}
</script>

<script>
	let form = document.find_id_form;
	let form2 = document.find_id_form2;	
	
	let name = form.mname.value;
	let phone = form.mphone.value;
	
	let action = form.action;
	let action2 = form2.action;
	
	
	
</script>