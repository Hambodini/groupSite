<%-- 
    Document   : profile
    Created on : Mar 10, 2022, 1:05:29 PM
    Author     : Samuel McClatchey
--%>

<%@page import="data.UserDA"%>
<%@page import="business.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User user = (User) request.getAttribute("user");
    String username = (String) session.getAttribute("loggedInUser");
    if (user == null) {
        user = UserDA.getUserByUsername(username);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Group Project - Profile</title>
        <link rel="stylesheet" href="styles.css">
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
        <h2>Your Profile</h2>
        <form action="private" method="post">
            <input type="hidden" name="action" value="updateUser">
            <label>Username: </label>
            <input type="text" name="username" value="${user.getUsername()}" readonly class="readonly"><br><br>
            <label>Password: </label>
            <input type="text" name="password" value="${user.getPassword()}"><br><br>
            <label>Email Address: </label>
            <input type="text" name="email" value="${user.getEmail()}"><br><br>
            <label>Birthday: </label>
            <input type="date" name="birthday" value="${user.getBirthday()}" readonly class="readonly"><br><br>
            <input type="submit" value="Save">
        </form>
        <form action="private" method="post">
            <input type="hidden" name="action" value="logoutUser">
            <input type="submit" value="Log Out">       
        </form>
        <p style="color:${color}">${message}</p>
    </body>
</html>
