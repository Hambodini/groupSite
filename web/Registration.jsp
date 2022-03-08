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
        <title>Registration Page</title>
    </head>
    <body>
        <h1>Register for the Social Media Fun Site</h1>
        <form action="Controller" method="post">
            <input type="hidden" name="action" value="registerPerson">
            <label>Username:</label>
            <input type="text" name="username" value="">
            <br>
            <label>Email:</label>
            <input type="text" name="email" value="">
            <br>
            <label>Password:</label>
            <input type="text" name="password" value="">
            <br>
            <label>Birthday:</label>
            <input type="date" name="birthday">
            <input type="submit" value="Register">
        </form>
    </body>
</html>
