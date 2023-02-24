<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h3>로그인</h3>
	<form:form action="/signIn" modelAttribute ="user" method="post">
		
		<p>아이디 : <form:input path="id"  name="id" />
		<p>비밀번호 : <form:password path="password" />

		<p><input type="submit" value="가입하기"/>
		<a href="<%=request.getContextPath()%>/signUp">회원가입</a><br/>
		<a href="<%=request.getContextPath()%>/#">아이디찾기</a><a href="<%=request.getContextPath()%>/#">비밀번호찾기</a>
	
	</form:form>
</body>
</html>