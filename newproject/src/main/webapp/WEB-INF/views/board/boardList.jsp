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
<title>클럽게시판</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>
	<div><h1>클럽 페이지</h1></div>
	<%-- 현재 세션 아이디:${sessionId} --%>
	<%-- 게시글정보: ${boardList} --%>
	<table border="1">
		<tr>
			<th>글번호</th><th>타입</th><th>제목</th><th>작성자</th><th>작성일</th><th>수정일</th><th>댓글</th>
		</tr>
		<c:if test="${empty boardList}">
		<tr>
			<td colspan="5">작성된 글이 없습니다</td>
		</tr>	
		</c:if>
		<c:if test="${not empty boardList}">
			<c:forEach items="${boardList}" var="list">
			<tr> 
				<td></td>
				<td>${list.boardNo}</td>
				<td>${list.bType}</td>
				<td><a href="${path}/board/cNo=${list.cNo}/boardNo=${list.boardNo}">${list.bTitle}</a></td>
				<td>${list.bWriter}</td>
				<td>${list.bRegdate}</td>
				<td>${list.bModdate}</td>
				<td>${list.commCnt}</td>
			</tr>	
			</c:forEach>
		<tr>
			<td colspan="5"><input type="button" value="글쓰기" id="boardWrite"/></td>
		</tr>
		</c:if>
		
	</table>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>