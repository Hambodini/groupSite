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
        <link rel="stylesheet" href="main.css">
        <title>Registration Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div>
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
                <span class="userMessage">${message}</span>
                <br><br>
                <c:forEach var="error" items="${errors}">
                    <div class="errorMessage">
                        ${error}
                    </div>
                </c:forEach>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
