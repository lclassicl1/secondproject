<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/> 
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
			location.href="${cPath}/club/sign?cNo=${clubDTO.cNo}";
		  }else{
			 return false;
		 }
	  	});		
		//수정버튼 cNo
	  $("#btUpdate").on("click",function(){
			location.href="${cPath}/club/clubUp?categoryNo=${categoryNo}&cNo=${clubDTO.cNo}&cName=${clubDTO.cName}&cLoc=${clubDTO.cLoc}&cPeople=${clubDTO.cPeople}&cIntro=${clubDTO.cIntro}";
	  	});

		//탈퇴버튼
	  $("#btnDel").on("click",function(){
			location.href="${cPath}/club/clubList?cNo=${clubDTO.cNo}";
	  	});	
    }); 

</script>
<title>클럽 상세보기</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>	
<span><a href="${cPath}/club/detail?cNo=${clubDTO.cNo}&categoryNo=${clubDTO.categoryNo}">클럽정보</a></span><span><a href="#">게시판</a></span><span><a href="#">채팅</a></span>
상세보기:${clubDTO}<br/>
게시판:${boardVO}<br/>
<input type="hidden" value="${clubDTO.cNo}"/><br/>
<input type="hidden" value="boardNo"/><br/>
<table border="1" style="text-align:center;">
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
	<tr>
		<td>${boardVO.bTitle}</td><!-- 타이틀 -->
		<td>${boardVO.bWriter}</td><!-- 작성자 -->
	</tr>
	<tr>
		<td colspan="2">${boardVO.bContent}</td><!-- 모집내용 -->
	</tr>
	<tr>
	<c:forEach var="sMember" items="${signMember}">
		<td colspan="2">${sMember.memberId}</td><br/><!-- 클럽가입자리스트 -->
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
		<!-- 클럽에 가입한 사람만 보이게 처리 필요 -->
			<p style="text-align:center;">
			<input type="button" name="btnDel" id="btnDel" value="클럽탈퇴"/></p>
		</td>
	</tr>
</table>

<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>