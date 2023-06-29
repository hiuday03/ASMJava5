<%--
  Created by IntelliJ IDEA.
  User: haih7
  Date: 6/3/2023
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>Document</title>
    <style>
        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        .pagination a {
            display: inline-block;
            padding: 8px 12px;
            border: 1px solid #ddd;
            margin-right: 5px;
            text-decoration: none;
        }

        .pagination a.active {
            background-color: #007bff;
            color: #fff;
        }

        .pagination a.disabled {
            pointer-events: none;
            color: #ddd;
        }
    </style>
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

                    <a href="/admin/categories/add" style="margin: 20px 0" class="btn  btn-outline-success">Add</a>

                    <table class="table">
                        <thead class="thead-light">
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col"><a href="/admin/categories?sort=name">Name</a></th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listCategory}" var="category" varStatus="iStat">
                            <tr>
                                <th scope="row"><c:out value="${iStat.index + 1}"/></th>
                                <td><c:out value="${category.name}"/></td>
                                <td>
                                    <a href="/admin/categories/delete/${category.id}" class="btn btn-outline-danger">Delete</a>
                                    <a style="margin-top: 5px" href="/admin/categories/update/${category.id}"
                                       class="btn btn-outline-info">Update</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagination">
                        <a href="/admin/categories?p=0&sort=${param.sort}" class="${page.first ? 'disabled' : ''}">First</a>
                        <a href="/admin/categories?p=${page.number - 1}&sort=${param.sort}" class="${page.first ? 'disabled' : ''}">Previous</a>

                        <c:forEach begin="0" end="${page.totalPages - 1}" var="i">
                            <a href="/admin/categories?p=${i}&sort=${param.sort}" class="${i == page.number ? 'active' : ''}">${i + 1}</a>
                        </c:forEach>

                        <a href="/admin/categories?p=${page.number + 1}&sort=${param.sort}" class="${page.last ? 'disabled' : ''}">Next</a>
                        <a href="/admin/categories?p=${page.totalPages - 1}&sort=${param.sort}" class="${page.last ? 'disabled' : ''}">Last</a>
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

<script>
    document.querySelectorAll('.pagination a').forEach(function(element) {
        element.addEventListener('click', function(event) {
            event.preventDefault();
            var url = this.getAttribute('href');
            window.location.href = url;
        });
    });
</script>
</body>
</html>
