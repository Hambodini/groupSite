<%-- 
    Document   : users
    Created on : Mar 10, 2022, 1:05:49 PM
    Author     : Samuel McClatchey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <li><a href="index.jsp">Login</a></li>
            <li><a href="Registration.jsp">Register</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="users.jsp">All Users</a></li>
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
        <c:forEach items="${users}" var="user">
            <tr>
                <td>
                    ${user.value.email}
                </td>
                <td>
                    ${user.value.username}
                </td>
            </tr>

        </c:forEach>  
    </table>
    </body>
</html>
