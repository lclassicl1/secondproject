<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/default.css">
<script>
	$(function(){
		let allcount = ${allNotice}
		
		$('#noticeWrite').click(function(){
			location.href='${path}/notice/insert';
		});
		
		//페이징처리 준비중
		$('#paging').change(function(){
			let count = $(this).val();
			console.log(count);
		})
		
		//ajax로 페이징처리 구현시도
		$.ajax({
			url: '${path}/notice/paging',
			type: 'get',
			data: {},
			success:function(data) {
				alert(data);
				//$('#pagingspan').html(data);
			}, error:function(){
				alert('ajax 실행 오류발생');
			}
		}); 
		//ajax 끝
		
	});

</script>
<title>Insert title here</title>
</head>
<body>
<main>
<header><jsp:include page="/resources/module/header.jsp"/></header>
	<div><h1>공지사항 목록</h1></div>
	<%-- 총 게시글수: ${result} --%>
	<%-- 현재 세션 아이디:${sessionId} --%>
	<%-- 게시글정보: ${noticeList} --%>
	sessionName:${userName}
	sessionID:${userId}
	전체게시글수allNotice:${allNotice}
	<table border="1">
		<tr>
			<th><input type="checkbox"/></th><th>제목</th><th>작성자</th><th>작성시간</th><th>조회수</th>
		</tr>
		<c:if test="${empty noticeList}">
		<tr>
			<td colspan="5">작성된 공지사항이 없습니다</td>
		</tr>	
		</c:if>
		<c:if test="${not empty noticeList}">
			<c:forEach items="${noticeList}" var="list">
			<tr> 
				<td><input type="checkbox"/></td>
				<td><a href="${path}/notice/read?no=${list.no}">${list.title}</a></td>
				<td>${list.writername}</td>
				<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
				<td>${list.readcnt}</td>
			</tr>	
			</c:forEach>
		<tr>
			<td colspan="5" style="text-align: center;" id="pagingspan">
			<select id="paging">
				<option value="">선택</option>
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="20">20</option>
			</select>
					[이전] 1 2 3 4 5 6 [다음]</td>
		</tr>
		<tr>
			<td colspan="5">
			 	<!-- 관리자만 글쓰기 작성 활성화 -->
				<c:if test="${userId == 'admin'}">
					<input type="button" value="글쓰기" id="noticeWrite"/>
				</c:if>
			</td>
		</tr>
		</c:if>
	</table>
</main>	
<footer><jsp:include page="/resources/module/footer.jsp"/></footer>
</body>
</html>