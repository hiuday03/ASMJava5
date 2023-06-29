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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="../static/images/logo.png" width="auto" height="40" class="d-inline-block align-top" alt=""/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto"></ul>
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/home">Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row gy-3">
    <div class="col-lg-3">
        <!-- Toggle button -->
        <button class="btn btn-outline-secondary mb-3 w-100 d-lg-none" type="button"
                data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span>Show filter</span>
        </button>
        <!-- Collapsible wrapper -->
        <div class="collapse d-lg-block mb-5" id="navbarSupportedContent">
            <div class="accordion" id="accordionPanelsStayOpenExample">
                <div class="accordion-item">

                    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show"
                         aria-labelledby="headingOne">
                        <div class="accordion-body">
                            <ul class="list-unstyled">
                                <li class="px-2 mt-4"><a href="/home/viewAccountOrder" class="text-dark">Order</a>
                                </li>
                                <li class="px-2 mt-4"><a href="/home/viewAccount" class="text-dark">Account Management</a>
                                </li>
                                <li class="px-2 mt-4"><a href="/home/account/changePassword" class="text-dark">Change Password</a>
                                </li>
                            </ul>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-9">
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

                    <a href="<c:url value='/home/order/delete/${order.id}'/>" class="btn btn-danger">Delete</a>
                        <%--                    <a href="<c:url value='/admin/orders/update/${order.id}'/>" class="btn btn-warning">Update</a>--%>
                    <a href="<c:url value='/admin/orders/orderDetail/${order.id}'/>" class="btn btn-warning">Detail</a>
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
