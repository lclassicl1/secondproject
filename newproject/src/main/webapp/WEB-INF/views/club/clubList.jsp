<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/default.css">
<title>클럽 리스트</title>
<style>
	#searchCName{
		width: 300px;
		border: solid 1px;
		margin-right: 5px;
	}
	#serarch{
		width: 100px;
	}
	#searchFrm{
		display: flex;
	    justify-content: center;
	    margin-top: 20px;
	
	}
</style>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>
<main>	
	<!-- 검색 -->
	<%-- <div>
	<form id="searchFrm" method="get" action="${path}/club/searchCName">
			<input type="text" id="searchCName" name="searchCName"/>
			<input type="hidden" id="categoryNo" name="categoryNo" value="${param.categoryNo }"/>
			<input type="submit" class="btn btn-outline-primary mr-2" value="검색"/>
	</form>
	</div> --%>
		<div id="subheader">
	<div class="row">
		<div class="eight columns">
			<p class="bread leftalign">
				<c:choose>
				    <c:when test="${categoryNo eq 1}">
				    	공부 모임
				    </c:when>
				    <c:when test="${categoryNo eq 2}">
				    	요리 모임
				    </c:when>
				    <c:otherwise>
				    	전체 모임
				    </c:otherwise>
				</c:choose>
			</p> 
		</div>
		<div class="four columns">
			<div class="row collapse">
				<div class="ten mobile-three columns">
							<div class="two mobile-one columns">
							</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="hr">
</div>
<div class="row">
	<div>
		<form id="searchFrm" method="get" action="${path}/club/searchCName">
				<input type="text" id="searchCName" name="searchCName" placeholder="Search..."/>
				<input type="hidden" id="categoryNo" name="categoryNo" value="${categoryNo }"/>
				<input type="submit" class="postfix button expand" id="serarch" value="검색"/>
		</form>
	</div> 
	<c:if test="${empty clubList}">
		<h3>개설된 클럽이 없습니다</h3>
	</c:if>
    <!-- MAIN CONTENT -->
	<div class="eight columns noleftmargin">
    <c:if test="${!empty clubList}">
   	 <c:forEach var="clist" items="${clubList}">
		<div class="six columns">
			<div class="boxblog">
				<h5>클럽명 <a href="${path}/club/detail?categoryNo=${clist.categoryNo}&cNo=${clist.cNo}">${clist.cName}</a></h5>
				<p class="small date">
					클럽개설일 <fmt:formatDate value="${clist.creDate}" type="date" pattern="yyyy.MM.dd"/>
				</p>
				<p>
					클럽장 ${clist.masterId}
				</p>
				<p>
					활동지역 ${clist.cLoc}
				</p>
				<p>
					정원 ${clist.cPeople}
				</p>
			</div>
		</div>
		</c:forEach>
		</c:if>
	</div>
</div>
		<ul class="pagination">
			<li class="arrow unavailable"><a href="">&laquo;</a></li>
			<li class="current"><a href="">1</a></li>
			<li><a href="">2</a></li>
			<li><a href="">3</a></li>
			<li><a href="">4</a></li>
			<li class="unavailable"><a href="">&hellip;</a></li>
			<li><a href="">12</a></li>
			<li><a href="">13</a></li>
			<li class="arrow"><a href="">&raquo;</a></li>
		</ul>
</main>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>