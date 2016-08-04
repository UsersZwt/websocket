<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset=UTF-8>
		<title>Tomcat WebSocket Chat</title>
		<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/chat.js"></script>
		<script type="text/javascript">
	var ws = new WebSocket("ws://chat.tunnel.phpor.me/WebScoket/wsServlet");
	ws.onopen = function() {
	};
	ws.onmessage = function(message) {
		document.getElementById("chatlog").textContent += message.data + "\n";
		document.getElementById("chatlog").scrollTop = document.getElementById("chatlog").scrollHeight;
	};
	function postToServer() {
		if ($("#msg").val() != "") {
			
			ws.send(document.getElementById("uname").value + ":"
					+ document.getElementById("msg").value);
			document.getElementById("msg").value = "";
		}
	}
	function closeConnect() {
		document.getElementById("chatlog").textContent += "连接关闭!\n";
		ws.close();
	}
	
</script>
	</head>
	<body>

		<center>
			<textarea style="width: 300px; height: 400px" id="chatlog" readonly></textarea>
			<br />
			<input id="msg" type="text" />
			<button type="submit" id="sendButton" onClick=
	postToServer();
>
				Send!
			</button>
			<button type="submit" id="sendButton" onClick=
	closeConnect();
>
				End
			</button>
			<input type="hidden" id="uname"
				value="<%=request.getParameter("name")%>" />
		</center>
		<div style="float: right">
			<audio controls="controls" autoplay="autoplay" loop="loop">
			<source src="music/Chris Medina - What Are Words.mp3"
				type="audio/ogg">
			</audio>
		</div>
	</body>
</html>