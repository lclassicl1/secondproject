<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	<a href="<%=request.getContextPath()%>/signIn">로그인하러가기</a><br/>
</h1>
	<h2><a href="#">카카오 로그인 구현부</a></h2>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
