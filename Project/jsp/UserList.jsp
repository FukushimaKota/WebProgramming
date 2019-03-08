<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Controller.UserListServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="Mock/CSS/userlist.css">
<title>ユーザ一覧</title>

</head>

<body>
	<div class="logout">
		<h1 class="size">${userInfo.name}さん
			<a class="logout2" href="LogoutServlet">ログアウト</a>
		</h1>
	</div>
	<form action="UserListServlet" method="post">
		<div class=title>
			<h1>ユーザ一覧</h1>
		</div>

		<div class="newuser">
			<a href=NewUserServlet>新規登録</a>
		</div>

		<div class="ID">
			<label for="ID"></label>
			<p class="form">ログインID</p>
			<input type="text" name="LoginId" placeholder="ログインID"></input>
		</div>

		<div class="name">
			<label for="user_name"></label>
			<p class="form1">ユーザ名</p>
			<input type="text" name="name" placeholder="ユーザ名"></input>
		</div>

		<p class="form">生年月日</p>
		<div class="day">
			<label for=day1></label> <input
				type="text" name="birthday" placeholder="年/月/日"></input>

			<nobr>〜</nobr>

			<label for="day2"></label> <input type="text" name="birthday2" placeholder="年/月/日"></input>
		</div>

	</form>
	<table class="table table-bordered">
		<thead class="thead-light">
			<tr>
				<th scope="col">ログインID</th>
				<th scope="col">ユーザ名</th>
				<th scope="col">生年月日</th>
				<th scope="col"></th>
			</tr>
		<!-- 複数人のデータを出す。for文？ -->
 <c:forEach var="user" items="${userList}">
			<tbody>
				<tr>
				<!-- <td>1000</td>
				<td>田中</td>
				<td>1000-10-10</td> -->
					<td>${user.loginId}</td>
					<td>${user.name}</td>
					<td>${user.birthDate}</td>

					<td>
						<!-- loginidのデータを元に操作 -->
						<!--  <a href="UserDataServlet"class="btn btn-primary">詳細</a>
						 <a href="UpdateServlet"class="btn btn-success">更新</a>
						<a href="DeleteServlet"class="btn btn-danger">削除</a> -->

					<a href="UserDataServlet?id=${user.id}" class="btn btn-primary">詳細</a>
			     	<a href="UpdateServlet?id=${user.id}" class="btn btn-success">更新</a>
			      	<a href="DeleteServlet?id=${user.id}" class="btn btn-danger">削除</a>

					</td>
			</tbody>
		</c:forEach>
	</table>
</body>
</html>
