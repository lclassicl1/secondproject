<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script>

</script>
<title>클럽 리스트</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>	
클럽리스트:${clubList}
		<p>카테고리명:${category}</p>
		<!-- 검색 -->
		<!--
		<form method="get" action="${cPath}/club/clist" id="frm">
			<input type="hidden" name="pageNum" value="1" id="pageNum">
			<select name="kind" id="kind" style="height:25px;width:110px;font-size:14px; text-align:center;">
				<option class="s" value="클럽명">클럽명</option>
				<option class="s" value="클럽장">클럽장</option>
				<option class="s" value="활동지역">활동지역</option>
			</select>
			<input type="text" name="search" id="search" value="${pageClub.search}">
			<button type="submit" id="btn">검색</button>
		</form>
		-->
	<!-- 클럽리스트 -->
	<table border="1">
		<tr>
			<th>클럽명</th>
			<th>클럽장</th>
			<th>활동지역</th>
			<th>클럽개설일</th>
			<th>정원</th>
		</tr>
		<c:if test="${empty clubList}">
		<tr>
			<td colspan="5">개설된 클럽이 없습니다</td>
		</tr>	
		</c:if>
		<c:if test="${!empty clubList}">
			<c:forEach var="clist" items="${clubList}">
			<tr> 
				<td><a href="${cPath}/club/detail?&categoryNo=${clist.categoryNo}&cNo=${clist.cNo}">${clist.cName}</a></td>
				<td>${clist.masterId}</td>
				<td>${clist.cLoc}</td>
				<td><fmt:formatDate value="${clist.creDate}" type="date" pattern="yyyy.MM.dd"/></td>
		  		<td>
					<c:choose>
						<c:when test="${clist.cPeople==10}">
							10
						</c:when> 
						<c:when test="${item.hdcheck==30}">
							30
						</c:when> 
						<c:when test="${item.hdcheck==50}">
							50
						</c:when> 
						<c:when test="${item.hdcheck==100}">
							100
						</c:when> 
					</c:choose> 	
	 			</td>
				
				<td>${clist.cPeople}</td>
			</tr>	
			</c:forEach>
		</c:if>	
		<%--  반복문이용하여 출력끝 --%>
		<%-- paging출력부분 --%>
<%--		<tr>
			<td colspan="5" style="text-align:center;">
			<!-- JSTL if조건문: 이전출력 현재보이지않음 /p653 var="변수명"-->
			<c:if test="${pageClub.startPage>2}">
				<a href="<%=request.getContextPath() %>/hpdesk/listhpdesk.aa?pageNo=${pageClub.startPage-2}&rowSize=${rsize}">prev</a>
			</c:if>
			<!-- JSTL forEach조건문: 페이지번호출력 & 링크태그  -->
			 <c:forEach var="pNo"  begin="${pageClub.startPage}"  end="${pageClub.endPage}">
				<a href="<%=request.getContextPath() %>/hpdesk/listhpdesk.aa?pageNo=${pNo}&rowSize=${rsize}">${pNo}</a>  
			</c:forEach>
			<!-- JSTL if조건문: 다음출력 현재보이지않음 /메서드getTotalPages()를 변환  -->
			<c:if test="${pageClub.endPage<pageClub.totalPages}">
				<a href="<%=request.getContextPath() %>/hpdesk/listhpdesk.aa?pageNo=${pageClub.startPage+2}&rowSize=${rsize}">next</a>
			</c:if> 					
			</td>
		</tr>
--%>	
	</table>	
	
	
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>