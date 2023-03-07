<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/default.css">
<meta charset="UTF-8">
<script>
$(document).ready(function(){	
	//클럽가입
	$("#btnSign").on("click",function(){
	var c=confirm("클럽에 가입하시겠습니까?");
	  if(c){
		  location.href="${path}/club/sign?categoryNo=${clubDTO.categoryNo}&cNo=${clubDTO.cNo}&no=${loginUser.no}";
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
			<p>
				${clubDTO.cIntro}
			</p>
			<div id="tableCenter">
				<table border="1" style="text-align:center; display: flex; justify-content: center; width: 100%;">
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
					<td colspan="2"><u:pre value="${clubDTO.cIntro}"/></td><!-- 클럽소개글 -->
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
					<td colspan="2"><u:pre value="${board.bContent}"/></td><!-- 모집내용 -->
				</tr>
				</c:forEach>
				</c:if>
				<%--관리자모드 --%>
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
		 		<!-- 클럽에 가입하지않은 회원 -->
				<c:if test="${gMember && (currentMember.signIn != 'Y') || exist==false}">
				<tr>
					<td colspan="2">			
						<p style="text-align:center;">
							<input type="button" name="btnSign" id="btnSign" value="클럽가입"/>
						</p>
					</td>
				</tr>
				</c:if>
				<%-- 클럽에 가입한 일반회원만 보이게 처리 필요 --%>
				<c:if test="${gMember && (currentMember.signIn == 'Y') && (loginUser.no == currentMember.no)}">
				<tr>
					<td colspan="2">
						<p style="text-align:center;">
							<input type="button" name="btnDelMember" id="btnDelMember" value="클럽탈퇴(회원)"/>
						</p>
					</td>
				</tr>
				</c:if>
				</table>
			</div>
		</div>
		<!-- SIDEBAR -->
		<div class="four columns" style="margin-top: 15px;">
			<a href="<%=request.getContextPath()%>/club/detail?categoryNo=${categoryNo}&cNo=${clubDTO.cNo}"><h6 class="sidebartitle">CLUB INTRODUCE</h6></a>
			<br class="clear"/>
			<a href="<%=request.getContextPath() %>/board/list?cNo=${clubDTO.cNo}&num=1"><h6 class="sidebartitle">CLUB BOARD</h6></a>
			<br class="clear"/>
			<a href="#" target="_blank" onclick="openPop()"><h6 class="sidebartitle">CLUB CHAT</h6></a>
		</div>
	</div>
</div>
<div class="hr">
</div>

</main>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>