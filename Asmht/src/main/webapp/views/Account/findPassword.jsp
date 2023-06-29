<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

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
        <!-- Pills navs -->
        <ul style="width: 400px;margin: auto;" class="nav nav-pills nav-justified mb-3 " id="ex1" role="tablist">

        </ul>
        <!-- Pills navs -->

        <!-- Pills content -->
        <div class="tab-content ">
            <div  id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                <form method="post" action="/home/account/findPassword" >

                    <!-- Email input -->
                    <div  class="form-outline mb-4 mr-5 ml-5">
                        <label class="form-label" for="email">Email</label>
                        <input type="email" id="email" name="email" class="form-control" />
                    </div>


                    <!-- Submit button -->
                    <button type="submit" style="width: 200px; margin-left: auto;
                margin-right: auto;"  class="btn btn-primary btn-block mb-4  ">Submit</button>

                </form>
            </div>

        </div>
    </div>
</div>
<!-- Pills content -->
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
