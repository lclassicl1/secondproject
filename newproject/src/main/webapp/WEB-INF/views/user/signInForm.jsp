<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
<script>
var code=""; //이메일로 전송되는 인증번호 저장을 위한 변수작성

/* 인증번호 이메일 전송 */
$(document).ready(function(){
	$(".mail_button").click(function(){
		var email = $(".Email").val();// 입력한 이메일
		var checkBox = $("#mail-check-input"); //인증번호 입력란
	    $.ajax({
	        type:"GET",
	        url:"mailCheck?email=" + email,
	        success:function(data){ //data는 signUpController에서 return된 num을 받음
	        	console.log("data : " + data);
	        	checkBox.attr("disabled", false); //disabled해제(입력 가능으로 바뀜)
	        	checkBox.attr("placeholder", "인증번호 6자리를 입력해주세요");
	        	code = data;
	        }
	    });
	});
});

/* 인증번호 비교*/
$(document).ready(function(){
	$("#mail-check-input").blur(function(){ //focus는 이벤트 발생시 포커스 받을 때, blur는 이벤트 발생시 포커스를 잃을 때
		var inputCode = $("#mail-check-input").val(); //입력코드(사용자가 입력하는 인증번호)
		var checkResult = $("#mail_check_input_box_warn"); //비교 결과

		if(inputCode==code){
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class", "correct");
			return true;
		} else{
			checkResult.html("인증번호가 일치하지 않습니다!");
			checkResult.attr("class", "incorrect");
			return false;
		}
	});
	
	let container = document.getElementById('container')

	toggle = () => {
	  container.classList.toggle('sign-in')
	  container.classList.toggle('sign-up')
	}

	setTimeout(() => {
	  container.classList.add('sign-in')
	}, 200)
});
</script>
</head>
<body>
	<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
      <!-- SIGN UP -->
      <div class="col align-items-center flex-col sign-up">
        <div class="form-wrapper align-items-center">
          <div class="form sign-up">
          	<form:form action="/signUp" modelAttribute="user" method="post" accept-charset="utf-8">
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <form:input path="id" name="id" oninput="checkId()" placeholder="Username"/><br/>
				<form:errors path="id"/>
            </div>
            <div class="input-group">
              <i class='bx bx-mail-send'></i>
              <form:password path="password" name="password" placeholder="Password"/><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" name="re_password" placeholder="Confirm password"/><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" placeholder="Confirm password">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <form:input path="name" name="name" placeholder="name"/><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <form:input path="zipcode" name="zipcode" placeholder="zipcode"/><button type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <form:input path="address" name="address" placeholder="address"/><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <form:input path="detailaddress" name="detailaddress" placeholder="detailaddress"/><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <form:input path="pricynum" name="pricynum" placeholder="pricynum"/><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <form:input path="email" class="Email" name="email" placeholder="email"/><button type="button" class="mail_button" onclick="mail_button">본인인증</button><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="text" id="mail-check-input" name="email_check" disabled="disabled" placeholder="이메일 입력과 본인인증을 해주세요" maxlength="6" placeholder="email_check"/>
              <span id="mail_check_input_box_warn"></span><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <form:input path="phonenum" name="phonenum" placeholder="phonenum"/><br/>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <form:radiobutton path="gender" name="gender" value="M"/> 남성
		<form:radiobutton path="gender" name="gender" value="F"/> 여성<br/>
            </div>
            <button>
              Sign up
            </button>
            </form:form>
            <p>
              <span>
                Already have an account?
              </span>
              <b onclick="toggle()" class="pointer">
                Sign in here
              </b>
            </p>
          </div>
        </div>
      
      </div>
      <!-- END SIGN UP -->
      <!-- SIGN IN -->
      <div class="col align-items-center flex-col sign-in">
        <div class="form-wrapper align-items-center">
          <div class="form sign-in">
          	<form:form action="/signIn" modelAttribute ="user" method="post">
	            <div class="input-group">
	              <i class='bx bxs-user'></i>
	              <form:input path="id"  name="id" placeholder="ID" />
					<span class="fieldError"><form:errors path="id"/></span>
	            </div>
	            <div class="input-group">
	              <i class='bx bxs-lock-alt'></i>
	              <form:password path="password" placeholder="Password" />
				<span class="fieldError"><form:errors path="password" /></span>
	            </div>
	            <input type="submit" value="가입하기"/>
            </form:form>
            <p>
              <b>
               <a href="<%=request.getContextPath()%>/findId"> Forgot ID?</a>
              </b>
            </p>
            <p>
              <b>
                <a href="<%=request.getContextPath()%>/findPw">Forgot password?</a>
              </b>
            </p>
            <p>
              <span>
                Don't have an account?
              </span>
              <b onclick="toggle()" class="pointer">
                Sign up here
              </b>
            </p>
          </div>
        </div>
        <div class="form-wrapper">
    
        </div>
      </div>
      <!-- END SIGN IN -->
    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
      <!-- SIGN IN CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="text sign-in">
          <h2>
            Welcome to DAMOYE
          </h2>
  
        </div>
        <div class="img sign-in">
    
        </div>
      </div>
      <!-- END SIGN IN CONTENT -->
      <!-- SIGN UP CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="img sign-up">
        
        </div>
        <div class="text sign-up">
          <h2>
            Join with us
          </h2>
  
        </div>
      </div>
      <!-- END SIGN UP CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
  </div>
</body>
</html>