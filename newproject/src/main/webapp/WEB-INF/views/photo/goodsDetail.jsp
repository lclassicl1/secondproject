<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goodsVO"  value="${goodsMap.goodsVO}" />
<c:set var="imageList"  value="${goodsMap.imageList}" />
 
<html>
<head>
<style>

</style>
<script>
<script type="text/javascript">
	function getfile(filename){
		location.href="<c:url value='/download.do'/>?filename="+filename;
	}
</script>
</head>
<body>
<%--컨트롤러로부터 아래와 같이 Model받았다
 Map goodsMap : 상품상세+상품이미지목록 
Map-GoodsVO : 상품상세
   -List : 상품이미지목록
goodsMap.put("goodsVO", goodsVO);
List<ImageFileVO> imageList = goodsRepository.selectGoodsDetailImage(goods_id);
goodsMap.put("imageList",imageList); --%>



	 	
	<div class="thumbnail" style="text-align :center;  ">
	
		<h1>다모여</h1>
		<h2>사진첩</h2>
		<h3>제목:${goodsVO.goods_title}</h3>
		 아이디:${AUTHORUSER_ID}<br/>
		  등록일:<fmt:formatDate value="${goodsVO.credate}" pattern="yyyy-MM-dd"/><br/>
			<img  style="width: 200px; height: 200px;" 
			alt="HTML5 &amp; CSS3"
				src="${conPath}/thumbnails?goods_id=${goodsVO.goods_id}&fileName=${goodsVO.fileName}">


	</div>
	
	
		
</body>
</html>
<%-- 로그인여부 담기 --%>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>












