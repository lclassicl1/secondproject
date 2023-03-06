<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
var code=""; //이메일로 전송되는 인증번호 저장을 위한 변수작성

function checkId(){
var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
$.ajax({
    url:'./idCheck', //Controller에서 요청 받을 주소
    type:'post', //POST 방식으로 전달
    data:{id:id},
    success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
        if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
            $('.id_ok').css("display","inline-block"); 
            $('.id_already').css("display", "none");
        } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
            $('.id_already').css("display","inline-block");
            $('.id_ok').css("display", "none");
            alert("아이디를 다시 입력해주세요");
            $('#id').val('');
        }
    },
    error:function(){
        alert("에러입니다");
    }
});
};

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
});

</script>
<style>
	.correct{color:green;}
	.incorrect{color:red;}
</style>
</head>
<body>
<h3>회원가입</h3>
	<hr/>
	<form:form action="/signUp" modelAttribute="user" method="post" accept-charset="utf-8">
	아이디:<form:input path="id" name="id" oninput="checkId()"/><br/>
	비밀번호:<form:password path="password" name="password"/><br/>
	비밀번호확인:<input type="password" name="re_password"/><br/>
	이름:<form:input path="name" name="name"/><br/>
	우편번호:<form:input path="zipcode" name="zipcode"/><button type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br/>
	주소:<form:input path="address" name="address"/><br/>
	상세주소:<form:input path="detailaddress" name="detailaddress"/><br/>
	주민등록번호:<form:input path="pricynum" name="pricynum"/><br/>
	이메일:<form:input path="email" class="Email" name="email"/><button type="button" class="mail_button" onclick="mail_button">본인인증</button><br/>
	이메일 인증:<input type="text" id="mail-check-input" name="email_check" disabled="disabled" placeholder="이메일 입력과 본인인증을 해주세요" maxlength="6"/>
	<span id="mail_check_input_box_warn"></span><br/>
	전화번호:<form:input path="phonenum" name="phonenum"/><br/>
	성별:<form:radiobutton path="gender" name="gender" value="M"/> 남성
		<form:radiobutton path="gender" name="gender" value="F"/> 여성<br/>
	
	<input type="submit" value="가입하기">
	<input type="reset" value="다시쓰기">
	</form:form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
</body>
</html>