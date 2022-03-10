<%-- 
    Document   : profile
    Created on : Mar 10, 2022, 1:05:29 PM
    Author     : Samuel McClatchey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Group Project - Profile</title>
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
        <table>
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Email Address</th>
                <th>Birthday</th>
                <th>Edit</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <form action="Private" method="post">
                            <input type="hidden" name="action" value="editProfile">
                            <input type="submit" value="Edit">
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
