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
<h1 class=size>${userInfo.name}さん <a class=logout2 href="LogoutServlet">ログアウト</a></h1>
</header>
</div>

<h1 class=title>ユーザ新規登録</h1>
<form action="NewUserServlet"method="post">

<c:if test="${errMsg != null}" >
	    <div class="error"role="alert">
		  ${errMsg}
		</div>
	</c:if>

<div class=a>
<label for="ID"></label>
<!-- ログインID<input class=b type="text" name="ログインID" required="required"></input> -->
ログインID<input type="text" name="loginId" id="inputLoginId" class="b" >
</div>

<div class=a>
<label for="password1"></label>
<!-- パスワード<input class=b type="password" name="パスワード" required="required"></input> -->
パスワード<input type="password" name="password" id="inputPassword" class="b" >
</div>

 <div class=a>
<label for="repassword"></label>
<!-- パスワード(確認)<input class=c type="repassword" name="パスワード(確認)" required="required"></input> -->
パスワード(確認)<input type="repassword" name="repassword" id="input" class="c" >
</div>

<div class=a>
<label for="username"></label>
<!-- ユーザ名<input class=d type="text" name="ユーザ名" required="required"></input> -->
ユーザ名<input type="text" name="name" id="inputname" class="d"  >
</div>

<div class=a>
<label for="birthday"></label>
<!-- 生年月日<input class=d type="text" name="生年月日" required="required"></input> -->
生年月日<input type="text" name="birthday" id="inputday" class="d"  >
</div>

<div class=submit>
<!-- <input type="submit" class="button" title="登録" value="登録"></input> -->
<button class="button" type="submit">登録</button>
</div>

<div class="return">
<p><a href=UserListServlet>戻る</a></p>
</div>
</form>
</body>
</html>