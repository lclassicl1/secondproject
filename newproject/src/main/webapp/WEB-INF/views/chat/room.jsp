<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>    
<title>채팅방</title>
</head>


	 <script type="text/javascript">
	 
		$(document).ready(function(){
			
			function loadMessage(){
				$.ajax({
		 			type: "POST",
		 			url: "./checkMessage",
		 			data:{
		 				roomNo:${param.roomNo}
		 			},
		 			success: function(data){
		 				document.getElementById("result").innerHTML = '';
		 				for(var i=0;i<data.message.length;i++){
		 					//document.getElementById("result").innerHTML += data.message[i].writerId+" : "+ data.message[i].content +" ["+data.message[i].creDate+"]<br>";
		 					drawMessage(data.message[i]);
		 				}
		 			},
		 			error: function(){
		 				alert("error1");
		 				$('#result').text("error");
		 			}
		 		});
			};
			
			 function drawMessage(chatMessage){
				var html = chatMessage.writerId+' : '+chatMessage.content+' ['+chatMessage.creDate+']';
				
				$('#result').append('<div id="msg">'+html+'</div>');
			}; 
			
			 setInterval(loadMessage,1000);
			
		});//ready end
		
		
	</script>
<body>
<h1>${param.roomNo }번방</h1>
	
	<p id="result"></p>
	 <form action="./addMessage" method="post">
			<input type="hidden" name="roomNo" value="${param.roomNo }"/>
			작성자 : <input type="text" name="writerId" placeholder="작성자"/><br>
			내용 : <input type="text" name="content" placeholder="내용"/><br>
			<input type="submit" value="작성">
	</form> 
</body>
</html>