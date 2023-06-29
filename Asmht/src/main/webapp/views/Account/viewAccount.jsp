<%--
  Created by IntelliJ IDEA.
  User: haih7
  Date: 6/3/2023
  Time: 1:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
          crossorigin="anonymous">
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
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-sm-4">
                <form action="/home/accounts/add" method="post" modelAttribute="account">
                    <input type="hidden" name="username" value="${account.username}"/>

                    <div class="form-group">
                        <label for="fullname">Full name</label>
                        <input type="text" class="form-control" required name="fullname" id="fullname"
                               value="${account.fullname}" placeholder="Enter full name">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" required name="email" id="email"
                               value="${account.email}" placeholder="Enter email">
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="password">Pass word</label>--%>
<%--                        <input type="password" class="form-control" required name="password" id="password"--%>
<%--                               value="${account.password}" placeholder="Enter password">--%>
<%--                    </div>--%>
                    <div class="form-group">
                        <label for="photo">Photo</label>
                        <input type="text" class="form-control" required name="photo" id="photo"
                               value="${account.photo}" placeholder="Enter photo URL">
                    </div>


                    <%--                    <a href="<c:url value='/admin/orders/update/${order.id}'/>" class="btn btn-warning">Update</a>--%>
<%--                    <a href="<c:url value='/home/accounts/update/${account.username}'/>" class="btn btn-warning">Detail</a>--%>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>

        </div>
    </div>
</div>
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
