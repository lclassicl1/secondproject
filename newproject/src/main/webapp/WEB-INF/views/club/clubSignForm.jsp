<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"/></header>	
<span></span><span></span><span></span>

<script>
</script>
<h3>가입화면</h3>
<form id="signClub" method="post">
<p><input type="number" name="categoryNo" id="categoryNo" readonly="readonly" value="${categoryNo}"/>
<p><input type="number" name="cNo" id="cNo" readonly="readonly" value="${cNo}"/></p> <!-- 클럽번호 -->
<p><input type="number" name="no" id="no" readonly="readonly" value="${loginUser.no}"/></p> <!-- 회원번호 -->
</form>

<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>