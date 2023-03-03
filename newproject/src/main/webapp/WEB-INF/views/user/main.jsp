<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
</style>
<link rel="stylesheet" href="${path}/resources/css/default.css">
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"></jsp:include></header>
<main>
${userId }님, ${userName }님	반갑습니다!<br/>
<a href="<%=request.getContextPath()%>/club/maintest">클럽 홈</a><br/>
<a href="<%=request.getContextPath()%>/myClub">내가 가입된 클럽보기</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=1">채팅방 1 test</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=2">채팅방 2 test</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=3">채팅방 3 test</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=4">채팅방 4 test</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=5">채팅방 5 test</a><br/>
<a href="/logout">로그아웃</a>
</main>
<footer><jsp:include page="/resources/module/footer.jsp"></jsp:include></footer>
</body>
</html>