<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>    
<!DOCTYPE html>
<html>
<head>
<html class="no-js" lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"/>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<link rel="stylesheet" href="${path}/resources/css/skins/green.css">
<link rel="stylesheet" href="${path}/resources/css/responsive.css">
<script>

	function logout() {
		if(confirm('로그아웃 하시겠습니까?')) {
			location.href="${path}/logout";
		} else {
			return;
		}
	}
</script>
</head>
<body>
<div class="row" style="margin-top: 15px;">
	<div class="headerlogo four columns">
		<div class="logo">
			<a href="${path}/logoMain">
			<img src="${path}/resources/img/logo.png" alt="logo img" style="height: 45px;">
			</a>
		</div>
	</div>
	<div class="headermenu eight columns noleftmarg" style="width: 66.6666%;">
		<nav id="nav-wrap">
		<ul id="main-menu" class="nav-bar sf-menu">
			<li class="current">
			<a href="<%=request.getContextPath()%>/notice">공지사항</a>
			</li>
			<li>
			<a href="<%=request.getContextPath()%>/club/allClubList">다모여 클럽</a>
			<ul>
				<li><a href="#">자유주제</a></li>
				<li><a href="${path}/club/clist?categoryNo=1">공부</a></li>
				<li><a href="#">여행</a></li>
				<li><a href="${path}/club/clist?categoryNo=2">요리</a></li>
			</ul>
			</li>
			<li>
			<a href="<%=request.getContextPath()%>/photo/main">사진게시판</a>
			<!-- <ul>
				<li><a href="blogpage1.html">Blog page style 1</a></li>
				<li><a href="blogpage2.html">Blog page style 2</a></li>
				<li><a href="blogpage3.html">Blog page style 3</a></li>
				<li><a href="blogsinglepost.html">Single post</a></li>
			</ul> -->
			</li>
			<li>
			<a href="<%=request.getContextPath()%>/myClub">내 클럽</a>
			</li>
			<li>
			<a href="<%=request.getContextPath()%>/myInfo">마이페이지</a>
			</li>
			<li>
			<a class="nav-link" onclick="logout();">로그아웃</a>
			<!-- <ul>
				<li><a href="columns.html">Columns</a></li>
				<li><a href="elements.html">Elements</a></li>
				<li><a href="typography.html">Typography</a></li>
			</ul> -->
			</li>
		</ul>
		</nav>
	</div>
</div>
<div class="clear">
</div>
</body>
</html>