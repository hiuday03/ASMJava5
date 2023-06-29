<%--
  Created by IntelliJ IDEA.
  User: haih7
  Date: 5/31/2023
  Time: 1:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <ul>
        <c:forEach var="item" items="${items}">
            <li>
                    ${item.name} (${item.price}) ::
                [<a href="/cart/add/${item.id}">Add To Cart</a>]
            </li>
        </c:forEach>
    </ul>
</head>
<body>

</body>
</html>
