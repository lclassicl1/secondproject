<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>myClub.jsp</h3>
<c:forEach var="item" items="${list }">
	${item.cNo }<br>
	${item.cName }<br>
	${item.masterId }<br>
	${item.cLoc }<br>
	${item.creDate }<br>
	${item.cPeople }<br>
	${item.cIsShow }<br>
	${item.categoryNo }<br>
	<hr>
</c:forEach>
</body>
</html>