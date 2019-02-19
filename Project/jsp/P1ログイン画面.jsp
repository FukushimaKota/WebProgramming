 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="../CSS/style.css">
<title>ログイン</title>
</head>
<h1 class=title>ログイン画面</h1>
<body>
	<form action="/Example/Part1.jsp" method="post">
	<div class=login-area>
	ログインID<input class="input" type="text" name="id" ><br>
	<p><p>
	パスワード<input class="input" type="password" name="password"><br>
	<p><p>
	<input class="login" type="submit" value="ログイン">
	</div>
	</form>
	</body>
	</html>