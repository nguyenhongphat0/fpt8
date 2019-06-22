<%-- 
    Document   : searchDB
    Created on : Jun 21, 2019, 12:45:10 PM
    Author     : nguyenhongphat0
--%>

<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="SearchDBController">
            Fullname: <input type="text" name="fullname"/>
            <input type="submit" value="Search"/>
        </form>
        <c:set var="doc" value="${requestScope.DOC}"></c:set>
        <c:if test="${not empty doc}">
            <x:set var="listUser" select="$doc//account[fullname!='']"></x:set>
            <x:if select="$listUser">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Fullname</th>
                        </tr>
                    </thead>
                    <tbody>
                        <x:forEach var="user" select="$listUser" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td><x:out select="$user/username"></x:out></td>
                                <td><x:out select="$user/email"></x:out></td>
                                <td><x:out select="$user/fullname"></x:out></td>
                            </tr>
                        </x:forEach>
                    </tbody>
                </table>

            </x:if>
        </c:if>
    </body>
</html>
