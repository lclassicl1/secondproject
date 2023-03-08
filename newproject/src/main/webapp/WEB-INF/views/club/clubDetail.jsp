<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<c:set var="gMember" value="${!empty loginUser && loginUser.grade==1 && (loginUser.id != clubDTO.masterId)}"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/default.css" type="text/css">
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){	
	
	//클럽가입
	$("#btnSign").on("click",function(){
		var c=confirm("클럽에 가입하시겠습니까?");
		  if(c){
				location.href="${path}/club/sign?categoryNo=${clubDTO.categoryNo}&cNo=${clubDTO.cNo}&no=${loginUser.no}";
				}else{
				return false;		 
			}
  	});		 
	//클럽수정버튼 cNo
	$("#btnUpdate").on("click",function(){
		var c=confirm("클럽을 수정하시겠습니까?");
		  if(c){
				location.href="${path}/club/clubUp?categoryNo=${clubDTO.categoryNo}&cNo=${clubDTO.cNo}&cName=${clubDTO.cName}&cLoc=${clubDTO.cLoc}&cPeople=${clubDTO.cPeople}&cIntro=${clubDTO.cIntro}";
				}else{
		 		return false;		 
		 	}
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
	function openPop(){
		window.open('${path}/chat/room?roomNo=${clubDTO.cNo}', 'clubChat', 'width=700px,height=800px,scrollbars=yes');
	};
</script>
<title>클럽 상세보기</title>
<style>
	#clubMain{
		width: 66.6666%;
	}
	#tableCenter{
		display: flex;
	    justify-content: center;		
	}
	.a{
	text-align:center;
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
				<b>${clubDTO.cName}</b>  
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
		<div class="eight columns noleftmargin" id="clubMain">
			<h4>${clubDTO.cName} <span class="comments"><fmt:formatDate value="${clubDTO.creDate}" type="date" pattern="yyyy.MM.dd"/></span></h4>
			<div class="dots blogdots">
			</div>
			<div id="tableCenter">
				<table style="text-align:center; display: flex; justify-content: center; width: 500px;">
				<tr>
					<th colspan="2">클럽명</th>
					<td colspan="3" class="a">${clubDTO.cName}</td> <!-- 클럽명 -->
					<th colspan="2">가입인원</th>
					<td colspan="3" class="a">${sPeople}/${clubDTO.cPeople}(명)</td><!--가입자수/ 정원(명) -->
				</tr>
				<tr>
					<th colspan="2">클럽장</th>
					<td colspan="3" class="a">${clubDTO.masterId}</td><!-- 클럽장 -->		
					<th colspan="2">개설일</th>
					<td colspan="3" class="a"><fmt:formatDate value="${clubDTO.creDate}" type="date" pattern="yyyy.MM.dd"/></td><!-- 클럽개설일 -->
				</tr>
				<tr>
					<th colspan="4">활동지역</th>
					<td colspan="6" class="a">${clubDTO.cLoc}</td><!-- 지역 -->
				</tr>
				<tr>
					<th colspan="10"> <클럽소개글> </th>
				</tr>
				<tr>
					<td colspan="10" class="a"><u:pre value="${clubDTO.cIntro}"/></td><!-- 클럽소개글 -->
				</tr>
				<tr>
					<th colspan="10"> <모임활동(모집)> </th>
				</tr>
				<c:if test="${empty boardVO}">
				<tr>
					<td colspan="10" class="a">개설된 모임활동이 없습니다</td>
				</tr>	
				</c:if>
				<c:if test="${!empty boardVO}">	
				<c:forEach var="board" items="${boardVO}">
				<tr>
					<th colspan="2">제목</th>
					<th colspan="2">작성자</th>
					<td colspan="4" class="a">${board.bTitle}</td><!-- 타이틀 -->
					<td colspan="2" class="a">${board.bWriter}</td><!-- 작성자 -->
				</tr>
				<tr>
					<th colspan="10">모집내용</th>
				</tr>
				<tr>
					<td colspan="10" class="a"><u:pre value="${board.bContent}"/></td><!-- 모집내용 -->
				</tr>
				</c:forEach>
				</c:if>
				<%--관리자모드 --%>
				<c:if test="${(!empty loginUser) && (loginUser.grade == 999)}"> 
				<tr>
					<th colspan="10"> <가입자 리스트> </th>
				</tr>
				<tr>
					<th colspan="3">회원번호</th>
					<th colspan="4">회원아이디</th>
					<th colspan="4">클럽가입한날짜</th>
				</tr>
				<c:forEach var="sMember" items="${signMemberList}">
				<tr>
					<td colspan="3" class="a">${sMember.no}</td><%-- 회원번호 --%>
					<td colspan="4" class="a">${sMember.id}</td><%-- 회원아이디 --%>
					<td colspan="3" class="a"><fmt:formatDate value="${sMember.joinDate}" type="date" pattern="yyyy.MM.dd"/></td><%-- 클럽가입자날짜 --%>
				</tr>
				</c:forEach>
				</c:if>
				</table>
			</div>
					<%-- 클럽장,관리자만 수정 가능 --%>
				<c:if test="${(!empty loginUser) && (loginUser.grade == 999) || (loginUser.id == clubDTO.masterId)}">
		
						<div style="text-align:right;">
							<input type="button" name="btnUpdate" id="btnUpdate" class="readmore" value="클럽수정"/>
						</div><br/>
		
						<div style="text-align:right;">
							<input type="button" name="btnADel" id="btnADel" class="readmore" value="클럽삭제"/>
						</div>
			
		 		</c:if>
		 				 		<!-- 클럽에 가입하지않은 회원 -->
				<c:if test="${gMember && (currentMember.signIn != 'Y') || exist==false}">
				
						<div style="text-align:right;">
							<input type="button" name="btnSign" id="btnSign" class="readmore" value="클럽가입"/>
						</div>
				
				</c:if>
				<%-- 클럽에 가입한 일반회원만 보이게 처리 필요 --%>
				<c:if test="${gMember && (currentMember.signIn == 'Y') && (loginUser.no == currentMember.no)}">
		
						<div style="text-align:right;">
							<input type="button" name="btnDelMember" id="btnDelMember" class="readmore" value="클럽탈퇴(회원)"/>
						</div>
			
				</c:if>
		</div>
		<!-- SIDEBAR -->
		<div class="four columns" style="margin-top: 15px;">
			<a href="${path}/club/detail?categoryNo=${categoryNo}&cNo=${clubDTO.cNo}"><h6 class="sidebartitle">CLUB INTRODUCE</h6></a>
			<br class="clear"/>
			<a href="${path}/board/list?cNo=${clubDTO.cNo}&num=1"><h6 class="sidebartitle">CLUB BOARD</h6></a>
			<br class="clear"/>
			<a href="#" target="_blank" onclick="openPop()"><h6 class="sidebartitle">CLUB CHAT</h6></a>

		</div>

	</div>

</div>
</div>
<div class="hr">

</main>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>