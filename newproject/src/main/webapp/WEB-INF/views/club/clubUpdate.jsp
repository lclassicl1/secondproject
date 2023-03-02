<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<script>
//클럽변경
$(function(){
	$('#clubUpdate').click(function(){
		location.href='${path}/club/maintest';
	});
});
</script>
<title>클럽 수정</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>	
<form id="clubUp" action="${path}/club/clubUp" method="post">
클럽수정${clubDTO}
session:${loginUser}
<input type="hidden" name="cNo" value="${clubDTO.cNo}"/>
<table border="1" style="text-align:center;">
	<tr>
		<th>카테고리</th>
		<td>		
		<select name="categoryNo" id="categoryNo" required="required">
			<option value="0">선택</option>
			<option value="1">공부</option>
			<option value="2">요리</option>
		</select>		
		</td>
	</tr>
	<tr>
		<th>클럽명</th>
		<td><input type="text" name="cName" id="cName" required="required" autofocus="autofocus" value="${clubDTO.cName}"/></td>
	</tr>
	<tr>
		<th><input type="button" onclick="sample4_execDaumPostcode()" value="활동지역 "></th>
		<td><input type="hidden" id="sample4_roadAddress"/> <!-- 도로명주소 -->
			<input type="hidden" id="sample4_postcode" placeholder="우편번호">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="hidden" name="cLoc" id="sample4_jibunAddress"/><!-- 지번주소 -->
			<input type="hidden" id="sample4_detailAddress"/>
			<input type="text" name="cLoc" id="sample4_extraAddress" value="${clubDTO.cName}"/><!-- 동주소 -->
		</td>
	</tr>
	<tr>
		<th>클럽장</th>
		<td><input type="text" name="masterId" id="masterId" readonly="readonly" value="${loginUser.id}"/></td>
	</tr>
	<tr>
		<th>정원(명)</th>
		<td>
		<select name="cPeople" id="cPeople">
			<option value="10">선택</option>
			<option value="10">10명</option>
			<option value="30">30명</option>
			<option value="50">50명</option>
			<option value="100">100명</option>
		</select>		
		</td>
	</tr>
	<tr>
		<th>소개글</th>
		<td colspan="2"><input type="text" name="cIntro" id="cIntro" required="required" value="${clubDTO.cIntro}"/></td>
	</tr>
	<tr>
		<td colspan="2">
		<p style="text-align:right;"><input type="button" name="clubUpdate" id="clubUpdate" value="클럽변경"/></p>
		</td>
	</tr>
</table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>   
var themeObj = {// ,theme: { 아래 테마추가 함수에 테마 속성을  직접 넣어도됨}
		   //bgColor: "", //바탕 배경색
		   searchBgColor: "#0A13B8", //검색창 배경색
		   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
		   //pageBgColor: "", //페이지 배경색
		   //textColor: "", //기본 글자색
		   queryTextColor: "#FFFFFF" //검색창 글자색
		   //postcodeTextColor: "", //우편번호 글자색
		   //emphTextColor: "", //강조 글자색
		   //outlineColor: "", //테두리
		};

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
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
//                if(data.buildingName !== '' && data.apartment === 'Y'){
//                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
//                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }//oncomplete속성의 함수끝
            ,theme: themeObj //추가한 테마속성
        }).open();
    }//function Postcode()끝
</script>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>