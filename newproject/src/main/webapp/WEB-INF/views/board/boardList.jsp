<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>

  .container, .board, .c{
 	display: grid;
  	border: 1px solid;
  	text-align: center;
  	table-layout: auto;
  }

</style>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>
	<div><h1>클럽 페이지</h1></div>
	<%-- 현재 세션 아이디:${sessionId} --%>
	<%-- 게시글정보: ${boardList} --%>
	${boardList}
	<div class="container" style="display:table; width:100%;">
	
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">글번호</div>
	    <div class="c" style="display:table-cell">타입</div>
	    <div class="c" style="display:table-cell">제목</div>
	    <div class="c" style="display:table-cell">작성자</div>
	    <div class="c" style="display:table-cell">작성일</div>
	    <div class="c" style="display:table-cell">댓글</div>
	  </div>
	
	<c:if test="${empty boardList}">
	 <center>클럽에 첫번째 글을 작성해보세요</center>
	</c:if>

	<c:if test="${not empty boardList}">
		<c:forEach var="list" items="${boardList}">
		<c:if test="${list.bIsShow=='Y'}">
		  <div style="display:table-row">
	        <div class="c" style="display:table-cell">${list.boardNo}</div>
	        <div class="c" style="display:table-cell">${list.bType}</div>
	        <div class="c" style="display:table-cell"><a href="${path}/board/detail?cNo=${list.cNo}&boardNo=${list.boardNo}">${list.bTitle}</a></div>
	        <div class="c" style="display:table-cell">${list.bWriter}</div>
	        <div class="c" style="display:table-cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.bRegdate}"/></div>
	        <div class="c" style="display:table-cell">${list.commCnt}</div>
	  	  </div>
		</c:if>
		</c:forEach>
	</c:if>
	</div>
	<table border="1">
		<tr>
			<th>글번호</th><th>타입</th><th>제목</th><th>작성자</th><th>작성일</th><th>수정일</th><th>댓글</th>
		</tr>
		<c:if test="${empty boardList}">
		<tr>
			<td colspan="7">작성된 글이 없습니다</td>
		</tr>	
		</c:if>
		<c:if test="${not empty boardList}">
			<c:forEach var="list" items="${boardList}">
			<tr> 
				<td></td>
				<td>${list.boardNo}</td>
				<td>${list.bType}</td>
				<td><a href="${path}/board/cNo=${list.cNo}/boardNo=${list.boardNo}">${list.bTitle}</a></td>
				<td>${list.bWriter}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.bRegdate}"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.bModdate}"/></td>
				<td>${list.commCnt}</td>
			</tr>	
			</c:forEach>
		<tr>
			<td colspan="7"><input type="button" value="글쓰기" id="boardWrite"/></td>
		</tr>
		</c:if>
		
	</table>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>