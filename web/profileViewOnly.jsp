<%-- 
    Document   : profile
    Created on : Mar 10, 2022, 1:05:29 PM
    Author     : Samuel McClatchey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="main.css">
        <title>Group Project - Profile</title>
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
                <input type="text" name="password" value="${user.password}" readonly class="readonly"><br><br>
                <label>Email Address: </label>
                <input type="text" name="email" value="${user.email}" readonly class="readonly"><br><br>
                <label>Birthday: </label>
                <input type="date" name="birthday" value="${user.birthday}" readonly class="readonly"><br><br>
            </form><br>
            <c:forEach var="error" items="${errors}">
                <div class="errorMessage">
                    ${error}
                </div>
            </c:forEach>
            <%--posts down here!!! --%>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
