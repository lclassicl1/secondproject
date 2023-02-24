<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL Core -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL Format -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- ContextPath -->
<c:set var="path" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style></style>
<script>
	/* Jquery 선언부 */
		$(function(){
			$('#backBtn').click(function(){
				history.back();
			});	
		});
</script>
<title>Insert title here</title>
</head>
<body>
<header><jsp:include page="${path}/resources/module/header.jsp"/></header>
	<h1>공지사항 글 수정</h1>
	몇번글수정?:${no}
	넘겨받은DTO:${noticeDTO}
	<form action="${path}/notice/updateForm" method="post">
		<input type="hidden" name="no" id="no" value="${noticeDTO.no}"/>
		<table border="1">
			<tr>
				<th>작성자</th><td><input type="hidden" name="writername" id="writername" value="${noticeDTO.writername}"/>${noticeDTO.writername}</td>
			</tr>
			<tr>
				<th>제목</th><td><input type="text" name="title" id="title" placeholder="${noticeDTO.title}"/></td>
			</tr>
			<tr>
				<th>내용</th><td><textarea rows="10" cols="30" name="content" id="content" placeholder="${noticeDTO.content}"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정하기"/>&nbsp;
					<input type="reset" value="취소"/>&nbsp;
					<input type="button" value="뒤로가기" id="backBtn"/> </td>
			</tr>
		</table>
	</form>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>