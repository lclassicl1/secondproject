<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style type="text/css">
 .texta{
	  font-size:1.1em;
	  border: none;
	  resize: none;
	  }
</style>
<meta charset="UTF-8">
<script>
$(document).ready(function(){
	//클럽변경
	$(function(){
		$("#clubUpdate").on("click",function(){
			let categoryNo = $('#categoryNo').val();
			if(categoryNo == '' || categoryNo == null) {
				alert('카테고리를 선택해주세요.');
				$('#categoryNo').focus();
				return false;
			}
			let cName = $('#cName').val();
			if(cName == '' || cName == null) {
				alert('클럽명을 작성해주세요');
				$('#cName').focus();
				return false;
			}
			
			let cPeople = $('#cPeople').val();
			if(cPeople == '' || cPeople == 0) {
				alert('정원을 선택해주세요');
				$('#cPeople').focus();
				return false;
			}

			let cLoc = $('#cLoc').val();
			if(cLoc == '' || cLoc == null) {
				alert('지역을 입력해주세요');
				$('#cLoc').focus();
				return false;
			}
			
			let cIntro = $('#cIntro').val();
			if(cIntro == '' || cIntro == null) {
				alert('소개글을 작성해주세요');
				$('#cIntro').focus();
				return false;
			}

			var c=confirm("클럽 수정 성공!!");
			  if(c){
				  $('#clubUp').attr("action","${path}/club/clubUp").submit();
			  }else{
				 return false;		 
				 }
		  	});	
	});
});


</script>
<title>클럽 수정</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>	
<form id="clubUp" action="" method="post">
<input type="hidden" name="cNo" value="${clubDTO.cNo}"/>
<table style="text-align:center; display: flex; justify-content: center;">
	<tr>
		<th>카테고리</th>
		<td>
		<select name="categoryNo" id="categoryNo">
			<option value="0">선택</option>			
			<c:if test="${clubDTO.categoryNo==1}"><option value=1 selected="selected">공부</option></c:if>
			<option value=1>공부</option>
			<c:if test="${clubDTO.categoryNo==2}"><option value=2 selected="selected">요리</option></c:if>
			<option value=2>요리</option>
			<c:if test="${clubDTO.categoryNo==3}"><option value=3 selected="selected">운동</option></c:if>
			<option value=3>운동</option>
			<c:if test="${clubDTO.categoryNo==4}"><option value=4 selected="selected">반려동물</option></c:if>
			<option value=4>전체</option>
		</select>		
		</td>
	</tr>
	<tr>
		<th>클럽명</th>
		<td><input type="text" name="cName" id="cName" value="${clubDTO.cName}"/></td>
	</tr>
	<tr>
		<th>활동지역</th>
		<td>
			<input type="text" name="cLoc" id="cLoc" value="${clubDTO.cLoc}"/>
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
			<option value="0">선택</option>
			<c:if test="${clubDTO.cPeople==10}"><option value=10 selected="selected">10명</option></c:if>
			<option value=10>10명</option>
			<c:if test="${clubDTO.cPeople==30}"><option value=30 selected="selected">30명</option></c:if>
			<option value=30>30명</option>
			<c:if test="${clubDTO.cPeople==50}"><option value=50 selected="selected">50명</option></c:if>
			<option value=50>50명</option>
			<c:if test="${clubDTO.cPeople==100}"><option value=100 selected="selected">100명</option></c:if>
			<option value=100>100명</option>
		</select>		
		</td>
	</tr>
	<tr>
		<th>소개글</th>
		<td colspan="2">
			<pre><textarea class="texta" rows="20" cols="70" name="cIntro" id="cIntro" required="required">${clubDTO.cIntro}</textarea></pre>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<div style="text-align:right;">
		<input type="button" name="clubUpdate" id="clubUpdate" value="클럽수정" class="readmore"/>
		</div>
		</td>
	</tr>
</table>
</form>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>