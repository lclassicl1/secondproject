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


});

</script>
<title>클럽게시판 댓글수정</title>
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
	${boardNo}
	${comm}<br/>
	 <!-- 댓글작성 -->
	<form action="${path}/comm/updateComm" method="POST">
	<input type="hidden" name="boardNo" id="boardNo" value="${boardNo}"/>
	<input type="hidden" name="commNo" id="commNo" value="${comm.commNo}"/>
	<div class="divTableBody">
	  <div style="display:table-row">
		<div class="c" style="display:table-cell">댓글</div>
		<div class="c1" style="display:table-cell">
		<textarea name="comment" id="comment" required="required">${comm.comment}</textarea></div>
	  </div>
	  		<input type="submit" value="등록"/>
	  </div>
	</form>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>