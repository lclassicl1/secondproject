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
		border:1px solid;
	}
	
	#tableCenter {
		display: flex;
		justify-content: center;
		vertical-align:middle;
		margin-top:15px;
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
<main>
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
	<div class="hr">
<div class="row">
	<div class="twelve columns noleftmargin">
	     <!-- MAIN CONTENT -->
		<div class="eight columns noleftmargin" id="boardDetail">
		<div class="hr">
</div>
	<div class="tableCenter">
	<div class="dots blogdots"></div>
	<br class="clear">
	<h5 align="center">클럽 가입된 회원만 이용 가능합니다.</h5>	
	<br class="clear">
	<div class="dots blogdots"></div>
	<br class="clear">
		
	  	</div>
	   </div>
	 <div>
	</div>
  </div>
 </div>
 </div>
 </main>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>