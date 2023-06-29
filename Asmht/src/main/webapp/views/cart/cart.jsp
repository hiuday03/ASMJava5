<%--
  Created by IntelliJ IDEA.
  User: haih7
  Date: 5/31/2023
  Time: 1:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <!-- Add your CSS and JavaScript includes here -->
    <style>
        .icon-hover-primary:hover {
            border-color: #3b71ca !important;
            background-color: white !important;
        }

        .icon-hover-primary:hover i {
            color: #3b71ca !important;
        }
        .icon-hover-danger:hover {
            border-color: #dc4c64 !important;
            background-color: white !important;
        }

        .icon-hover-danger:hover i {
            color: #dc4c64 !important;
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

<section class="bg-light my-5">
    <div class="container">
        <div class="row">
            <!-- cart -->
            <div class="col-lg-9">
                <div class="card border shadow-0">
                    <div class="m-4">
                        <h4 class="card-title mb-4">Your cart</h4>
                        <c:forEach var="item" items="${cart.items}">
                        <form action="/cart/update/${item.id}" method="post">
                            <div class="row gy-3 mb-4">
                                <div class="col-lg-5">
                                    <div class="me-lg-5">
                                        <div class="d-flex">
                                             <img  src="/productImages/${product.image}"
                                                     alt="${product.name}" class="border rounded me-3" style="width: 96px; height: 96px;" />
                                            <div>
                                                <h3 href="#" class="nav-link">${item.name}</h3>
                                                <p class="text-muted ml-3">${item.price}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap mt-2">
                                    <div>
                                        <input type="number" min="1" name="qty" value="${item.qty}"
                                               onblur="this.form.submit()" style="width:50px;">
                                    </div>
                                    <div class="ml-3">
                                        <text class="h6">${item.price * item.qty}</text><br />
                                    </div>
                                </div>
                                <div class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2 mt-2">
                                    <div class="float-md-end">
                                        <a href="/cart/remove/${item.id}" class="btn btn-light border text-danger icon-hover-danger mr-5"> Remove</a>
                                    </div>
                                </div>

                           </div>
                        </form>
                        </c:forEach>
                    </div>

                    <div class="border-top pt-4 mx-4 mb-4">
                        <p><i class="text-muted"></i> Free Ship</p>

                    </div>

                    <div class="float-md-end">
                        <a href="/cart/clear" class="btn btn-outline-danger mr-5"> Clear Cart</a>
                        <a href="/home" class="btn btn-outline-info  mr-5">Add To Cart</a>
                    </div>
                    <div class="mt-3">
                    </div>
                </div>
            </div>


            <!-- cart -->
            <!-- summary -->
            <div class="col-lg-3">
<%--                <div class="card mb-3 border shadow-0">--%>
<%--                    <div class="card-body">--%>
<%--                        <form>--%>
<%--                            <div class="form-group">--%>
<%--                                <label class="form-label">Have coupon?</label>--%>
<%--                                <div class="input-group">--%>
<%--                                    <input type="text" class="form-control border" name="" placeholder="Coupon code" />--%>
<%--                                    <button class="btn btn-light border">Apply</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="card shadow-0 border">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <p class="mb-2">total payment:</p>
                             <p class="mb-2">${totalPrice}</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p class="mb-2">Discount:</p>
                            <p class="mb-2 text-success"></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p class="mb-2"></p>
                            <p class="mb-2"></p>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between">
                            <p class="mb-2">Total price:</p>
                            <p class="mb-2 fw-bold">00.00</p>
                        </div>
                        <c:if test="${totalPrice > 0}">
                            <div class="mt-3">
                                <a href="/checkout/add" class="btn btn-success w-100 shadow-0 mb-2">Check out</a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- summary -->
        </div>
    </div>
</section>
<%--<a href="/cart/clear">Clear Cart</a>--%>
<%--<a href="/item/index">Add more</a>--%>
<%--<a href="/cart/add/${item.id}">Add To Cart</a>--%>
<%--<form action="/cart/update/${item.id}" method="post">--%>
<%--    <a href="/cart/remove/${item.id}">Remove</a>--%>
<%--    <a href="/cart/clear">Clear Cart</a>--%>
<%--</form>--%>

<!-- Footer -->
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
<!-- Footer -->



<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>