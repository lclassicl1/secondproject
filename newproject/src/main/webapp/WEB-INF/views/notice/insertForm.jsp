<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- ck editor 5 -->
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<link rel="stylesheet" href="${path}/resources/css/default.css">
<title>Insert title here</title>
<script>
	$(function(){
		$('#submit').click(function(){
			/* 제목 검증 */
			let title = $('#title').val();
			if(title=='') {
				alert('제목이 입력되지 않았습니다');
				$('#title').focus();
				return false;
			}
			/* 
			내용 검증 현재 ck에디터 적용으로 반영 안되는듯
			let content = $('#content').val();
			if(content=='') {
				alert('내용이 입력되지않았습니다');
				$('#content').focus();
				return;
			} */
			
			//$('#form').submit();
			
		});
		
		$('#backBtn').click(function(){
			history.back();
		});
	});
</script>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"></jsp:include></header>
<main>
	<h1>공지사항 글쓰기</h1>
	<form action="${path}/notice/insert" method="post" id="form">
		<table border="1">
			<tr>
				<th>작성자</th><td><input type="hidden" name="writername" id="writername" value="${loginUser.name}"/>${loginUser.name}</td>
			</tr>
			<tr>
				<th>제목</th><td><input type="text" name="title" id="title" placeholder="제목을 입력해주세요"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="30" name="content" id="content" placeholder="내용을 입력해주세요"></textarea>
					<!-- <div id="content" name="content"></div> -->
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" id="submit" value="작성하기"/>&nbsp;
					<input type="reset" value="취소"/>&nbsp;
					<input type="button" value="뒤로가기" id="backBtn"/>
				</td>
			</tr>
		</table>
	</form>
</main>	
<footer><jsp:include page="/resources/module/footer.jsp"></jsp:include></footer>
<script>
	ClassicEditor
	.create( document.querySelector( '#content' ))
	.catch( error => {
	    console.error( error );
	});
</script>	
</body>
</html>