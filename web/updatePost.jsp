<%-- 
    Document   : updatePost
    Created on : Apr 21, 2022, 12:39:17 PM
    Author     : nosam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="main.css">
        <title>Update Post</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        
        <h1>Update Post:</h1>
        
        <form action="private" method="post">
                <input type="hidden" name="action" value="updatePost">
                <input type="hidden" name="postIdString" value="${postIdString}">
                <label>Your Post: </label><br>
                <label>Title: </label>
                <input type="text" name="newPostTitle" value="${oldTitle}"><br>
                <label>Body: </label>
                <textarea id="postTextId" name="newPostText" rows="4" cols="50">${oldPostText}</textarea>
                <p><i><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Character limit is 1024 for posts</small></i></p>
                <input type="submit" value="Update">
            </form><br>
        
    </body>
</html>
