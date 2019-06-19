<%-- 
    Document   : processLogin
    Created on : Jun 19, 2019, 12:48:47 PM
    Author     : nguyenhongphat0
--%>

<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <c:import var="xml" url="WEB-INF/accountATM.xml"></c:import>
        <x:parse var="doc" doc="${xml}" scope="session"></x:parse>
        <c:set var="username" value="${param.username}" scope="session"></c:set>
        <c:set var="password" value="${param.pin}"></c:set>
        <c:if test="${not empty username and not empty password}">
            <x:if select="$doc//*[local-name()='allowed' and @username=$username and pin=$password]">
                <jsp:forward page="searchBanking.jsp"></jsp:forward>
            </x:if>
        </c:if>
        <jsp:forward page="loginFail.jsp"></jsp:forward>
    </body>
</html>
