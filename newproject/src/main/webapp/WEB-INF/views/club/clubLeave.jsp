<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
</script>
<title>클럽 회원 탈퇴</title>
</head>
<body>
${clubMemberDTO}
<form id="clubDelUp" method="post" action="">
<p><input type="number" name="cMemberNo" id="cMemberNo" readonly="readonly" value="${clubMemberDTO.cMemberNo}"/></p>
<p><input type="text" name="signIn" id="signIn" value="${clubMemberDTO.signIn}"/></p> <!-- 가입여부 -->
</form>
				
<script>
</script>
</body>
</html>