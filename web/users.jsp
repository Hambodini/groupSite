<%-- 
    Document   : users
    Created on : Mar 10, 2022, 1:05:49 PM
    Author     : Samuel McClatchey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="main.css">
        <title>Group Project - All Users</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div>
            <h2>All Users</h2>
            <ol>
                <c:forEach items="${errors}" var="error">
                    <li><c:out value="${error.key}: ${error.value}" /></li>
                </c:forEach>
            </ol>
            <table>
                <tr>
                    <th>Email</th>
                    <th>Username</th>
                </tr>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>
                            ${user.value.email}
                        </td>
                        <td>
                            ${user.value.username}
                        </td>
                        <td>
                            <form action="private" method="post">
                                <input type="hidden" name="action" value="viewOtherPersonsProfile">
                                <input type="hidden" name="username" value="${user.value.username}">
                                <input type="submit" value="View Profile">
                            </form>
                        </td>
                    </tr>
                </c:forEach>  
            </table>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
