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
			  $('#registForm').attr("action","${path}/club/sign").submit();
		  }else{
			 return false;		 }
	  	});		
		//클럽수정버튼 cNo
	  $("#btUpdate").on("click",function(){
			location.href="${path}/club/clubUp?categoryNo=${clubDTO.categoryNo}&cNo=${clubDTO.cNo}&cName=${clubDTO.cName}&cLoc=${clubDTO.cLoc}&cPeople=${clubDTO.cPeople}&cIntro=${clubDTO.cIntro}";
	  	});

		//탈퇴버튼
 	  $("#btnUpDel").on("click",function(){
		  var c=confirm("클럽을 탈퇴하시겠습니까?");
		  if(c){
			  $('#upDelForm').attr("action","${path}/club/clubUpDel").submit();
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
session:${loginUser}<br/>
상세보기:${clubDTO}<br/>
클럽멤버:${signMember}<br/>
게시판:${boardVO}<br/>
<span><a href="${path}/club/detail?cNo=${clubDTO.cNo}&categoryNo=${clubDTO.categoryNo}">클럽정보</a></span><span><a href="#">게시판</a></span><span><a href="#">채팅</a></span>
<form id="registForm" method="post" action="">
<input type="hidden" name="no" value="${loginUser.no}"/><br/>
<input type="hidden" name="cNo" value="${clubDTO.categoryNo}"/><br/>
<input type="hidden" name="cNo" value="${clubDTO.cNo}"/><br/>
</form>

<form id="btnUpDel" method="post" action="">
<input type="hidden" name="cMemberNo" value="${signMember.cMemberNo}"/><br/>
<input type="hidden" name="signIn" value="${signMember.signIn}"/><br/>
</form>

<input type="hidden" name="boardNo" value="boardNo"/><br/>
카테고리:${category}<br/>
<table border="1" style="text-align:center;">
		<div>${category}<div>
		<tr>
			<th>클럽명</th>
			<th>활동지역</th>
		</tr>
		<tr>
			<td>${clubDTO.cName}</td> <!-- 클럽명 -->
			<td>${clubDTO.cLoc}</td><!-- 지역 -->
		</tr>
		<tr>
			<th>클럽장</th>
			<th>개설일</th>
		</tr>
		<tr>
			<td>${clubDTO.masterId}</td><!-- 클럽장 -->		
			<td><fmt:formatDate value="${clubDTO.creDate}" type="date" pattern="yyyy.MM.dd"/></td><!-- 클럽개설일 -->
		</tr>
		<tr>
			<th colspan="2">가입인원 / 정원</th>
		</tr>
		<tr>
			<td colspan="2">${sPeople} / ${clubDTO.cPeople}(명)</td><!--가입자수/ 정원(명) -->
		</tr>
		<tr>
			<th colspan="2">클럽소개글</th>
		</tr>
		<tr>
			<td colspan="2">${clubDTO.cIntro}</td><!-- 클럽소개글 -->
		</tr>
	<c:if test="${empty boardVO}">
		<tr>
				<td colspan="5">개설된 클럽이 없습니다</td>
		</tr>	
	</c:if>
	<c:if test="${!empty boardVO}">	
	<c:forEach var="board" items="${boardVO}">
		<tr>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<tr>
			<td>${board.bTitle}</td><!-- 타이틀 -->
			<td>${board.bWriter}</td><!-- 작성자 -->
		</tr>
		<tr>
			<th colspan="2">모집내용</th>
		</tr>
		<tr>
			<td colspan="2">${board.bContent}</td><!-- 모집내용 -->
		</tr>
	</c:forEach>
	</c:if>
		<tr>
			<th colspan="2"> 가입자 리스트</th>
		</tr>
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
				<input type="button" name="btnUpDel" id="btnUpDel" value="클럽탈퇴"/></p>
			</td>
			<td colspan="2">
			<!-- 클럽장,관리자만 보이게 처리 필요 -->
				<p style="text-align:center;">
				<input type="button" name="btnADel" id="btnADel" value="클럽삭제"/></p>
			</td>
		</tr>
</table>

<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>