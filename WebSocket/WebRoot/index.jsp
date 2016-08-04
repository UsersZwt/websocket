<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset=UTF-8>
		<title>Login</title>
		<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
	</head>
	<body>
		<form action="/WebScoket/loginServlet" method="post">
			<center>
				请输入用户名:<input type="text" name="name"/>
				<input type="submit" id="sub" value="提交"/>
			</center>
		</form>
	</body>
</html>