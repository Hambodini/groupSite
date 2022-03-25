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
        <link rel="stylesheet" href="styles.css">
        <title>Group Project - Login</title>
    </head>
    <h1>Group Project</h1>
    <nav>
        <ul>
            <li><a href="index.jsp">Login</a></li>
            <li><a href="Registration.jsp">Register</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="users.jsp">All Users</a></li>
        </ul>
        <br>
    </nav>
    <body>
        <h2>Login</h2>
        <form action="public" method="post">
            <input type="hidden" name="action" value="login">
            <label>Username:</label>
            <input type="text" name="username" value="${userName}">
            <br><br>
            <label>Password:</label>
            <input type="text" name="password" value="${password}">
            <p style="color:red">${loginError}</p
            <p style="color:red">${message}</p>
            <input type="submit" value="Login">
        </form>
    </body>
</html>