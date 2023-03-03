<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODIFY MY INFORMATION</title>
</head>
<body>
<form:form action="modifyMyInfo" method="post" modelAttribute="user">
<input type="hidden" name="id" value="${loginUser.id}"/>
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${loginUser.id}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${loginUser.name}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><form:password path="password" value="${loginUser.password}"/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><form:input path="email" value="${loginUser.email}"/></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><form:input path="phonenum" value="${loginUser.phonenum}"/></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><form:input path="zipcode" value="${loginUser.zipcode}"/></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><form:input path="address" value="${loginUser.address}"/></td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td><form:input path="detailaddress" value="${loginUser.detailaddress}"/></td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${loginUser.gender}</td>
	</tr>
	<tr>
		<th>등급</th>
		<td>${loginUser.grade}</td>
	</tr>
		<tr>
		<th>가입일</th>
		<td>${loginUser.regdate}</td>
	</tr>
</table>
<input type="submit" value="수정하기"/>
</form:form>
</body>
</html>