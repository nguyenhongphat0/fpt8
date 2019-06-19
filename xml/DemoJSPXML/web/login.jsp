<%-- 
    Document   : login
    Created on : Jun 19, 2019, 12:41:09 PM
    Author     : nguyenhongphat0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Welcome to e-Hell Bank</h1>
        <form action="processLogin.jsp" method="POST">
            Username: <input type="text" name="username"/><br/>
            PIN: <input type="password" name="pin"/><br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
