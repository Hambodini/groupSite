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
                <input type="text" name="password" value="${user.password}"><br><br>
                    <label>Email Address: </label>
                    <input type="text" name="email" value="${user.email}"><br><br>
                    <label>Birthday: </label>
                    <input type="date" name="birthday" value="${user.birthday}" readonly class="readonly"><br><br>
                <input type="submit" value="Save">
                <span style="color:${color}">${message}</span>
            </form><br>
            <h2>Post to your profile</h2>
            <form action="private" method="post">
                <input type="hidden" name="action" value="postToProfile">
                <input type="hidden" name="postUsername" value="${user.username}">
                <label>Your Post: </label><br>
                <br>
                <label>Title: </label>
                <input type="text" name="postTitle"><br><br>
                <label>Body: </label>
                <textarea id="postTextId" name="profilePostText" rows="4" cols="50"></textarea>
                <p><i><small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Character limit is 1024 for posts</small></i></p>
                <input type="submit" value="Post">
            </form><br>
            <h2>Your Posts:</h2>
            <c:forEach var="post" items="${posts}">
                <div id="post">
                    <h2>${post.value.title}</h2>
                    <p> ${post.value.timeStamp}</p>
                    <p>${post.value.postText}</p>
                    <form action="private" method="post">
                        <input type="hidden" name="action" value="requestUpdate">
                        <input type="hidden" name="postId" value="${post.getKey()}">
                        <input type="hidden" name="oldTitle" value="${post.value.title}">
                        <input type="hidden" name="oldPostText" value="${post.value.postText}">
                        <input type="submit" value="Update Post">
                    </form>
                    <form action="private" method="post">
                        <input type="hidden" name="action" value="deletePost">
                        <input type="hidden" name="postId" value="${post.getKey()}">
                        <input type="submit" value="Delete Post">
                    </form>
                    <h3>Comments:</h3>
                    <c:forEach var="comment" items="${comments}">
                        <c:if test="${post.getKey() == comment.value.postId}">
                            <h4>${comment.value.username}</h4>
                            <p>${comment.value.timeStamp}</p>
                            <p>${comment.value.commentText}</p>
                            <form action="private" method="post">
                                <input type="hidden" name="action" value="deleteProfileComment">
                                <input type="hidden" name="commentId" value="${comment.getKey()}">
                                <input type="submit" value="Delete Comment">
                            </form>
                            <br><br><br>
                        </c:if>
                    </c:forEach>    
                    <form action="private" method="post">
                        <input type="hidden" name="action" value="commentPost">
                        <input type="hidden" name="postId" value="${post.getKey()}">
                        <input type="hidden" name="userName" value="${user.username}">
                        <label>Post a comment:</label><br>
                        <textarea name="profileCommentText" rows="2" cols="50"></textarea><br>
                        <input type="submit" value="Post Comment">
                    </form>
                </div>
                <br>
            </c:forEach>
            <form action="private" method="post">
                <input type="hidden" name="action" value="logoutUser">
                <br>
                <input type="submit" value="Log Out">       
            </form>
            <br>
            <c:forEach var="error" items="${errors}">
                <div class="errorMessage">
                    <c:out value="${error}" />
                </div>
            </c:forEach>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
