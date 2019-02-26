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

<div class=logout>
<header >
<h1 class=size>ユーザ名さん <a class=logout2 href="LogoutServlet">ログアウト</a></h1>
</header>
</div>

<h1 class=title>ユーザ新規登録</h1>
<form>

<div class=a>
<label for="ID"></label>
ログインID<input class=b type="text" name="ログインID" required="required"></input>
</div>

<div class=a>
<label for="password1"></label>
パスワード<input class=b type="password" name="パスワード" required="required"></input>
</div>

 <div class=a>
<label for="password2"></label>
パスワード(確認)<input class=c type="password" name="パスワード(確認)" required="required"></input>
</div>

<div class=a>
<label for="user_name"></label>
ユーザ名<input class=d type="text" name="ユーザ名" required="required"></input>
</div>

<div class=a>
<label for="day"></label>
生年月日<input class=d type="text" name="生年月日" required="required"></input>
</div>

<div class=submit>
<input type="submit" class="button" title="登録" value="登録"></input>
</div>

<div class="return">
<p><a href=UserListServlet>戻る</a></p>
</div>
</form>
</body>
</html>