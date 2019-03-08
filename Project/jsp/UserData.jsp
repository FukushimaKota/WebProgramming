<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Mock/CSS/userdata.css">

<title>ユーザ情報詳細参照</title>
</head>
<body>

<div class="logout">
<h1 class="size">${userInfo.name}さん <a class="logout2" href="LogoutServlet">ログアウト</a></h1>
</div>

<div class="title">
<h1>ユーザ情報詳細参照</h1>
</div>


<div class="aa">

<div class="a">
ログインID<nobr class="sentence">${user.loginId}</nobr>
</div>

<div class="a">
ユーザ名<nobr class="sentence">${user.name}</nobr>
</div>

<div class="a">
生年月日<nobr class="sentence">${user.birthDate}</nobr>
</div>

<div class="a">
登録日時<nobr class="sentence">${user.createDate}</nobr>
</div>

<div class="a">
更新日時<nobr class="sentence">${user.updateDate}</nobr>
</div>

 <div class="return">
<p><a href=UserListServlet>戻る</a></p>
 </div>
 </div>
 </body>
</html>


<!-- <p><input type="text" name="loginId" id="inputLoginId" class="input" placeholder="ログインID" required autofocus></p>
<p><input type="password" name="password" id="inputPassword" class="input" placeholder="パスワード" required></p> -->