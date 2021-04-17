<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
var ws = new WebSocket("ws://localhost:8080/replyEcho?pNo=60001");

ws.onopen = function(){
	console.log("Info : connection opened");
	setTimeout(function(){connection();}, 1000);
	
	ws.onmessage = function(event){
		console.log(event.date);
	};
};

ws.onclose = function(event){console.log("Info: connection closed");};
</script>
<body>

</body>
</html>