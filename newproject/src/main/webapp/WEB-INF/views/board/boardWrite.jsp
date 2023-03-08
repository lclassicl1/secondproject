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
		location.href="${path}/board/list?cNo=${cNo}&num=1";
	});
	
});

</script>
<title>클럽게시판 글쓰기</title>
<style>
	#boardWrite {
		width:66.6666%
	}
	
	#select {
		width:100px;
	}
	

</style>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>
<main>
<!-- SUBHEADER
================================================== -->
<div id="subheader">
	<div class="row">
		<div class="eight columns">
			<p class="bread leftalign">
				<b>클럽게시판</b>
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
	     <form action="${path}/board/boardWrited?cNo=${cNo}&num=${num}" method="post">
	<input type="hidden" name="bWriter" id="bWriter" value="${loginUser.id}"/>
	<input type="hidden" name="cNo" id="cNo" value="${cNo}"/>
	<input type="hidden" name="num" id="num" value="${num}"/>
		<div class="eight columns noleftmargin" id="boardWrite">
		<h5>TITLE</h5>
		<div class="panel">
	    	 <span class="comments">글 타입을 선택하세요</span>
			<div class="select" id="select">
			<select name="bType" id="bType" required="required">
			<option value="모집">모집</option>
			<option value="자유" selected>자유</option>
	    	</select>
			</div>
	    	<input type="text" name="bTitle" id="bTitle" required="required" placeholder="제목을 입력하세요"/>
		</div>
		<h5>CONTENTS</h5>
		<div class="panel">
			
			<pre><textarea rows="30" cols="50" name="bContent" id="bContent" required="required" placeholder="내용을 입력하세요"></textarea></pre>
		
		<p class="clear authortext">
		<br class="clear">
		<!-- 본인글이면 수정 또는 삭제가능 -->
		<!-- <button type="button" onclick="location.href='${path}/board/?cNo=${boardVO.cNo}'">목록으로</button> -->
		</div>
	  <span class="comments">
		<input type="button" name="btnList" id="btnList" value="목록으로"/>
	  	<input type="submit" name="boardUpload" id="boardUpload" value="작성하기"/>
	  </span>
		<br class="clear">
	     </form>
	</div>
		
	
		<!-- SIDEBAR -->
		<div class="four columns" style="margin-top: 15px;">
			<a href="<%=request.getContextPath()%>/club/detail?categoryNo=${categoryNo}&cNo=${cNo}"><h6 class="sidebartitle">CLUB INTRODUCE</h6></a>
			<br class="clear"/>
			<a href="<%=request.getContextPath() %>/board/list?cNo=${cNo}&num=1"><h6 class="sidebartitle">CLUB BOARD</h6></a>
			<br class="clear"/>
			<a href="#" target="_blank" onclick="openPop()"><h6 class="sidebartitle">CLUB CHAT</h6></a>
		</div>
		
		
		 <!-- SIDEBAR -->
		<div class="four columns">
			<h6 class="sidebartitle">RECENT COMMENTS</h6>
			<div class="avatar">
				<img src="http://www.wowthemes.net/demo/studiofrancesca/images/temp/author1.png" alt="">
			</div>
			<p>
				 Many pieces were proposed, but none seemed suitable, because each one wished to play a good ...
			</p>
			<div class="avatar">
				<img src="http://www.wowthemes.net/demo/studiofrancesca/images/temp/author2.png" alt="">
			</div>
			<p>
				 Many pieces were proposed, but none seemed suitable, because each one wished to play a good ...
			</p>
			<div class="avatar">
				<img src="http://www.wowthemes.net/demo/studiofrancesca/images/temp/author3.png" alt="">
			</div>
			<p>
				 Many pieces were proposed, but none seemed suitable, because each one wished to play a good ...
			</p>
			<br class="clear"/>
			<h6 class="sidebartitle">POPULAR TAGS</h6>
			<a href="#" class="tags">Photography</a>
			<a href="#" class="tags">Vintage</a>
			<a href="#" class="tags">Nature</a>
			<a href="#" class="tags">Design</a>
			<a href="#" class="tags">Printing</a>
			<a href="#" class="tags">Contemporary</a>
			<a href="#" class="tags">Classic</a>
			<a href="#" class="tags">Elegant</a>
			<a href="#" class="tags">Graphics</a>
			<br class="clear"/>
			<br/><br/>
			<h6 class="sidebartitle">RELATED POSTS</h6>
			<p>
				7 Oct 2013
			</p>
			<p>
				Many pieces were proposed, but none seemed suitable, because each one wished to play a good and suitable part ...
			</p>
			<p>
				6 Sept 2013
			</p>
			<p>
				It was ready for production, when through accident we were disappointed about securing the private theatre on ...
			</p>
			<p>
				4 Aug 2013
			</p>
			<p>
				The over-kind praise which it won encouraged me to have the play printed. I decided, as I could see no other prospects...
			</p>
		</div>
</div>
<div class="hr">
</div>
</div>
 
 
</main>








<form action="${path}/board/boardWrited?cNo=${cNo}&num=${num}" method="post">
	<div><h1>클럽게시판 글쓰기</h1></div>
	<%-- 게시글정보: ${boardList} --%>
	${boardVO}
	${cNo}
	${num}
  <div class="container" style="display:table; width:100%;">
 
  <input type="hidden" name="bWriter" id="bWriter" value="${loginUser.id}"/>
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
        <div class="c1" style="display:table-cell; height:400px">
        <pre><textarea rows="30" cols="50" name="bContent" id="bContent" required="required"></textarea></pre>
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