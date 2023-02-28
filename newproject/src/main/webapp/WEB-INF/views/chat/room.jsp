<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="../resources/css/chat-room.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>    
<title>${param.roomNo }번 채팅방</title>
</head>


	 <script type="text/javascript">
	 
		$(document).ready(function(){
			
			
			$('#formBtn').on("click",function (){
				var writerId = $('#writerId').val().trim();
				var content = $('#content').val().trim();
				
				
				
				if(writerId.length == 0){
					alert("작성자를 입력해주세요");
					$('#writerId').focus();
					
					return false;
				}
				if(content.length == 0){
					alert("내용을 입력해주세요");
					$('#content').focus();
					
					return false;
				} 
				
				$.ajax({
		 			type: "POST",
		 			url: "./addMessage",
		 			data:{
		 				roomNo : ${param.roomNo},
		 				writerId : writerId,
		 				content : content
		 			},
		 			dataType:"json",
		 			success:console.log("add message"),
		 			error: function(){
		 				alert("insert error");
		 			}
		 		});
			});
			
			
			function loadMessage(){
				$.ajax({
		 			type: "POST",
		 			url: "./checkMessage",
		 			data:{
		 				roomNo:${param.roomNo}
		 			},
		 			success: function(data){
		 				document.getElementById("chatInfo").innerHTML = '';
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
				
				$('#chatInfo').append(' <span class="profile-name" id="chatName">'+chatMessage.writerId+'</span>');
				$('#chatInfo').append('<span class="balloon" id="chatContent">'+chatMessage.content+'</span>');
				$('#chatInfo').append(' <span id="chatTime">'+chatMessage.creDate+'</span>');
				

			 //	$('#chatContent').scrollTop($('#chatContent')[0].scrollHeight);

			}; 
			
			 setInterval(loadMessage,1000);
			
		});//ready end
		
		
	</script>
<body>
	<div id="chat-body">
            <!-- 프로필 사진, 프로필명 -->
            <header>
                <div class="profile-col">
                    <span class="profile-name">${param.roomNo }번방</span>
                </div>
            </header>
            <main>
                <!-- 채팅 내용 시작 -->
                <div class="chat-content" id="chat-content">
                    <!-- 메시지 시작 날짜 -->
                    <!-- <div class="date-line">
                        <time datetime="2021-03-29">2021년 3월 29일 월요일</time>
                    </div> -->
                    <!-- 채팅 내용 -->
                    <div class="main-chat">
                        <div class="friend-chat">
                            <div class="friend-chat-col" id="chatInfo">
                            </div>
                        </div>
                  	 </div>
                </div>
                <!-- 채팅 입력창 -->
                <div class="insert-content">
                	 <form name="chatform" id="addForm" method="post" >
					 		<input type="hidden" name="roomNo" value="${param.roomNo }"/><br>
							<input type="text" name="writerId" id="writerId" placeholder="작성자"/><br>
							<textarea  name="content" id="content" placeholder="내용"></textarea>
							<button id="formBtn" class="chat-submit">작성</button>
					</form> 
                </div>
            </main>
        </div>
	
	
	
	<%-- <p id="result"></p>
	 <form id="addForm" method="post" >
	 		<input type="hidden" name="roomNo" value="${param.roomNo }"/><br>
			작성자 : <input type="text" name="writerId" id="writerId" placeholder="작성자"/><br>
			내용 : <input type="text" name="content" id="content" placeholder="내용"/><br>
			<button id="formBtn">작성</button>
	</form>  --%>
</body>
</html>