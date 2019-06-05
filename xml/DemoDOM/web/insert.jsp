<%-- 
    Document   : insert
    Created on : Jun 5, 2019, 1:30:13 PM
    Author     : nguyenhongphat0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert</title>
    </head>
    <body>
        <h1>Register Account</h1>
        <form action="MainController" method="POST">
            ID: <input type="text" name="id"><br/>
            Class: <input type="text" name="class"><br/>
            Firstname: <input type="text" name="firstname"><br/>
            Lastname: <input type="text" name="lastname"><br/>
            Middlename: <input type="text" name="middlename"><br/>
            Address: <input type="text" name="address"><br/>
            Status: <select name="status">
                <option value="studying">Studying</option>
                <option value="break">Break</option>
                <option value="dropout">Drop out</option>
            </select>
            Password: <input type="text" name="password"><br/>
            <input type="submit" name="action" value="Register"><br/>
        </form>
    </body>
</html>
