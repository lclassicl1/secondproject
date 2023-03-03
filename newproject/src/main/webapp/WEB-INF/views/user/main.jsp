<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>damoye</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"></jsp:include></header>
<main>
${userId }님, ${userName }님	반갑습니다!<br/>
<a href="<%=request.getContextPath()%>/club/maintest">클럽 홈</a><br/>
<a href="<%=request.getContextPath()%>/myClub">내가 가입된 클럽보기</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=1">채팅방 1 test</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=2">채팅방 2 test</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=3">채팅방 3 test</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=4">채팅방 4 test</a><br/>
<a href="<%=request.getContextPath()%>/chat/room?roomNo=5">채팅방 5 test</a><br/>
<a href="/logout">로그아웃</a>
</main>

<div id="ei-slider" class="ei-slider">
	<ul class="ei-slider-large">
		<li>
		<img src="http://www.wowthemes.net/demo/studiofrancesca/images/slideshow/large/2.jpg" alt="image01" class="responsiveslide">
		<div class="ei-title">
			<h2>모임소개1</h2>
			<h3>모임이름1</h3>
		</div>
		</li>
		<li>
		<img src="http://placehold.it/1400x500/222" alt="image02" class="responsiveslide">
		<div class="ei-title">
			<h2>모임소개2</h2>
			<h3>모임이름2</h3>
		</div>
		</li>
		<li>
		<img src="http://placehold.it/1400x500/222" alt="image03" class="responsiveslide">
		<div class="ei-title">
			<h2>모임소개3</h2>
			<h3>모임이름3</h3>
		</div>
		</li>
		<li>
		<img src="http://placehold.it/1400x500/222" alt="image04" class="responsiveslide">
		<div class="ei-title">
			<h2>모임소개14</h2>
			<h3>모임이름4</h3>
		</div>
		</li>
		
	</ul>
	<!-- slider-thumbs -->
	<ul class="ei-slider-thumbs">
		<li class="ei-slider-element">Current</li>
		<li><a href="#">Slide 1</a><img src="http://placehold.it/150x59/444" class="slideshowthumb" alt="thumb01"/></li>
		<li><a href="#">Slide 2</a><img src="http://placehold.it/150x59/444" class="slideshowthumb" alt="thumb02"/></li>
		<li><a href="#">Slide 3</a><img src="http://placehold.it/150x59/444" class="slideshowthumb" alt="thumb03"/></li>
		<li><a href="#">Slide 4</a><img src="http://placehold.it/150x59/444" class="slideshowthumb" alt="thumb04"/></li>
	</ul>
</div>
<div class="minipause">
</div>
<!-- SUBHEADER
================================================== -->
<div id="subheader">
	<div class="row">
		<div class="twelve columns">
			<p class="text-center">
				 안녕하세요. 다모여입니다. (대충 웹 사이트 인사말 ?!)
			</p>
		</div>
	</div>
</div>
<!-- ANIMATED COLUMNS 
================================================== -->
<div class="row">
	<div class="twelve columns">
		<ul class="ca-menu">
			<li>
			<a href="#">
			<span class="ca-icon"><i class="fa fa-heart"></i></span>
			<div class="ca-content">
				<h2 class="ca-main">모임 카테고리1</h2>
				<h3 class="ca-sub">간략한 모임 소개</h3>
			</div>
			</a>
			</li>
			<li>
			<a href="#">
			<span class="ca-icon"><i class="fa fa-bullhorn"></i></span>
			<div class="ca-content">
				<h2 class="ca-main">모임 카테고리2</h2>
				<h3 class="ca-sub">간략한 모임 소개</h3>
			</div>
			</a>
			</li>
			<li>
			<a href="#">
			<span class="ca-icon"><i class="fa fa-user"></i></span>
			<div class="ca-content">
				<h2 class="ca-main">모임 카테고리3</h2>
				<h3 class="ca-sub">간략한 모임 소개</h3>
			</div>
			</a>
			</li>
			<li>
			<a href="#">
			<span class="ca-icon"><i class="fa fa-camera"></i></span>
			<div class="ca-content">
				<h2 class="ca-main">모임 카테고리4</h2>
				<h3 class="ca-sub">간략한 모임 소개</h3>
			</div>
			</a>
			</li>
		</ul>
	</div>
</div>
<!-- CONTENT 
================================================== -->
<div class="row">
	<div class="twelve columns">
		<div class="centersectiontitle">
			<h4>공지사항</h4>
		</div>
	</div>
	<div class="four columns">
		<h5>공지사항1</h5>
		<p>
			 공지사항1 입니다. 
		</p>
		<p>
			<a href="#" class="readmore">더보기</a>
		</p>
	</div>
	<div class="four columns">
		<h5>공지사항2</h5>
		<p>
			공지사항2 입니다. 
		</p>
		<p>
			<a href="#" class="readmore">더보기</a>
		</p>
	</div>
	<div class="four columns">
		<h5>공지사항3</h5>
		<p>
			공지사항3 입니다. 
		</p>
		<p>
			<a href="#" class="readmore">더보기</a>
		</p>
	</div>
</div>
<div class="hr">
</div>
<!-- TESTIMONIALS 
================================================== -->
<div class="row">
	<div class="twelve columns">
		<div id="testimonials">
			<blockquote>
				<p>
					 "일단 있어서 넣어봣습니다...11111" <cite>사용자1</cite>
				</p>
			</blockquote>
			<blockquote>
				<p>
					"일단 있어서 넣어봣습니다...22222" <cite>사용자2</cite>
				</p>
			</blockquote>
			<blockquote>
				<p>
					"일단 있어서 넣어봣습니다...33333" <cite>사용자3</cite>
				</p>
			</blockquote>
		</div>
		<!--end testimonials-->
	</div>
</div>

<footer><jsp:include page="/resources/module/footer.jsp"></jsp:include></footer>
</body>
</html>