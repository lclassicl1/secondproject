<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/default.css">
<meta charset="UTF-8">
<script>
	$(function(){
		$("#btnWrite").click(function(){
			location.href='${path}/board/boardWrite?cNo=${cNo}&num=${num}';
		});
	});
</script>
<title>클럽게시판</title>
<style>

	#clubMain{
		width: 66.6666%;
	}
	#tableCenter{
		display: flex;
	    justify-content: center;
		
	}

  .container, .board, .c{
  	border: 1px solid;
  	text-align: center;
  	table-layout: auto;
  	width:100px;
  }
    .c1{
  	border: 1px solid;
  	text-align: left;
  	padding: 5px;
  	table-layout: auto;
  }

</style>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>
	<%-- ${boardList}
	${cNo} <br/>
	${num} <br/>
	${boardPage}<br/>
	${categoryNo}
	${loginUser.id} --%>
<div id="subheader">
	<div class="row">
		<div class="eight columns">
			<p class="bread leftalign">
				<b>클럽 게시판</b>  
			</p>
		</div>
	</div>
</div>
	<%-- 클럽게시판: ${boardList} --%>
	<div class="container" style="display:table; width:100%;">
	 
	
 	<c:if test="${empty boardList}">
		<div style="display:table-row">클럽에 첫번째 글을 작성해보세요 </div>
		<div style="display:table-row"><input type="button" name="btnWrite" id="btnWrite" value="글쓰기"></div>
	</c:if>
	
	<c:if test="${not empty boardList}">
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">글번호</div>
	    <div class="c" style="display:table-cell">타입</div>
	    <div class="c1" style="display:table-cell">제목</div>
	    <div class="c" style="display:table-cell">작성자</div>
	    <div class="c" style="display:table-cell">작성일</div>
	    <div class="c" style="display:table-cell">댓글</div>
	  </div>
		<c:forEach var="list" items="${boardList}">
		<c:if test="${list.bIsShow=='Y'}">
		  <div style="display:table-row">
	        <div class="c" style="display:table-cell">${list.boardNo}</div>
	        <div class="c" style="display:table-cell">${list.bType}</div>
	        <div class="c1" style="display:table-cell"><a href="${path}/board/detail?cNo=${list.cNo}&num=${num}&boardNo=${list.boardNo}">${list.bTitle}</a></div>
	        <div class="c" style="display:table-cell">${list.bWriter}</div>
	        <div class="c" style="display:table-cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.bRegdate}"/></div>
	        <div class="c" style="display:table-cell">${list.commCnt}</div>
	  	  </div>
		</c:if>
		</c:forEach>
	</c:if>
	
	<c:if test="${not empty boardList}">
		<div style="display:table-row"><input type="button" name="btnWrite" id="btnWrite" value="글쓰기"></div>
		<c:if test="${boardPage.prev}">
			<span>[<a href="/board/list?cNo=${cNo}&num=${boardPage.startPageNum - 1}">이전</a>]</span>
		</c:if>
		
		<c:forEach begin="${boardPage.startPageNum}" end="${boardPage.endPageNum}" var="num">
			<span>
			
				<c:if test="${select != num}">
					<a href="/board/list?cNo=${cNo}&num=${num}">${num}</a>
				</c:if> 			
				
				<c:if test="${select == num && num < boardPage.pageNum}">
					<b>${num}</b>
				</c:if>
		 			
			</span>
		</c:forEach>
		<c:if test="${boardPage.endPageNum < boardPage.pageNum}">
	
		<c:if test="${boardPage.next}">
			<span>[<a href="/board/list?cNo=${cNo}&num=${boardPage.endPageNum + 1}">다음</a>]</span>
		</c:if>
		</c:if>
		
	</c:if>
	</div>
	
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>