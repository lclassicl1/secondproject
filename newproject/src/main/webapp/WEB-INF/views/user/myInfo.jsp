<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY INFORMATION</title>
</head>
<body>
(프로필사진)
<button onclick="#">사진 변경</button>
${loginUser.id}
${loginUser.name}
${loginUser.regdate}
<a href="modifyMyInfo">내 정보 수정</a>
<button onclick="<%=request.getContextPath()%>/modifyMyInfo">내 정보 수정</button>
</body>
</html>