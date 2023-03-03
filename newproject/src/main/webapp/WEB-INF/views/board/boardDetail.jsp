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
$(document).ready(function(){
	//목록으로
	$("#boardList").on("click",function(){
		location.href="${path}/board/list?cNo=${boardVO.cNo}&num=1";
	});

	//글 등록
	
	//글 수정
	$("#updateBoard").on("click",function(){
		location.href="${path}/board/boardUpdate?cNo=${cNo}&boardNo=${boardVO.boardNo}&num=${num}";
	});
	//글 삭제
	$("#deleteBoard").on("click",function(){
		location.href="${path}/board/list?cNo=${boardVO.cNo}&num=1";
	});
	//댓글 등록
	
	//댓글 수정
	
	//댓글 삭제
	
});

</script>
<title>클럽게시판 글읽기</title>
<style>
body {
 background-color: transparent !important;
}
  .container{
 	display: grid;
  	border: 1px solid;
  	text-align: center;
  	margin:0 auto;
  	min-width:100px;
  }
    .divTableBody, .c{
 	display: inline-block;
  	border: 1px solid;
  	text-align: center;
  	margin:0 auto;
  	min-width:100px;
  }
  .c1{
  	display: inline-block;
  	border: 1px solid;
  	table-layout: fixed;
  	text-align: left;
  	min-width:500px;
  }


</style>
</head>
<body>

<header><jsp:include page="/resources/module/header.jsp"/></header>
	<div><h1>클럽게시판 글읽기</h1></div>
	<%-- 현재 세션 아이디:${sessionId} --%>
	<%-- 게시글정보: ${boardList} --%>
	${boardVO}
	${commList}
  <div class="container" style="display:table; width:100%;">
	<div class="divTableBody">
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">글번호</div>
	    <div class="c1" style="display:table-cell">${boardVO.boardNo}</div>
	  </div>
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">타입</div>
	    <div class="c1" style="display:table-cell">${boardVO.bType}</div>
	  </div>
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">작성자</div>
	    <div class="c1" style="display:table-cell">${boardVO.bWriter}</div>
	  </div>
	  <div style="display:table-row">
	   <c:if test="${boardVO.bRegdate == boardVO.bModdate}">
	    <div class="c" style="display:table-cell">작성일</div>
        <div class="c1" style="display:table-cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.bRegdate}"/></div>
	 </c:if>
	 <c:if test="${boardVO.bRegdate != boardVO.bModdate}">
	    <div class="c" style="display:table-cell">작성일(수정일)</div>
        <div class="c1" style="display:table-cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.bRegdate}"/>
        (<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.bModdate}"/>)</div>
	 </c:if>
      </div>
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">제목</div>
        <div class="c1" style="display:table-cell">${boardVO.bTitle}</div>
	  </div>
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">내용</div>
        <div class="c1" style="display:table-cell; height:400px;">${boardVO.bContent}</div>
	  </div>
	</div>
	  <div style="display:table-row">
	  	<input type="button" name="boardList" id="boardList" value="목록으로"/>
		<!-- <button type="button" onclick="location.href='${path}/board/?cNo=${boardVO.cNo}'">목록으로</button> -->
		<!-- 본인글이면 수정 또는 삭제가능 -->
			<c:if test="${sessionScope.userId == boardVO.bWriter}">
	  		  <input type="button" name="updateBoard" id="updateBoard" value="수정">
			  <input type="button" name="deleteBoard" id="deleteBoard" value="삭제">
			</c:if>
	  </div>
	  
	  <!-- 댓글작성 -->
	<div class="divTableBody">
	  <div style="display:table-row">
		<div class="c" style="display:table-cell">댓글</div>
		<div class="c1" style="display:table-cell"></div>
	  </div>
	  </div>
	  	<div style="display:table-row">
	  		<input type="button" name="" id="" value="등록">
	    </div>
	  
	  
	  <!-- 댓글목록 -->
	  <c:forEach var="comm" items="${commList}">
	  <c:if test="${comm.commIsShow=='Y'}">
	  <div class="divTableBody">
	  <div style="display:table-row">
		<div class="c" style="display:table-cell">댓글번호</div>
		<div class="c1" style="display:table-cell">${comm.commNo}</div>
	  </div>
	  <div style="display:table-row">
		<div class="c" style="display:table-cell">작성자</div>
		<div class="c1" style="display:table-cell">${comm.commId}</div>
	  </div>
	  <div style="display:table-row">
		<div class="c" style="display:table-cell">댓글</div>
		<div class="c1" style="display:table-cell">${comm.comment}</div>
	  </div>
	 <div style="display:table-row">
	 <c:if test="${comm.commRegdate == comm.commModdate}">
	    <div class="c" style="display:table-cell">작성일</div>
        <div class="c1" style="display:table-cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${comm.commRegdate}"/></div>
	 </c:if>
	 <c:if test="${comm.commRegdate != comm.commModdate}">
	    <div class="c" style="display:table-cell">수정일</div>
        <div class="c1" style="display:table-cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${comm.commModdate}"/></div>
	 </c:if>
	  </div>
	  </div>
	  	<div style="display:table-row">
		<!-- 본인글이면 수정 또는 삭제가능 -->
			<c:if test="${sessionScope.userId == boardVO.bWriter}">
	  		  <input type="submit" name="updateBoard" id="updateBoard" value="수정">
			  <input type="submit" name="deleteBoard" id="deleteBoard" value="삭제">
			</c:if>
	    </div>
	  </c:if>
	  </c:forEach>
	  
  </div>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>