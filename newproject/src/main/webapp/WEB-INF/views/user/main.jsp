<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"></jsp:include></header>
${userId }님, ${userName }님	반갑습니다!<br/>
<a href="/logout">로그아웃</a>

<footer><jsp:include page="/resources/module/footer.jsp"></jsp:include></footer>
</body>
</html>