<%-- 
    Document   : search
    Created on : Jun 3, 2019, 1:55:52 PM
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
        <h1>Welcome, ${sessionScope.USER}</h1>
        <form action="MainController" method="POST">
            Address: <input type="text" name="searchTxt" value="">
            <input type="submit" value="Search" name="action" />
        </form>
        
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.INFO}" var="dto" varStatus="counter">
                <tr>
                    <td>${counter.count}</td>
                    <td>${dto.lastname} ${dto.middlename} ${dto.firstname}</td>
                    <td>${dto.address}</td>
                    <td><input type="checkbox" name="chkStatus" value="${dto.status}"/></td>
                    <td>
                        <c:url value="MainController" var="Delete">
                            <c:param name="search" value="${param.searchTxt}"/>
                            <c:param name="id" value="${dto.id}"/>
                            <c:param name="action" value="Delete"/>
                        </c:url>
                        <a href="${Delete}">Delete</a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="insert.jsp">Insert</a>
    </body>
</html>
