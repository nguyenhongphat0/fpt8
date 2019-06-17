<%-- 
    Document   : index
    Created on : Jun 17, 2019, 1:31:01 PM
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
        <h1>Search Address</h1>
        <form action="SearchController" method="POST">
            Search value: <input type="text" name="search" value="${param.search}"><br/>
            <input type="submit" value="Search"/>
        </form>
            ${info}
        <c:if test="${requestScope.INFO != null}">
            <c:if test="${not empty requestScope.INFO}" var="checkINFO">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Sex</th>
                            <th>Address</th>
                            <th>Class</th>
                            <th>Status</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.INFO}" var="dto" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${dto.id}</td>
                            <td>${dto.lastname} ${ddto.midlename} ${dto.firstname}</td>
                            <td>${dto.sex}</td>
                            <td>${dto.address}</td>
                            <td>${dto.sclass}</td>
                            <td>${dto.status}</td>
                            <td></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </c:if>
            <c:if test="${!checkINFO}">
                
            </c:if>
        </c:if>
    </body>
</html>
