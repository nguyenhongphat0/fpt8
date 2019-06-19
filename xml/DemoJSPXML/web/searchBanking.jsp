<%-- 
    Document   : searchBanking
    Created on : Jun 19, 2019, 1:00:11 PM
    Author     : nguyenhongphat0
--%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <x:set var="currentAccount" select="$doc//*[@username=$username]"></x:set>
        <font color="red">
            <h1>Welcome, <x:out select="$currentAccount/fullname"></x:out></h1>
        </font>
        Your balance is <x:out select="$currentAccount/@balance" />
        <h1>Transaction List</h1>
        <form action="searchBanking.jsp">
            From Date <input type="text" name="fromdate" value="${param.fromdate}"> (yyyy/mm/dd)<br/>
            To Date <input type="text" name="todate" value="${param.todate}"> (yyyy/mm/dd)<br/>
            <input type="submit" value="List"/>
        </form>
            <c:set var="fromDate" value="${param.fromdate}"></c:set>
            <c:set var="toDate" value="${param.todate}"></c:set>
            
            <c:set var="fromDate" value="${fn:replace(fromDate, '/', '')}"></c:set>
            <c:set var="toDate" value="${fn:replace(toDate, '/', '')}"></c:set>
            
            <x:set var="transaction" select="$currentAccount//transaction[translate(date, '/', '')>=$fromDate and translate(date, '/', '')<=$toDate]"></x:set>
            <x:if select="$transaction">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <x:forEach var="trans" select="$transaction" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td><x:out select="$trans/date"></x:out></td>
                                <td><x:out select="$trans/amount"></x:out></td>
                                <td>
                                    <x:choose >
                                        <x:when select="$trans[type=0]">Withdraw</x:when>
                                        <x:when select="$trans[type=1]">Deposit</x:when>
                                        <x:when select="$trans[type=2]">Transfer</x:when>
                                        <x:otherwise>Your account is hacked</x:otherwise>
                                    </x:choose>
                                </td>
                            </tr>
                        </x:forEach>
                    </tbody>
                </table>

            </x:if>
    </body>
</html>
