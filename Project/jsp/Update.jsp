<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>更新</title>
<link rel="stylesheet" type="text/css" href="Mock/CSS/update.css">
</head>
<body>

<div class="logout">
<header >
<h1 class=size>${userInfo.name}さん <a class=logout2 href="LogoutServlet">ログアウト</a></h1>
</header>
</div>

<h1 class="title">ユーザ情報更新</h1>
<form action="UpdateServlet"method="post">

<c:if test="${errMsg != null}" >
	    <div class="error"role="alert">
		  ${errMsg}
		</div>
	</c:if>

<input type="hidden" value="${user.id}" name=id>

<div class=a>
ログインID<nobr class="aa" name="loginId">${user.loginId}</nobr>
</div>

<div class="a">
パスワード<input class="b" type="password" name="password" placeholder="パスワード"></input>
</div>

 <div class="a">
パスワード(確認)<input class="c" type="repassword" name="repassword" placeholder="パスワード（確認）"></input>
</div>

<div class="a">
ユーザ名<input class="d" type="text" name="name" placeholder="ユーザ名"></input>
</div>

<div class="a">
生年月日<input class="d" type="text" name="birthday" placeholder="生年月日"></input>
</div>

<div class="submit">
<input type="submit" class="button" title="登録" value="登録"></input>
</div>

<div class="return">
<p><a href=UserListServlet>戻る</a></p>
</div>
</form>
</body>
</html>