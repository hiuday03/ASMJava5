<%--
  Created by IntelliJ IDEA.
  User: DEll
  Date: 6/13/2023
  Time: 1:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <form action="/login/add" method="POST" style="margin-top: 30px;">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" required name="username" id="username"
                       placeholder="Enter username" >
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" required name="password" id="password"
                       placeholder="Enter password" >
            </div>
            <div class="form-group">
                <label for="fullname">Fullname</label>
                <input type="text" class="form-control" required name="fullname" id="fullname"
                       placeholder="Enter fullname" >
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" required name="email" id="email"
                       placeholder="Enter email" >
            </div>

            <div class="form-group">
                <label for="admin">Admin</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="admin" id="admin" value="true" checked>
                    <label class="form-check-label" for="admin">Admin</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="admin" id="customer" value="false">
                    <label class="form-check-label" for="customer">Customer</label>
                </div>
            </div>

            <button type="submit" class="btn btn-outline-success">Submit</button>
        </form>
        <p class="text-center mt-4"><a href="/login">Exit</a></p>
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
