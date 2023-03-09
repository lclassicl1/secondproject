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
	function openPop(){
		window.open('${path}/chat/room?roomNo=${clubDTO.cNo}', 'clubChat', 'width=700px,height=800px,scrollbars=yes');
	};
</script>
<title>클럽게시판</title>
<style>
	#boardDetail {
		border:1px;
		width:66.6666%;
	}
	
	#tableCenter {
		display: flex;
		justify-content: center;
		vertical-align:middle;
		border : 1px solid;
		margin-bottom: 20px;
		margin-right: 10px;
	}
	
	.c1 {
		width:500px;
		vertical-align:middle;
		height:30px;
		
		
	}
	.c {
		width:100px;
		vertical-align:middle;
		text-align: center;
	}
	
	
	#textarea {
		resize:none;
		width:598.46px;
		height:100px;
	}
	
	#btnComm {
		text-align:center;
	}


</style>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>
	<%-- ${boardList} 	${cNo} 	${num} ${boardPage} ${categoryNo} ${loginUser.id} --%>
 <!-- SUBHEADER
================================================== -->
<div id="subheader">
	<div class="row">
		<div class="eight columns">
			<p class="bread leftalign">
				<b>${clubDTO.cName} 게시판</b>  
			</p>
		</div>
		<div class="four columns">
			<div class="row collapse">
				<div class="ten mobile-three columns">
					<!-- <input type="text" class="nomargin" placeholder="Search..."> -->
				</div>
				<div class="two mobile-one columns">
					<!-- <a href="#" class="postfix button expand">Go</a> -->
				</div>
			</div>
		</div>
	</div>
</div>
<div class="hr">
</div>
<!-- CONTENT 
================================================== -->

<div class="row">
	<div class="twelve columns noleftmargin">
	     <!-- MAIN CONTENT -->
		<div class="eight columns noleftmargin" id="boardDetail">
	<div class="hr">
</div>
	<!-- 작성글이 없는 경우 -->
	<div class="tableCenter">
 	<c:if test="${empty boardList}">
	<p>
	<div class="dots blogdots"></div>
	<h5>클럽에 첫번째 글을 작성해보세요</h5>	<button type="submit" class="readmore" name="btnWrite" id="btnWrite">글쓰기</button>
	<p>
	<div class="dots blogdots"></div>
		<div style="display:table-row"><input type="button" name="btnWrite" id="btnWrite" value="글쓰기"></div>
	</c:if>
		
	<!-- 작성글이 있는 경우 -->
	<c:if test="${not empty boardList}">
	<div class="tableCenter" style="display:table-row">
	</div>

	    <div class="c" style="display:table-cell"></div>
	    <div class="c1" style="display:table-cell">제목</div>
	    <div class="c" style="display:table-cell">작성자</div>
	    <div class="c" style="display:table-cell">작성일</div>
	    <div class="c" style="display:table-cell">댓글</div>
		<c:forEach var="list" items="${boardList}">
		<c:if test="${list.bIsShow=='Y'}">
		  <div class="table" style="display:table-row">
		  <input type="hidden" value="${list.boardNo}">
	        
	        <div class="c" style="display:table-cell">${list.bType}</div>
	        <div class="c1" style="display:table-cell"> <a href="${path}/board/detail?cNo=${list.cNo}&num=${num}&boardNo=${list.boardNo}">${list.bTitle}</a></div>
	        <div class="c" style="display:table-cell">${list.bWriter}</div>
	        <div class="c" style="display:table-cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.bRegdate}"/></div>
	        <div class="c" style="display:table-cell">${list.commCnt}</div>
	  	  </div>
		</c:if>
		</c:forEach>
	</c:if>
	
		 <span class="comments"><button type="submit" class="readmore" name="btnWrite" id="btnWrite">글쓰기</button>
		 </span>
	<c:if test="${not empty boardList}">
		<ul class="pagination">
		
		<c:if test="${boardPage.prev}">
			<li class="arrow unavailable"><a href="/board/list?cNo=${cNo}&num=${boardPage.startPageNum - 1}">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${boardPage.startPageNum}" end="${boardPage.endPageNum}" var="num">
			
				<c:if test="${select != num}">
					<li class="current"><a href="/board/list?cNo=${cNo}&num=${num}">${num}</a></li>
				</c:if> 			
				
				<c:if test="${select == num && num < boardPage.pageNum}">
					<li class="current"><b>${num}</b></li>
				</c:if>
		 			
		</c:forEach>
		<c:if test="${boardPage.endPageNum < boardPage.pageNum}">
	
		<c:if test="${boardPage.next}">
			<li class="arrow"><a href="/board/list?cNo=${cNo}&num=${boardPage.endPageNum + 1}">&raquo;</a></li>
		</c:if>
		</c:if>
		
		</c:if>
	  </div>
	</div>
	<div>
	</div>
				<!-- SIDEBAR -->
		<div class="four columns" id=float style="margin-top: 15px;">
			<a href="<%=request.getContextPath()%>/club/detail?categoryNo=${clubDTO.categoryNo}&cNo=${cNo}"><h6 class="sidebartitle">CLUB INTRODUCE</h6></a>
			<br class="clear"/>
			<a href="<%=request.getContextPath() %>/board/list?cNo=${cNo}&num=1"><h6 class="sidebartitle">CLUB BOARD</h6></a>
			<br class="clear"/>
			<a href="#" target="_blank" onclick="openPop()"><h6 class="sidebartitle">CLUB CHAT</h6></a>
		</div>
	  </div>
	 </div>
</div>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>