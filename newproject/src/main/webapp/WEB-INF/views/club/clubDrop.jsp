<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:if test="${cnt==1}">
		       <script>       
					alert("탈퇴성공");
				</script>
</c:if>
<c:if test="${cnt==0}">
		       <script>       
					alert("탈퇴실패");
				</script>
</c:if>
				
<script>
location.href="${cPath}/club/main"; 
</script>
</body>
</html>