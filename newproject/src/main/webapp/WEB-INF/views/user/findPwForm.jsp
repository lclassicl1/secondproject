<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIND PASSWORD</title>
</head>
<body>
<form:form action="findPw" modelAttribute="user" method="post">
아이디:<form:input path="id"/><br/>
이름:<form:input path="name"/><br/>
이메일<form:input path="email"/><br/>
<input type="submit" value="찾기">
</form:form>
</body>
</html>