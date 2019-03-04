<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="Mock/CSS/login.css">
<title>ログイン</title>
</head>
<body>
	<form action="LoginServlet"method="post">

<div class=title>
	<h1>ログイン画面</h1>
</div>

<c:if test="${errMsg != null}" >
	    <div class="error"role="alert">
		  ${errMsg}
		</div>
	</c:if>

	<div class=login-area>
<!--
	ログインID<input class="input" type="text" name="id" id="inputLoginId" placeholder="ログインID" required="required"><br>
	<p><p>
	パスワード<input class="input" type="password" name="password" placeholder="パスワード" required="required"><br>
	<p><p>
	<a href=List.jsp><input class="login" type="submit" value="ログイン"></a> -->

	<p><input type="text" name="loginId" id="inputLoginId" class="input" placeholder="ログインID"></p>
    <p><input type="password" name="password" id="inputPassword" class="input" placeholder="パスワード"></p>
    <p><button class="login" type="submit">ログイン</button></p>

	</div>

	</form>
	</body>
	</html>