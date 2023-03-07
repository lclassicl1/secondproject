<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"></jsp:include></header>

${loginUser}
${loginUser.id}님 반갑습니다!<br/>

<a href="${path}/club/maintest">클럽 홈</a><br/>
<a href="${path}/myClub">내가 가입된 클럽보기</a><br/>
<a href="${path}/board/list?cNo=1&num=1">클럽게시판(예시)</a><br/>
<a href="${path}/chat/room?roomNo=1">채팅방 1 test</a><br/>
<a href="${path}/chat/room?roomNo=2">채팅방 2 test</a><br/>
<a href="${path}/chat/room?roomNo=3">채팅방 3 test</a><br/>
<a href="${path}/chat/room?roomNo=4">채팅방 4 test</a><br/>
<a href="${path}/chat/room?roomNo=5">채팅방 5 test</a><br/>
=======
세션 아이디: ${sessionId}<br/>
${loginUser}님 반갑습니다!<br/>
>>>>>>> refs/remotes/origin/main
>>>>>>> refs/remotes/origin/main
<a href="/logout">로그아웃</a>
<a href="/myInfo">내 정보</a>

<footer><jsp:include page="/resources/module/footer.jsp"></jsp:include></footer>
</body>
</html>