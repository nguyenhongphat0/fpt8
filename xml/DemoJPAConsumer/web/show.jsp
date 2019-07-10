<%-- 
    Document   : show
    Created on : Jul 10, 2019, 1:02:59 PM
    Author     : nguyenhongphat0
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Show</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Link</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.INFO}" var="dto" varStatus="counter">
                    <tr>
                        <td>${counter.count}</td>
                        <td>${dto.name}</td>
                        <td>${dto.price}</td>
                        <td>${dto.link}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
