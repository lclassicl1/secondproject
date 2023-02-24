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
			//목록 돌아가기 버튼
			$('#moveNoticeList').click(function(){
				location.href='${path}/notice';
			});
			
			//수정버튼
			$('#updateNotice').click(function(){
				location.href='${path}/notice/updateForm?no=${noticeDTO.no}';
			});
			
			//삭제버튼
			$('#deleteNotice').click(function(){
				alert('deleteNotice');
			});
		});
</script>
<title>Insert title here</title>
</head>
<body>
<header><jsp:include page="${path}/resources/module/header.jsp"/></header>
	<h1>공지사항 상세보기</h1>
	${noticeDTO}
	<table border="1">
		<tr>
			<th>작성자</th><td>${noticeDTO.writername}</td>
		</tr>
		<tr>
			<th>제목</th><td>${noticeDTO.title}</td>
		</tr>
		<tr>
			<th>내용</th><td>${noticeDTO.content}</td>
		</tr>
		<tr>
			<th>작성일자</th><td>${noticeDTO.regdate}</td>
		</tr>
		<tr>
			<th>마지막수정일자</th><td>${noticeDTO.modidate}</td>
		</tr>
		<tr>
			<th>조회수</th><td>${noticeDTO.readcnt}</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" name="" id="updateNotice" value="수정"/>
				<input type="button" name="" id="deleteNotice" value="삭제"/>
				<input type="button" name="moveNoticeList" id="moveNoticeList" value="목록"/>
			</td>
		</tr>
	</table>
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>	
</body>
</html>