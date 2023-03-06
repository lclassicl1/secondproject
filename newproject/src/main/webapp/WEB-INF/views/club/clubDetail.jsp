<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<c:set var="gMember" value="${!empty loginUser && loginUser.grade==1 && (loginUser.id != clubDTO.masterId) && (loginUser.no == currentMember.no)}"/>
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

		//클럽회원탈퇴
 	  $("#btnDelMember").on("click",function(){   
		  var c=confirm("클럽을 탈퇴하시겠습니까?");
		  if(c){
			  location.href="${path}/club/clubMemberDel?cMemberNo=${currentMember.cMemberNo}";
		  }else{
				 return false;
			 }
	  	});			

		//클럽삭제버튼
	  $("#btnADel").on("click",function(){
		  var c=confirm("클럽을 삭제하시겠습니까?");
		  if(c){
			location.href="${path}/club/clubADel?cNo=${clubDTO.cNo}";
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
게시판:${boardVO}<br/>
가입한 회원정보:${signMemberList}<br/>
가입한 회원상세정보:${currentMember}<br/>
<form id="registForm" method="post" action="">
<input type="hidden" name="no" value="${loginUser.no}"/><br/>
<input type="hidden" name="categoryNo" value="${clubDTO.categoryNo}"/><br/>
<input type="hidden" name="cNo" value="${clubDTO.cNo}"/><br/>
</form>
<span>클럽정보</span>
<c:if test="${!empty loginUser && (currentMember.signIn eq 'Y')}">
<span><a href="#">게시판</a></span>
<span><a href="#">채팅</a></span>
</c:if>
회원번호
<input type="hidden" name="cMemberNo" id="cMemberNo" value="${currentMember.cMemberNo}"/><br/>
		<div> ${category} </div>
<table border="1" style="text-align:center;">
		<tr>
			<th>클럽명</th>
			<td>${clubDTO.cName}</td> <!-- 클럽명 -->
		</tr>
		<tr>
			<th>활동지역</th>
			<td>${clubDTO.cLoc}</td><!-- 지역 -->
		</tr>
		<tr>
			<th>클럽장</th>
			<td>${clubDTO.masterId}</td><!-- 클럽장 -->		
		</tr>
		<tr>
			<th>개설일</th>
			<td><fmt:formatDate value="${clubDTO.creDate}" type="date" pattern="yyyy.MM.dd"/></td><!-- 클럽개설일 -->
		</tr>
		<tr>
			<th>가입인원</th>
			<td>${sPeople}/${clubDTO.cPeople}(명)</td><!--가입자수/ 정원(명) -->
		</tr>
		<tr>
		</tr>
		<tr>
			<th colspan="2">클럽소개글</th>
		</tr>
		<tr>
			<td colspan="2">${clubDTO.cIntro}</td><!-- 클럽소개글 -->
		</tr>
		<tr>
			<th colspan="2">모임활동(모집)</th>
		</tr>
	<c:if test="${empty boardVO}">
		<tr>
			<td colspan="2">개설된 모임활동이 없습니다</td>
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
	
	
	<%--관리자모드 --%>
	<%-- <c:if test="${(!empty loginUser) && (loginUser.grade == 999)}"> --%>
	<c:if test="${(!empty loginUser) && (loginUser.grade == 999)}"> 
		<tr>
			<th colspan="3">가입자 리스트</th>
		</tr>
		<tr>
			<th>회원번호</th>
			<th>회원아이디</th>
			<th>클럽가입한날짜</th>
		</tr>
	<c:forEach var="sMember" items="${signMemberList}">
		<tr>
			<td>${sMember.no}</td><%-- 회원번호 --%>
			<td>${sMember.id}</td><%-- 회원아이디 --%>
			<td><fmt:formatDate value="${sMember.joinDate}" type="date" pattern="yyyy.MM.dd"/></td><%-- 클럽가입자날짜 --%>
		</tr>
	</c:forEach>
	</c:if>
	
	
	<%-- 클럽장,관리자만 수정 가능 --%>
	<%-- <c:if test="${(!empty loginUser) && (loginUser.grade == 999) || (loginUser.id == clubDTO.masterId)}"> --%>
	<c:if test="${(!empty loginUser) && (loginUser.grade == 999) || (loginUser.id == clubDTO.masterId)}">
		<tr>
			<td colspan="2">
				<p style="text-align:right;">
					<input type="button" name="btUpdate" id="btUpdate"	value="클럽수정"/>
				</p>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p style="text-align:center;">
				<input type="button" name="btnADel" id="btnADel" value="클럽삭제"/>
				</p>
			</td>
		</tr>
 	</c:if>
 	
	<%-- 가입하지 않은 사람만 보이게 처리 필요 등급처리--%>
	<c:if test="${gMember && exist == false}">
		<tr>
			<td colspan="2">			
				<p style="text-align:center;">
					<input type="button" name="btnSign" id="btnSign" value="클럽가입"/>
				</p>
			</td>
		</tr>
	</c:if>
	<%-- 클럽에 가입한 사람만 보이게 처리 필요/클럽장은 안보이게 처리 --%>
	<c:if test="${gMember && (currentMember.signIn == 'Y')}">
		<tr>
			<td colspan="2">
				<p style="text-align:center;">
					<input type="button" name="btnDelMember" id="btnDelMember" value="클럽탈퇴(회원)"/>
				</p>
			</td>
		</tr>
	</c:if>
</table>

<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>