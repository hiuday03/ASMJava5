<%--
  Created by IntelliJ IDEA.
  User: haih7
  Date: 6/3/2023
  Time: 1:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg navbar-light" style="padding: 18px; background-color: rgb(110 150 193 / 25%); margin-bottom: 36px">
        <div class="container-fluid">

            <div class="collapse navbar-collapse" id="">
                <a  class="btn btn-outline-success my-2 my-sm-0" href="/admin" >Admin</a>
                <a  class="btn btn-outline-danger my-2 my-sm-0 " href="/logout">LogOut</a>
                <ul class="navbar-nav ml-auto">
                    <%--                        <li class="nav-item">--%>
                    <%--                            <a class="nav-link" href="/logout">Logout</a>--%>
                    <%--                        </li>--%>
                    <%--                        <li class="nav-item">--%>
                    <%--                            <a class="nav-link" href="/login">Login</a>--%>
                    <%--                        </li>--%>
                    <%--                        <li class="nav-item">--%>
                    <%--                            <a class="nav-link" href="/register">Register</a>--%>
                    <%--                        </li>--%>

                    <li class="nav-item">
                        <a class="nav-link" href="/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="/home/cart" class="rounded py-1 px-3 nav-link d-flex align-items-center">
                            <i class="m-1 me-md-2"></i>
                            <p class="d-none d-md-block mb-0">My cart</p>
                        </a>
                    </li>



<%--                    <li class="nav-item">--%>
<%--                        <form class="form-inline my-2 my-lg-0">--%>
<%--                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--                        </form>--%>
<%--                    </li>--%>
                </ul>
            </div>
        </div>
    </nav>
</header>


<div class="container">
    <div class="row gy-3">
        <!-- Left elements -->
        <div class="col-lg-3">
            <!-- Collapsible wrapper -->
            <h2>ADMIN</h2><br><br>
            <a class="btn btn-outline-info my-2 my-sm-0" style="font-size: 20px; width: 120px;" href="/admin/categories">Categories</a><br><br>
            <a class="btn btn-outline-info my-2 my-sm-0" style="font-size: 20px; width: 120px;" href="/admin/products">Products</a><br><br>
            <a class="btn btn-outline-info my-2 my-sm-0" style="font-size: 20px; width: 120px;" href="/admin/accounts">Accounts</a><br><br>
            <a class="btn btn-outline-info my-2 my-sm-0" style="font-size: 20px; width: 120px;" href="/admin/orders">Orders</a><br><br>
        </div>

        <div class="col-lg-9">
            <div class="row">
                <!-- Pagination -->
                <div class="container">
                    <h2 style="text-align: center">Categories</h2>
                    <div class="row">
                        <div class="col-sm-4">
                            <form action="/admin/categories/add" method="post">
                                <input type="hidden" name="id" value="${category.id}">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" required name="name" id="name"
                                           placeholder="Enter name" value="${category.name}">
                                </div>
                                <button type="submit" class="btn btn-outline-success">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<footer class="text-center text-lg-start bg-light text-muted">
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
        <div>
            © Name:
            <a class="text-reset fw-bold" href="#">hieugvph24880</a>
        </div>
        <div>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-google"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-linkedin"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-github"></i>
            </a>
        </div>
    </section>
</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
