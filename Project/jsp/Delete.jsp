<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Mock/CSS/deleat.css">
<title>ユーザ削除</title>
</head>
<body>
<form action="DeleteServlet"method="post">

<div class="logout">
<h1 class="size">${userInfo.name}さん <a class="logout2" href="LogoutServlet">ログアウト</a></h1>
</div>

<h1 class="title">ユーザ削除確認</h1>

<div class="sentence">
<p>ログインID:${user.loginId}</p>
<p>を本当に削除してよろしいでしょうか。</p>

</div>
<div class="button">
<input type="hidden" value="${user.id}" name=id>
<a href="UserListServlet" class="btn btn-primary" role="button">キャンセル</a>
<input class="btn btn-primary" role="button" name="OK" type="submit" value="OK">
<!-- <a href="Delete2Servlet" class="btn btn-primary" role="button">OK</a> -->
</div>
</form>
</body>
</html>
