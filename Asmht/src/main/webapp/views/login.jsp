<%--
  Created by IntelliJ IDEA.
  User: haih7
  Date: 5/27/2023
  Time: 12:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"/>
<body>
<div class="bg-login">
    <div class="login-form">
        <h3>Đăng nhập</h3>

        <form action="/login" method="POST" style="margin-top: 30px;">
            <div class="mt-3">
                <label for="username" class="mb-1">Tên tài khoản</label>
                <input name="username" type="text" class="form-control" />
            </div>
            <div class="mt-4">
                <label for="password" class="mb-1">Mật khẩu</label>
                <input name="password" type="password" class="form-control" />
            </div>
            <div class="mt-3">
                <span id="error" style="color:red">${message}</span>
            </div>
            <div style="margin-top: 35px;">
                <button type="submit" class="btn btn-primary" style="width: 100%;">Đăng nhập</button>
            </div>
        </form>
        <p class="text-center mt-4"><a href="/login/add">Đăng ký tài khoản</a></p>
    </div>
</div>

<style>
    .bg-login {
        position: relative;
        width: 100%;
        min-height: auto;
        background-position: right 0px top 0px;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        background-size: cover;
        -o-background-size: cover;
    }

    .login-form {
        border: 1px solid #DDD;
        max-width: 400px;
        padding: 20px;
        margin-top: 100px;
        margin-left: auto;
        margin-right: auto;
    }
</style>
</body>
</html>
