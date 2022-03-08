<%-- 
    Document   : login
    Created on : Mar 8, 2022, 2:00:37 PM
    Author     : Samuel McClatchey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Group Project - Login</title>
    </head>
    <nav>
        <ul>
            <li><a href="login.jsp">Login</a></li>
        </ul>
    </nav>
    <body>
        <h1>Login</h1>
        <form action="public" method="post">
            <input type="hidden" name="action" value="login">
            <label>Username:</label>
            <input type="text" name="username" value="${username}">
            <br><br>
            <label>Password:</label>
            <input type="text" name="password" value="${password}">
            <p style="color:red">${loginError}</p>
            <input type="submit" value="Login">
        </form>
    </body>
</html>