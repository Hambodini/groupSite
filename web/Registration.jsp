<%-- 
    Document   : registration
    Created on : Mar 8, 2022, 1:31:09 PM
    Author     : nosam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Registration Page</title>
    </head>
    <h1>Group Project</h1>
    <nav>
        <ul>
            <c:if test="${sessionScope.loggedInUser != null}">
                <li><a href="private?action=profile">Profile</a></li>
                <li><a href="private?action=allUsers">All Users</a></li>
            </c:if>
            <li><a href="public?action=login">Login</a></li>
            <li><a href="public?action=goToRegistration">Register</a></li>
        </ul>
        <br>
    </nav>
    <body>
        <h2>Register for the Social Media Fun Site</h2>
        <form action="public" method="post">
            <input type="hidden" name="action" value="registerPerson">
            <label>Username:</label>
            <input type="text" name="username" value="${userName}">
            <br>
            <br>
            <label>Email:</label>
            <input type="text" name="email" value="${email}">
            <br>
            <br>
            <label>Password:</label>
            <input type="text" name="password" value="${password}">
            <br>
            <br>
            <label>Birthday:</label>
            <input type="date" name="birthday" value="${birthDay}">
            <br>
            <br>
            <input type="submit" value="Register">
            <c:forEach var="error" items="${errors}">
                <div>
                    ${error}
                </div>
            </c:forEach>
            <div>
                ${message}
            </div>
        </form>
    </body>
</html>
