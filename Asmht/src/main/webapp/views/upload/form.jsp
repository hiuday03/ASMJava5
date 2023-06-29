<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<form action="/poly/upload" method="POST" enctype="multipart/form-data">
    <input name="fullname" placeholder="Please input your fullname ?"> <br>
    <input name="photo" type ="file">
    <button>Upload</button>
</form>
</body>
</html>