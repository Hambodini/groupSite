<%-- 
    Document   : header
    Created on : Apr 14, 2022, 9:02:43 PM
    Author     : hambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="main.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="title">
            <h1>Group Project</h1>
        </div>
        <div id="nav">
            <ul>
                <c:if test="${sessionScope.loggedInUser != null}">
                    <li><a href="private?action=profile">Profile</a></li>
                    <li><a href="private?action=allUsers">All Users</a></li>
                </c:if>
                <li><a href="public?action=login">Login</a></li>
                <li><a href="public?action=goToRegistration">Register</a></li>
            </ul>
            <br>
        </div>
    </body>
</html>

