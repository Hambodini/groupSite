<%-- 
    Document   : login
    Created on : Mar 8, 2022, 2:00:37 PM
    Author     : Samuel McClatchey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="main.css">
        <title>Group Project - Login</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div>
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
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>