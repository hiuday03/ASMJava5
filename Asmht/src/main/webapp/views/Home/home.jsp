<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"/>
    <title>Document</title>

    <style>
        .icon-hover:hover {
            border-color: #3b71ca !important;
            background-color: white !important;
        }

        .icon-hover:hover i {
            color: #3b71ca !important;
        }

        .card-body p {
            font-size: 18px;
            font-weight: bold;
        }

        .card-body h5 {
            font-size: 16px;
            font-weight: normal;
        }

        .card {
            background-color: #fff;
        }

        .col-lg-3 {
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        a {
            text-decoration: none;
        }

        .navbar-nav {
            display: flex;
            align-items: center;
        }

        .navbar-nav .nav-item {
            margin-left: 10px;
            margin-right: 10px;
        }

        .navbar-nav.ml-auto {
            margin-left: auto;
        }

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
            background-color: #80aedf;
            color: #fff;
        }

        .pagination a.disabled {
            pointer-events: none;
            color: #ddd;
        }
    </style>
</head>

<body>
<!--Main Navigation-->
<header>
    <!-- Jumbotron -->

    <header>
        <nav class="navbar navbar-expand-lg navbar-light"
             style="padding: 18px; background-color: rgb(110 150 193 / 25%); margin-bottom: 36px">
            <div class="container-fluid">

                <div class="collapse navbar-collapse" id="">
                    <a class="btn btn-outline-success my-2 my-sm-0" href="/admin">Admin</a>
                    <a class="btn btn-outline-danger my-2 my-sm-0 " href="/logout">LogOut</a>
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
                                <i class=" m-1 me-md-2"></i>
                                <p class="d-none d-md-block mb-0">My cart</p>
                            </a>
                        </li>


                        <%--                        <li class="nav-item">--%>
                        <%--                            <form class="form-inline my-2 my-lg-0">--%>
                        <%--                                <input class="form-control mr-sm-2" type="search" placeholder="Search"--%>
                        <%--                                       aria-label="Search">--%>
                        <%--                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
                        <%--                            </form>--%>
                        <%--                        </li>--%>
                    </ul>
                </div>
            </div>
        </nav>
    </header>


    <div class="bg-white border-bottom" style="margin-bottom: 36px;">
        <div class="container">
            <div class="row gy-3">
                <!-- Left elements -->
                <div class="col-lg-3">
                    <!-- Collapsible wrapper -->
                    <div class="collapse d-lg-block mb-5" id="navbarSupportedContent">
                        <div class="accordion" id="accordionPanelsStayOpenExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    Category
                                </h2>
                                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show"
                                     aria-labelledby="headingOne">
                                    <div class="accordion-body">
                                        <ul class="list-unstyled">
                                            <li class="px-2 mt-4"><a href="/home" class="text-dark">All Category</a>
                                            </li>
                                        </ul>
                                        <c:forEach var="category" items="${listCategory}" varStatus="iStat">
                                            <ul class="list-unstyled">
                                                <li class="px-2 mt-2">
                                                    <a href="/home/category/${category.id}"
                                                       class="text-dark">${category.name}</a>
                                                </li>
                                            </ul>
                                        </c:forEach>

                                    </div>
                                </div>

                                <form class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search"
                                           placeholder="Search" aria-label="Search">
                                    <button class="btn btn-outline-success my-2 my-sm-0"
                                            type="submit">Search
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-9">
                    <div class="row">
                        <c:forEach var="product" items="${listProduct}" varStatus="iStat">
                            <div class="col-lg-4 col-md-6 col-sm-6 d-flex">
                                <a href="/home/productDetail/${product.id}">
                                    <div class="card w-100 my-2 shadow-2-strong">
                                        <div class="card-body d-flex flex-column text-success"
                                             style="text-align: center">
                                            <p>${product.name}</p>
                                        </div>
                                        <img style="height: 200px; width: 200px; margin: auto"
                                             src="/productImages/${product.image}" alt="${product.name}"
                                             class="card-img-top"/>
                                        <div class="card-body d-flex flex-column">
                                            <div class="" style="margin: auto;">
                                                <h5 class="mb-1 me-1 text-success">${product.price}$</h5>
                                            </div>
                                                <%--                                            <p class="card-text">${product.description}</p>--%>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>

                    <hr/>

                    <!-- Pagination -->
                    <div class="pagination">
                        <a href="/home?p=0&sort=${param.sort}"
                           class="${page.first ? 'disabled' : ''}">First</a>
                        <a href="/home?p=${page.number - 1}&sort=${param.sort}"
                           class="${page.first ? 'disabled' : ''}">Previous</a>

                        <c:forEach begin="0" end="${page.totalPages - 1}" var="i">
                            <a href="/home?p=${i}&sort=${param.sort}"
                               class="${i == page.number ? 'active' : ''}">${i + 1}</a>
                        </c:forEach>

                        <a href="/home?p=${page.number + 1}&sort=${param.sort}"
                           class="${page.last ? 'disabled' : ''}">Next</a>
                        <a href="/home?p=${page.totalPages - 1}&sort=${param.sort}"
                           class="${page.last ? 'disabled' : ''}">Last</a>
                    </div>
                </div>
                <!-- Pagination -->
            </div>

        </div>
    </div>
    </div>
    <!-- Jumbotron -->

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

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"
            integrity="sha384-0GWIhd1KEoYqx9w7OPO0LxfuBU+OzBrj6lJoONvcrw6rW+nXzyAl03bjiE3UnS2N"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-pzjw8f+ua6UYJBfX+GSA6XwG9Kk+IbwrE9msSZ6h/Jn1Ib6GG8g0K5bwH5R9M1mH"
            crossorigin="anonymous"></script>
    <!-- Scripts -->
</body>
</html>
