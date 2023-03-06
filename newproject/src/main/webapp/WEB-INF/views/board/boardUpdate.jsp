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
	$("#btnList").on("click",function(){
		location.href="${path}/board/list?cNo=${boardVO.cNo}&num=${num}";
	});
	

});

</script>
<title>클럽게시판 수정하기</title>
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
<form id=boardUpdate action="${path}/board/boardUpdate" method="POST">
	<div><h1>클럽게시판 수정하기</h1></div>
	<%-- 게시글정보: ${boardList} --%>
	${boardVO}
	${boardVO.cNo}
	${num}
	${boardVO.boardNo}
	${boardVO.bType}
	${boardVO.bTitle}
	${boardVO.bContent}

  <div class="container" style="display:table; width:100%;">
  <%-- <input type="hidden" name="bWriter" id="bWriter" value="${sessionScope.userId}"/> 
  --%>
  <input type="hidden" name="cNo" id="cNo" value="${boardVO.cNo}"/>
  <input type="hidden" name="boardNo" id="boardNo" value="${boardVO.boardNo}"/>
	<div class="divTableBody">
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">타입</div>
	    <div class="c1" style="display:table-cell">
	  	<select name="bType" id="bType" required="required" value="${boardVO.bType}">
		 	<option value="모집">모집</option>
			<option value="자유">자유</option>
		</select>
	  </div>
</div>
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">제목</div>
        <div class="c1" style="display:table-cell">
        <input type="text" name="bTitle" id="bTitle" value="${boardVO.bTitle}" required="required"/>
        </div>
	  </div>
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">내용</div>
        <div class="c1" style="display:table-cell; height:400px;">
        <textarea name="bContent" id="bContent" required="required">${boardVO.bContent}</textarea>
        </div>
	  </div>
	</div>
	  <div style="display:table-row">
	  	<input type="button" name="btnList" id="btnList" value="목록으로"/>
	  	<input type="submit" name="btnUpdate" id="btnUpdate" value="수정하기"/>
	  </div>	 
	  
  </div>
</form>

<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>