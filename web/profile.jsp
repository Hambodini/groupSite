<%-- 
    Document   : profile
    Created on : Mar 10, 2022, 1:05:29 PM
    Author     : Samuel McClatchey
--%>

<%@page import="data.UserDA"%>
<%@page import="business.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="main.css">
        <title>Group Project - Profile</title>
        <link rel="stylesheet" href="main.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div>
            <h2>Your Profile</h2>
            <form action="private" method="post">
                <input type="hidden" name="action" value="updateUser">
                <label>Username: </label>
                <input type="text" name="username" value="${user.username}" readonly class="readonly"><br><br>
                <label>Password: </label>
                <input type="text" name="password" value="${user.password}" <c:if test="${sessionScope.loggedInUser != user.username}">readonly class="readonly"</c:if>><br><br>
                    <label>Email Address: </label>
                    <input type="text" name="email" value="${user.email}" <c:if test="${sessionScope.loggedInUser != user.username}">readonly class="readonly"</c:if>><br><br>
                    <label>Birthday: </label>
                    <input type="date" name="birthday" value="${user.birthday}" readonly class="readonly"><br><br>
                <input type="submit" value="Save">
                <span style="color:${color}">${message}</span>
            </form><br>

            <h2>Post to your profile</h2>
            <form action="private" method="post">
                <input type="hidden" name="action" value="postToProfile">
                <label>Your Post: </label><br>
                <textarea id="postTextId" name="profilePostText" rows="4" cols="50">Your Post goes here!</textarea>
                <input type="submit" value="Post">
            </form><br>

            <form action="private" method="post">
                <input type="hidden" name="action" value="logoutUser">
                <br>
                <input type="submit" value="Log Out">       
            </form>
            <br>
            <c:forEach var="error" items="${errors}">
                <div class="errorMessage">
                    ${error}
                </div>
            </c:forEach>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
