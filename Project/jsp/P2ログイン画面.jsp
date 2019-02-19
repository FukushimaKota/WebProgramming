<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="../CSS/style.css">
<title>ユーザ一覧</title>

<div class=logout2>
<imput type="button" class=logout >ログアウト</imput>
</div>

</head>
<h1 class=title>ユーザ一覧</h1>
<div class=right>
<button class=Newuser type="button" class=logout >新規登録</button>
</div>
<body>
<form action="/Example/Part1.jsp" method="post">
ログインID<input type="text" name="id" ><br>
パスワード<input type="password" name="password"><br>
生年月日<input ><br>

<input type="submit" value="検索">
</form>

<table class="table table-bordered">
  <thead class="thead-light">
    <tr>
      <th scope="col">ログインID</th>
      <th scope="col">ユーザ名</th>
      <th scope="col">生年月日</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>id0001</td>
      <td>田中太郎</td>
      <td>1989年04月26日</td>
      <td><button type="button" class="btn btn-primary">詳細</button><button type="button" class="btn btn-success">更新</button><button type="button" class="btn btn-danger">削除</button></td>

    </tr>
    <tr>
      <td>id0002</td>
      <td>佐藤二郎</td>
      <td>2001年11月12日</td>
      <td><button type="button" class="btn btn-primary">詳細</button><button type="button" class="btn btn-success">更新</button><button type="button" class="btn btn-danger">削除</button></td>
    </tr>
    <tr>
      <td>id0003</td>
      <td>佐川真司</td>
      <td>2000年01年01日</td>
      <td><button type="button" class="btn btn-primary">詳細</button><button type="button" class="btn btn-success">更新</button><button type="button" class="btn btn-danger">削除</button></td>
    </tr>
  </tbody>
</table>
</body>
</html>



<!-- 生年月日
ログアウトが右 -->