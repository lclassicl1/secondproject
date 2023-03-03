<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<script>
$(document).ready(function(){	
		//클럽가입
		$("#btnSign").on("click",function(){
		var c=confirm("클럽에 가입하시겠습니까?");
		  if(c){
			  location.href="${path}/club/sign?categoryNo=${clubDTO.categoryNo}&cNo=${clubDTO.cNo}";
		  }else{
			 return false;		 }
	  	});		
		//클럽수정버튼 cNo
	  $("#btUpdate").on("click",function(){
			location.href="${path}/club/clubUp?categoryNo=${clubDTO.categoryNo}&cNo=${clubDTO.cNo}&cName=${clubDTO.cName}&cLoc=${clubDTO.cLoc}&cPeople=${clubDTO.cPeople}&cIntro=${clubDTO.cIntro}";
	  	});

		//탈퇴버튼
 	  $("#btnDel").on("click",function(){
		  var c=confirm("클럽을 탈퇴하시겠습니까?");
		  if(c){
			  $('#registForm').attr("action","${path}/club/clubUpDel").submit();
		  }else{
				 return false;
			 }
	  	});	 
		//클럽삭제버튼
	  $("#btnADel").on("click",function(){
		  var c=confirm("클럽을 삭제하시겠습니까?");
		  if(c){
			location.href="${path}club/clbuADel";
	  }else{
			 return false;
		 }
	  	});	
    }); 

</script>
<title>클럽 상세보기</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>
<!-- SUBHEADER
================================================== -->
<div id="subheader">
	<div class="row">
		<div class="eight columns">
			<p class="bread leftalign">
				${clubDTO.cName}  
			</p>
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
		<div class="eight columns noleftmargin">
			<h4>${clubDTO.cName} <span class="comments"><fmt:formatDate value="${clubDTO.creDate}" type="date" pattern="yyyy.MM.dd"/></span></h4>
			<div class="dots blogdots">
			</div>
			<p>
				${clubDTO.cIntro}
			</p>
			<table border="1" style="text-align:center;">
				<tr>
					<td>${category}</td>
				</tr>
				<tr>
					<td>${clubDTO.cName}</td> <!-- 클럽명 -->
					<td>${clubDTO.cLoc}</td><!-- 지역 -->
				</tr>
				<tr>
					<td>${clubDTO.masterId}</td><!-- 클럽장 -->		
					<td><fmt:formatDate value="${clubDTO.creDate}" type="date" pattern="yyyy.MM.dd"/></td><!-- 클럽개설일 -->
				</tr>
				<tr>
					<td colspan="2">${sPeople} / ${clubDTO.cPeople}(명)</td><!--가입자수/ 정원(명) -->
				</tr>
				<tr>
					<td colspan="2">${clubDTO.cIntro}</td><!-- 클럽소개글 -->
				</tr>
				<c:forEach var="board" items="${boardVO}">
				<tr>
					<td>${board.bTitle}</td><!-- 타이틀 -->
					<td>${board.bWriter}</td><!-- 작성자 -->
				</tr>
				<tr>
					<td colspan="2">${board.bContent}</td><!-- 모집내용 -->
				</tr>
				</c:forEach>
				<tr>
				<c:forEach var="sMember" items="${signMember}">
					<td colspan="2">${sMember.id}</td><br/><!-- 클럽가입자리스트 -->
				</c:forEach>
				</tr>
				<tr>
					<td colspan="2">
					<!-- 클럽장만 수정 가능 -->
					<p style="text-align:right;"><input type="button" name="btUpdate" id="btUpdate"	value="클럽수정"/></p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<!-- 가입한 사람은 가입버튼 안보이게 처리 필요 -->
						<p style="text-align:center;">
						<input type="button" name="btnSign" id="btnSign" value="클럽가입"/></p>
					</td>
					<td colspan="2">
					<!-- 클럽에 가입한 사람만 보이게 처리 필요/클럽장은 안보이게 처리 -->
						<p style="text-align:center;">
						<input type="button" name="btnDel" id="btnDel" value="클럽탈퇴"/></p>
					</td>
					<td colspan="2">
					<!-- 클럽장,관리자만 보이게 처리 필요 -->
						<p style="text-align:center;">
						<input type="button" name="btnADel" id="btnADel" value="클럽삭제"/></p>
					</td>
				</tr>
			</table>
		</div>
		<!-- SIDEBAR -->
		<div class="four columns">
			<a href="<%=request.getContextPath()%>/club/detail?categoryNo=${categoryNo}&cNo=${clubDTO.cNo}"><h6 class="sidebartitle">CLUB INTRODUCE</h6></a>
			<br class="clear"/>
			<a href="#"><h6 class="sidebartitle">CLUB BOARD</h6></a>
			<br class="clear"/>
			<a href="<%=request.getContextPath()%>/chat/room?roomNo=${clubDTO.cNo}"><h6 class="sidebartitle">CLUB CHAT</h6></a>
		</div>
	</div>
</div>
<div class="hr">
</div>


<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>