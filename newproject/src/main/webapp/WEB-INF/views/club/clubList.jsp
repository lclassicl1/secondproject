<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>클럽 리스트</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>	
클럽리스트: ${clubList}<br/>
	<p>카테고리명: ${category}</p>
	<!-- 검색 -->
	<div>
	<form id="searchFrm" method="get" action="${path}/club/searchCName">
			<input type="text" id="searchCName" name="searchCName"/>
			<input type="hidden" id="categoryNo" name="categoryNo" value="${param.categoryNo }"/>
			<input type="submit" class="btn btn-outline-primary mr-2" value="검색"/>
	</form>
	</div>
	<!-- 클럽리스트 -->
	<table border="1">
		<tr>
			<th>클럽명</th>
			<th>클럽장</th>
			<th>활동지역</th>
			<th>클럽개설일</th>
			<th>정원</th>
		</tr>
		<c:if test="${empty clubList}">
		<tr>
			<td colspan="5">개설된 클럽이 없습니다</td>
		</tr>	
		</c:if>
		<c:if test="${!empty clubList}">
			<c:forEach var="clist" items="${clubList}">
			<tr> 
				<td><a href="${path}/club/detail?&categoryNo=${clist.categoryNo}&cNo=${clist.cNo}">${clist.cName}</a></td>
				<td>${clist.masterId}</td>
				<td>${clist.cLoc}</td>
				<td><fmt:formatDate value="${clist.creDate}" type="date" pattern="yyyy.MM.dd"/></td>
		  		<td>${clist.cPeople}</td>
			</tr>	
			</c:forEach>
		</c:if>	
	</table>	
	
	
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>