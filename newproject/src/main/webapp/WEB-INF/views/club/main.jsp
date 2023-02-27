<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<style>
.imgs{
    position: relative;
    width:250px;
	height:200px;
    margin: 10px;
    border: 3px solid transparent;
    border-radius: 50%;
    background-image: linear-gradient(#fff, #fff), 
    linear-gradient(to right, red 0%,  orange 100%);
    background-origin: border-box;
    background-clip: content-box, border-box;
	}
.c1{
 	text-align:center; 
	}	
</style>
<script>
	//클럽개설
	$(function(){
		$('#clubCreate').click(function(){
			location.href='${cPath}/club/clubCre';
		});
	});

</script>
<title>이게 메인</title>
</head>
<body>
<table>
	<tbody>
		<tr>
			<th><a href="${cPath}/club/clist?categoryNo=2"><img class="imgs" src="/resources/img/cook.png"/></a></th>
			<th><a href="${cPath}/club/clist?categoryNo=1"><img class="imgs" src="/resources/img/study.png"/></a></th>
		</tr>
		<tr>
			<td class="c1">cook</td>
			<td class="c1">study</td>				
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" name="clubCreate" id="clubCreate" value="클럽개설"/>
			</td>
		</tr>
	</tbody>
</table>
</body>
</html>