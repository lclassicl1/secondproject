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
<a href="/logout">로그아웃</a>
</main>
<footer><jsp:include page="/resources/module/footer.jsp"></jsp:include></footer>
</body>
</html>