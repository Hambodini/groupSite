<%-- 
    Document   : registration
    Created on : Mar 8, 2022, 1:31:09 PM
    Author     : nosam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Registration Page</title>
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
        <h2>Register for the Social Media Fun Site</h2>
        <form action="Controller" method="post">
            <input type="hidden" name="action" value="registerPerson">
            <label>Username:</label>
            <input type="text" name="username" value="">
            <br>
            <br>
            <label>Email:</label>
            <input type="text" name="email" value="">
            <br>
            <br>
            <label>Password:</label>
            <input type="text" name="password" value="">
            <br>
            <br>
            <label>Birthday:</label>
            <input type="date" name="birthday">
            <br>
            <br>
            <input type="submit" value="Register">
        </form>
    </body>
</html>
