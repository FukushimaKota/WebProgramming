<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>新規登録</title>
<link rel="stylesheet" type="text/css" href="Mock/CSS/newuser.css">
</head>
<body>

<div class="logout">
<header >
<h1 class=size>${userInfo.name}さん <a class="logout2" href="LogoutServlet">ログアウト</a></h1>
</header>
</div>

<h1 class="title">ユーザ新規登録</h1>
<form action="NewUserServlet"method="post">

<c:if test="${errMsg != null}" >
	    <div class="error"role="alert">
		  ${errMsg}
		</div>
	</c:if>

<div class="a">
<label for="ID"></label>
ログインID<input type="text" name="loginId" id="inputLoginId" class="b" placeholder="ログインID">
</div>

<div class="a">
パスワード<input type="password" name="password" id="inputPassword" class="b" placeholder="パスワード">
</div>

 <div class="a">
パスワード(確認)<input type="repassword" name="repassword" id="input" class="c" placeholder="パスワード（確認）">
</div>

<div class="a">
ユーザ名<input type="text" name="name" id="inputname" class="d"  placeholder="ユーザ名">
</div>

<div class="a">
生年月日<input type="text" name="birthday" id="inputday" class="d"  placeholder="生年月日">
</div>

<div class="submit">
<!-- <input type="submit" class="button" title="登録" value="登録"></input> -->
<button class="button" type="submit">登録</button>
</div>

<div class="return">
<p><a href=UserListServlet>戻る</a></p>
</div>
</form>
</body>
</html>