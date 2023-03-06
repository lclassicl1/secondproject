<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<td  colspan="2" align="center" >
       <input type="button" value="파얼업로드" onClick="location.href='${conPath}/photo/addForm'" class='btn btn-success'/>
 		</tr>
<%-- 변수goods_count는 more글자가 노출여부를 설정하기위한 변수 --%>
<table border="1">
<h3>사진첩</h3>
<hr />
<div class="book">
   <c:set  var="goods_count" value="0" />
<%--c:forEach 상품목록에서 bestseller시작 --%>
<c:forEach items="${goodsMap.bestseller}" var="item">
 <c:set var="goods_count" value="${goods_count+1 }" />
		<div class="col-md-3">
			<div class="thumbnail" style="text-align : center; float:left;">
				<a href="${conPath}/photo/goodsDetail?goods_id=${item.goods_id} ">
					<%-- <img class="link"  src="${conPath}/resources/image/1px.gif">  --%>
					<img style="width: 121px; height: 125px; float:left; padding:30px;"
					alt="centrt"
					src="${conPath}/thumbnails?goods_id=${item.goods_id}&fileName=${item.fileName}">
    					</a>
				
				
				<div class="caption">
					 제목:<div class="title">${item.goods_title}</div><br/>
					 아이디:${AUTHORUSER_ID}<br/>
					 등록일:<fmt:formatDate value="${item.credate}" pattern="yyyy-MM-dd"/><br/>
					</div>
					<hr/>
				</div>
		
		 <c:if test="${goods_count==15}">
     <div class="book">
       <font size="7"> <a href="#">more</a></font>
     </div>
   </c:if>
</c:forEach>
</div>

</table>

</body>
</html>
<%--c:forEach 상품목록에서 bestseller끝 --%>



