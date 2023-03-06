<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>damoye</title>
</head>
<body>
<header><jsp:include page="/resources/module/header.jsp"></jsp:include></header>
<div id="ei-slider" class="ei-slider">
	<ul class="ei-slider-large">
		<li>
		<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAyMDVfNCAg%2FMDAxNjc1NTcyMTMwNjU5.fJNcSr5QvRK4bAkYZT4yS1tqSj9wpGewghNxllMSuPAg.Da54wC-vq7xVBo0sHLrQvl6TIXOy6wtqCHBjrgDuoKYg.JPEG.ljaskylove00%2FKakaoTalk_20221113_120311429_03.jpg&type=sc960_832" alt="image01" class="responsiveslide">
		<div class="ei-title">
			<h2>모임소개1</h2>
			<h3>모임이름1</h3>
		</div>
		</li>
		<li>
		<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDExMjJfNjQg%2FMDAxNjA2MDU0NjM2ODY3.RljtHkVr8zixMBER4MACMBeiQhNSt1EGARM8h95R4GEg.NDMQdw902x8JjS3xjcDdUYFLfa2zMe_ySbf6TEPyNmIg.JPEG.andrichrich%2FIMG%25A3%25DF20201104%25A3%25DF011157.jpg&type=sc960_832" alt="image02" class="responsiveslide">
		<div class="ei-title">
			<h2>모임소개2</h2>
			<h3>모임이름2</h3>
		</div>
		</li>
		<li>
		<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMjJfMjIg%2FMDAxNjcxNjM5Mzg4NzI1.TOl2dnd87pQxHTATjMQLVADLASVZvnxLZ96dMsLNPGAg.6vpQaD3XQTo4emolDcWwqV6e4dtGTj1fTPrkfphnbVIg.JPEG.kangjs1981%2FKakaoTalk_Photo_2022-12-22-01-13-16_009.jpeg&type=sc960_832" alt="image03" class="responsiveslide">
		<div class="ei-title">
			<h2>모임소개3</h2>
			<h3>모임이름3</h3>
		</div>
		</li>
		<li>
		<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMjVfMjEw%2FMDAxNjc0NjM4MjUxNDA3.wAUwN3pwIMNbJLoxZLRBJMIJ-5KKw0OwdsjwaWDONskg.6-dqMPi9RdhVj7A5R-etmL-ISKqJaYEm0aOjFzw6W94g.JPEG.qkrwkdgus00%2FKakaoTalk_20230125_181215637_01.jpg&type=sc960_832" alt="image04" class="responsiveslide">
		<div class="ei-title">
			<h2>모임소개14</h2>
			<h3>모임이름4</h3>
		</div>
		</li>
		
	</ul>
	<!-- slider-thumbs -->
	<ul class="ei-slider-thumbs">
		<li class="ei-slider-element">Current</li>
		<li><a href="#">Slide 1</a><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAyMDVfNCAg%2FMDAxNjc1NTcyMTMwNjU5.fJNcSr5QvRK4bAkYZT4yS1tqSj9wpGewghNxllMSuPAg.Da54wC-vq7xVBo0sHLrQvl6TIXOy6wtqCHBjrgDuoKYg.JPEG.ljaskylove00%2FKakaoTalk_20221113_120311429_03.jpg&type=sc960_832" class="slideshowthumb" alt="thumb01"/></li>
		<li><a href="#">Slide 2</a><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDExMjJfNjQg%2FMDAxNjA2MDU0NjM2ODY3.RljtHkVr8zixMBER4MACMBeiQhNSt1EGARM8h95R4GEg.NDMQdw902x8JjS3xjcDdUYFLfa2zMe_ySbf6TEPyNmIg.JPEG.andrichrich%2FIMG%25A3%25DF20201104%25A3%25DF011157.jpg&type=sc960_832" class="slideshowthumb" alt="thumb02"/></li>
		<li><a href="#">Slide 3</a><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMjJfMjIg%2FMDAxNjcxNjM5Mzg4NzI1.TOl2dnd87pQxHTATjMQLVADLASVZvnxLZ96dMsLNPGAg.6vpQaD3XQTo4emolDcWwqV6e4dtGTj1fTPrkfphnbVIg.JPEG.kangjs1981%2FKakaoTalk_Photo_2022-12-22-01-13-16_009.jpeg&type=sc960_832" class="slideshowthumb" alt="thumb03"/></li>
		<li><a href="#">Slide 4</a><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMjVfMjEw%2FMDAxNjc0NjM4MjUxNDA3.wAUwN3pwIMNbJLoxZLRBJMIJ-5KKw0OwdsjwaWDONskg.6-dqMPi9RdhVj7A5R-etmL-ISKqJaYEm0aOjFzw6W94g.JPEG.qkrwkdgus00%2FKakaoTalk_20230125_181215637_01.jpg&type=sc960_832" class="slideshowthumb" alt="thumb04"/></li>
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
			<a href="<%= request.getContextPath() %>/club/clist?categoryNo=1">
			<span class="ca-icon"><i class="fa fa-heart"></i></span>
			<div class="ca-content">
				<h2 class="ca-main">공부</h2>
				<h3 class="ca-sub">공부 모임입니다. </h3>
			</div>
			</a>
			</li>
			<li>
			<a href="<%=request.getContextPath() %>/club/clist?categoryNo=2">
			<span class="ca-icon"><i class="fa fa-bullhorn"></i></span>
			<div class="ca-content">
				<h2 class="ca-main"> 요리</h2>
				<h3 class="ca-sub">요리 모임입니다.</h3>
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