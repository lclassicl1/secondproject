<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function(){
		$('#noticeWrite').click(function(){
			location.href='${path}/notice/insert';
		});
	});

</script>
<title>Insert title here</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>
	<div><h1>공지사항 페이지</h1></div>
	<%-- 총 게시글수: ${result} --%>
	<%-- 현재 세션 아이디:${sessionId} --%>
	<%-- 게시글정보: ${noticeList} --%>
	<table border="1">
		<tr>
			<th><input type="checkbox"/></th><th>제목</th><th>작성자</th><th>작성시간</th><th>조회수</th>
		</tr>
		<c:if test="${empty noticeList}">
		<tr>
			<td colspan="5">작성된 공지사항이 없습니다</td>
		</tr>	
		</c:if>
		<c:if test="${not empty noticeList}">
			<c:forEach items="${noticeList}" var="list">
			<tr> 
				<td><input type="checkbox"/></td>
				<td><a href="${path}/notice/read?no=${list.no}">${list.title}</a></td>
				<td>${list.writername}</td>
				<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
				<td>${list.readcnt}</td>
			</tr>	
			</c:forEach>
		<tr>
			<td colspan="5"><input type="button" value="글쓰기" id="noticeWrite"/></td>
		</tr>
		</c:if>
		
	</table>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>