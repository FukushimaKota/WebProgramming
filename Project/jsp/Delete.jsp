<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Mock/CSS/deleat.css">
<title>ユーザ削除</title>
</head>
<body>

<div class="logout">
<header >
<h1 class="size">${userInfo.name}さん <a class="logout2" href="LogoutServlet">ログアウト</a></h1>
</header>
</div>

<h1 class="title">ユーザ削除確認</h1>

<div class="sentence">
<p>ログインID:${user.loginId}</p>

<p>を本当に削除してよろしいでしょうか。</p>


</div>
<div class="button">
<a href="UserListServlet" class="btn btn-primary" role="button">キャンセル</a>
<a href="UserListServlet" class="btn btn-primary" role="button" >OK</a>
<!-- type="submit" title="OK" value="OK" onclick='return confirm("本当に削除しますか？");'/ -->
</div>
</body>
</html>
