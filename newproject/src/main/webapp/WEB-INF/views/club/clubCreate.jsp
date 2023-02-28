<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<script>
//클럽개설
$(function(){
	$('#createDone').click(function(){
		location.href='${cPath}/club/maintest';
	});
});
</script>
<title>클럽 개설</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>	
<form id="clubCreate" action="${cPath}/club/clubCre" method="post">
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
		<td><input type="text" name="cName" id="cName" required="required" autofocus="autofocus" placeholder="클럽명을 입력해주세요."/></td>
	</tr>
	<tr>
		<th>활동지역 주소api예정</th>
		<td><input type="text" name="cLoc" id="cLoc" required="required"/></td>
	</tr>
	<tr>
		<th>클럽장 세션값예정</th>
		<td><input type="text" name="masterId" id="masterId" value="가져올 예정"/></td>
	</tr>
	<tr>
		<th>정원(명)</th>
		<td>
		<select name="cPeople" id="cPeople" required="required">
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
		<td colspan="2"><input type="text" name="cIntro" id="cIntro" required="required" placeholder="클럽을 소개해주세요"/></td>
	</tr>
	<tr>
		<td colspan="2">
		<p style="text-align:right;">
				<input type="button" name="createDone" id="createDone" value="클럽개설"/>
			</a>
		</p>
		</td>
	</tr>
</table>
</form>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>