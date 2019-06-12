<%-- 
    Document   : crawl
    Created on : Jun 12, 2019, 1:01:24 PM
    Author     : nguyenhongphat0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Crawl data</h1>
        <form action="InsertSAXController" method="POST">
            <input type="submit" value="Crawl" name="action" />
        </form>
    </body>
</html>
