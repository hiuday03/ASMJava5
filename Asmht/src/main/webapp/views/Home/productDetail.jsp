<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"/>
    <title>Document</title>
    <style>
        .icon-hover:hover {
            border-color: #3b71ca !important;
            background-color: white !important;
            color: #3b71ca !important;
        }

        .icon-hover:hover i {
            color: #3b71ca !important;
        }

        .card-title {
            text-align: center;
        }

        .info {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>

<body>
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


<!-- content -->
<section class="py-5">
    <div class="container">
        <div class="row gx-5">
            <aside class="col-lg-6">
                <div class="border rounded-4 mb-3 d-flex justify-content-center">
                    <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image"
                       href="">
                        <img style="max-width: 100%; max-height: 100vh; margin: auto" class="rounded-4 fit"
                             src="/productImages/${product.image}"
                             alt="${product.name}">
                        <img style="height: 100px; width: 100px; margin: auto"
                             src="/productImages/${product.image}" alt="${product.name}"
                             class="card-img-top"/>
                        <img style="height: 100px; width: 100px; margin: auto"
                             src="/productImages/${product.image}" alt="${product.name}"
                             class="card-img-top"/>
                        <img style="height: 100px; width: 100px; margin: auto"
                             src="/productImages/${product.image}" alt="${product.name}"
                             class="card-img-top"/>
                        <img style="height: 100px; width: 100px; margin: auto"
                             src="/productImages/${product.image}" alt="${product.name}"
                             class="card-img-top"/>
                        <img style="height: 100px; width: 100px; margin: auto"
                             src="/productImages/${product.image}" alt="${product.name}"
                             class="card-img-top"/>
                    </a>
                </div>
            </aside>
            <main class="col-lg-6">
                <div class="ps-lg-3">
                    <h3 class="title text-dark">${product.name}</h3>
                    <div class="mb-3">
                        <span class="h5">${product.price}</span>
                    </div>
                    <hr/>
                    <div class="row mb-4">
                        <div class="col-md-4 col-6">
                            <label class="mb-2">Caching</label>
                            <select class="form-select border border-secondary" style="height: 35px">
                                <option>32GB</option>
                                <option>64GB</option>
                                <option>128GB</option>
                                <option>256GB</option>
                                <option>512GB</option>
                                <option>1T</option>
                                <option>2T</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-4 col-6">
                            <label class="mb-2">Color</label>
                            <select class="form-select border border-secondary" style="height: 35px">
                                <option>White</option>
                                <option>Black</option>
                                <option>Purple</option>
                                <option>Blue</option>
                                <option>Red</option>
                                <option>Yellow</option>
                                <option>Gold</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-4 col-6">
                            <label class="mb-2">Accessory</label>
                            <div class="form-check form-check-inline mb-0">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">Aarphone
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">Charge
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" >Phone case
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option4" >Sim stick
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5" >Phone tempered glass
                            </div>
                        </div>
                    </div>
                    <a class="btn btn-outline-info shadow-0" href="/cart/add/${product.id}">
                        <i class="me-1 fa fa-shopping-basket"></i> Add to cart
                    </a>
                    <div class="row mb-2">
                        <table class="table border mt-3 mb-2">
                            <tr>
                                <th class="py-2">Display:</th>
                                <td class="py-2">
                                    13.3-inch LED-backlit display with IPS
                                </td>
                            </tr>
                            <tr>
                                <th class="py-2">Processor capacity:</th>
                                <td class="py-2">2.3GHz dual-core Intel Core i5</td>
                            </tr>
                            <tr>
                                <th class="py-2">Camera quality:</th>
                                <td class="py-2">720p FaceTime HD camera</td>
                            </tr>
                            <tr>
                                <th class="py-2">Memory</th>
                                <td class="py-2">8 GB RAM or 16 GB RAM</td>
                            </tr>
                            <tr>
                                <th class="py-2">Graphics</th>
                                <td class="py-2">Intel Iris Plus Graphics 640</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>
</section>


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

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>