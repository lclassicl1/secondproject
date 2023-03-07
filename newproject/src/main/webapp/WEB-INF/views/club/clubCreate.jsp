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

$(document).ready(function(){
		//클럽개설
		$(function(){
		$("#createDone").on("click",function(){
			var c=confirm("클럽 개설 성공!!");
			  if(c){
				  $('#creaFrm').attr("action","${path}/club/clubCre").submit();
			  }else{
				 return false;		 }
		  	});	
	});
});

</script>
<title>클럽 개설</title>
</head>
<body>
session: ${loginUser}<br/>
<header><jsp:include page="/resources/module/header.jsp"/></header>	
<form id="creaFrm" action="" method="post">
<table border="1" style="text-align:center;">
	<tr>
		<th>카테고리</th>
		<td>		
		<select name="categoryNo" id="categoryNo" required="required">
			<option value=0>선택</option>
			<option value=1>공부</option>
			<option value=2>요리</option>
			<option value=3>운동</option>
			<option value=4>반려동물</option>
		</select>		
		</td>
	</tr>
	<tr>
		<th>클럽명</th>
		<td><input type="text" name="cName" id="cName" required="required" autofocus="autofocus" placeholder="클럽명을 입력해주세요."/></td>
	</tr>
	<tr>
		<th>클럽장</th>
		<td><input type="text" name="masterId" id="masterId" readonly="readonly" value="${loginUser.id}"/></td>
	</tr>
	<tr>
		<th>정원(명)</th>
		<td>
		<select name="cPeople" id="cPeople" required="required">
			<option value=0>선택</option>
			<option value=10>10명</option>
			<option value=30>30명</option>
			<option value=50>50명</option>
			<option value=100>100명</option>
		</select>		
		</td>
	</tr>
	<tr>
		<th>활동지역(구)</th>
		<td>
			<input type="text" name="cLoc" id="cLoc" required="required" placeholder="예시)서울시 강남구"/>
		</td>
	</tr>
	<tr>
		<th>소개글</th>
		<td colspan="2">
			<textarea rows="30" cols="80" name="cIntro" id="cIntro" required="required" placeholder="클럽을 소개해주세요!"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="button" name="createDone" id="createDone" value="클럽개설"/>
		</td>
	</tr>
</table>
</form>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>