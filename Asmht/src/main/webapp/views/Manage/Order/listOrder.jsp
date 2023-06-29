<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>Order Management</title>

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
                    <h2 style="text-align: center">Orders</h2>
                    <%--    <a href="/admin/orders/add" style="margin: 20px 0" class="btn btn-primary">Add</a>--%>
                    <table class="table">
                        <thead class="thead-light">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">
                                Username
                            </th>
                            <th scope="col"> <a href="/admin/orders?sort=createDate">Create Date</a></th>
                            <th scope="col"> <a href="/admin/orders?sort=address">Address</a></th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${listOrder}" varStatus="status">
                            <tr>
                                <th scope="row"><c:out value="${status.index}"/></th>
                                <td><c:out value="${order.account.username}"/></td>
                                <td><c:out value="${order.createDate}"/></td>
                                <td><c:out value="${order.address}"/></td>
                                <td>
<%--                                    <a href="<c:url value='/admin/orders/delete/${order.id}'/>" class="btn btn-outline-danger">Delete</a>--%>
                                        <%--                    <a href="<c:url value='/admin/orders/update/${order.id}'/>" class="btn btn-warning">Update</a>--%>
                                    <a href="<c:url value='/admin/orders/orderDetail/${order.id}'/>" class="btn btn-outline-warning">Detail</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagination">
                        <a href="/admin/orders?p=0" class="${page.first ? 'disabled' : ''}">First</a>
                        <a href="/admin/orders?p=${page.number - 1}" class="${page.first ? 'disabled' : ''}">Previous</a>

                        <c:forEach begin="0" end="${page.totalPages - 1}" var="i">
                            <a href="/admin/orders?p=${i}" class="${i == page.number ? 'active' : ''}">${i + 1}</a>
                        </c:forEach>

                        <a href="/admin/orders?p=${page.number + 1}" class="${page.last ? 'disabled' : ''}">Next</a>
                        <a href="/admin/orders?p=${page.totalPages - 1}" class="${page.last ? 'disabled' : ''}">Last</a>
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
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
