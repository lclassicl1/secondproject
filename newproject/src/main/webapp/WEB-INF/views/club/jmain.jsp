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
	$(function(){
		$('#clubInsert').click(function(){
			location.href='${cPath}/club/clubCre';
		});
	});

</script>
<title>main</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"></jsp:include></header>
${userId }님, ${userName }님	반갑습니다!<br/>
<a href="/logout">로그아웃</a>
<%-- ${cPath}/club/list?categoryNo=2 --%>
카테고리:${category}
<table>
	<tbody>
	<c:forEach var="data" items="${category}">
		<tr>
			<th><a href="${cPath}/club/clist?categoryNo=${data.categornNo}"><img class="imgs" src="${cPath}/img/cook.png"/></a></th>
			<td class="c1">${data.categornName}</td>				
		</tr>
	</c:forEach>
		<tr>
			<td colspan="2"><input type="button" value="클럽개설" id="clubInsert"/></td>
		</tr>
	</tbody>
</table>
<footer><jsp:include page="/resources/module/footer.jsp"></jsp:include></footer>
</body>
</html>