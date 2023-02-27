<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/> 
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

<form id="signClub" action="${cPath}/club/main" method="post">
<script>

</script>
<h3>가입을 축하합니다</h3>
<p><input type="number" name="cNo" id="cNo" readonly="readonly" value="${param.cNo}"/></p> <!-- 클럽번호 -->
<p><input type="number" name="cMemeberNo" id="cMemeberNo" readonly="readonly" value="${session}"/></p> <!-- 가입한클럽회원번호 자동생성-->
<P><input type="text" name="memberId" id="memberId" readonly="readonly" value="${session}"/></P> <!-- 회원아이디 -->
<p><input type="number" name="no" id="no" readonly="readonly" value="${session}"/></p> <!-- 회원번호 -->
<p><input type="submit" value="가입완료"/></p>
</form>

<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>