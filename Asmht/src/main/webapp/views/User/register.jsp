<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"/>
    <title>Login</title>
</head>

<body>
<div class="container">
    <div class="all" style="margin-top: 230px; margin-left: 250px; margin-right: 250px;">
        <ul style="width: 400px;margin: auto;" class="nav nav-pills nav-justified mb-3 " id="ex1" role="tablist">
            <li class="nav-item" role="presentation">
                <a href="#pills-login" class="nav-link active" id="tab-login" data-mdb-toggle="pill" role="tab"
                   aria-controls="pills-login" aria-selected="true">Login</a>
            </li>
            <li class="nav-item" role="presentation">
                <a href="#pills-register" class="nav-link" id="tab-register" data-mdb-toggle="pill" role="tab"
                   aria-controls="pills-register" aria-selected="false">Register</a>
            </li>
        </ul>
        <div id="pills-register" role="tabpanel" aria-labelledby="tab-register">
            <form action="/register" method="post">
                <div class="text-center mb-3">
                    <p>Sign up with:</p>
                    <button type="button" class="btn btn-link btn-floating mx-1">
                        <i class="fab fa-facebook-f"></i>
                    </button>
                    <button type="button" class="btn btn-link btn-floating mx-1">
                        <i class="fab fa-google"></i>
                    </button>
                </div>
                <p class="text-center">or:</p>
                <div class="row form-outline mb-4 mr-5 ml-5">

                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <label class="form-label" for="fullName">fullName</label>
                            <input type="text" id="fullName" name="fullName" class="form-control form-control-lg" />
                            <c:if test="${not empty param.fullName}">
                                <p class="text-danger">${param.fullName}</p>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="form-outline mb-4 mr-5 ml-5">
                    <label class="form-label" for="accountName">Account name</label>
                    <input type="text" id="accountName" name="accountName" class="form-control" />
                    <c:if test="${not empty param.accountName}">
                        <p class="text-danger">${param.accountName}</p>
                    </c:if>
                </div>
                <div class="form-outline mb-4 mr-5 ml-5">
                    <label class="form-label" for="registerEmail">Email</label>
                    <input type="email" id="registerEmail" name="email" class="form-control" />
                    <c:if test="${not empty param.email}">
                        <p class="text-danger">${param.email}</p>
                    </c:if>
                </div>
                <div class="form-outline mb-4 mr-5 ml-5">
                    <label class="form-label" for="registerPassword">Password</label>
                    <input type="password" id="registerPassword" name="password" class="form-control" />
                    <c:if test="${not empty param.password}">
                        <p class="text-danger">${param.password}</p>
                    </c:if>
                </div>
                <button style="width: 200px; margin-left: auto; margin-right: auto;" type="submit" class="btn btn-primary btn-block mb-4">Register</button>
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
