<%-- 
    Document   : users
    Created on : Mar 10, 2022, 1:05:49 PM
    Author     : Samuel McClatchey
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="data.UserDA"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="business.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    LinkedHashMap<Integer, User> users = null;
    try {
        users = UserDA.selectAll();
    } catch (SQLException ex) {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Group Project - All Users</title>
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
        <h2>All Users</h2>

        <ol>
            <c:forEach items="${errors}" var="error">
                <li>${error.key}: ${error.value}</li>
            </c:forEach>
        </ol>

        <table>

            <tr>
                <th>
                    Email
                </th>
                <th>
                    Username
                </th>

            </tr>
            <c:if test="${sessionScope.loggedInUser != null}">
                <c:forEach items="${users}" var="person">
                    <tr>
                        <td>
                            ${person.value.email}
                        </td>
                        <td>
                            ${person.value.username}
                        </td>
                    </tr>

                </c:forEach>  
            </c:if>
        </table>
    </body>
</html>
