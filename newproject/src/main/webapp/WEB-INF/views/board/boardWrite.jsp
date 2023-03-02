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
		location.href="${path}/board/list?cNo=${cNo}&num=1";
	});
	
	//글쓰기
	$("#boardUpload").on("click",function(){
		location.href="${path}/board/list?cNo=${cNo}&num=";
	});
});

</script>
<title>클럽게시판 글쓰기</title>
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
<form action="${path}/board/boardWrited?cNo=${cNo}&num=${num}" method="post">
	<div><h1>클럽게시판 글쓰기</h1></div>
	<%-- 게시글정보: ${boardList} --%>
	${boardVO}
	${cNo}
	${num}
  <div class="container" style="display:table; width:100%;">
  <input type="hidden" name="bWriter" id="bWriter" value="${sessionScope.userId}"/>
  <input type="hidden" name="cNo" id="cNo" value="${cNo}"/>
  <input type="hidden" name="num" id="num" value="${num}"/>
	<div class="divTableBody">
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">타입</div>
	    <div class="c1" style="display:table-cell">
	    <select name="bType" id="bType" required="required">
			<option value="모집">모집</option>
			<option value="자유">자유</option>
	    </select></div>
	  </div>
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">제목</div>
        <div class="c1" style="display:table-cell">
        <input type="text" name="bTitle" id="bTitle" required="required"/>
        </div>
	  </div>
	  <div style="display:table-row">
	    <div class="c" style="display:table-cell">내용</div>
        <div class="c1" style="display:table-cell; height:400px;">
        <textarea name="bContent" id="bContent" required="required"></textarea>
        </div>
	  </div>
	</div>
	  <div style="display:table-row">
	  	<input type="button" name="btnList" id="btnList" value="목록으로"/>
	  	<input type="submit" name="boardUpload" id="boardUpload" value="작성하기"/>
	  </div>	 

	  
  </div>
</form>

<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>