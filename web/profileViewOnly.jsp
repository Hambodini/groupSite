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
            <h2>${otherUser.username}'s Profile</h2>
            <form action="private" method="post">
                <input type="hidden" name="action" value="updateUser">
                <label>Username: </label>
                <input type="text" name="username" value="${otherUser.username}" readonly class="readonly"><br><br>
                <label>Email Address: </label>
                <input type="text" name="email" value="${otherUser.email}" readonly class="readonly"><br><br>
                <label>Birthday: </label>
                <input type="date" name="birthday" value="${otherUser.birthday}" readonly class="readonly"><br><br>
            </form><br>
            <h2>${otherUser.username}'s Posts:</h2>
            <c:forEach var="post" items="${posts}">
                <div id="post">
                <h2>${post.value.title}</h2>
                <p> ${post.value.timeStamp}</p><br>
                <p>${post.value.postText}</p>

                <h3>Comments:</h3>
                <c:forEach var="comment" items="${comments}">
                    <c:if test="${post.getKey() == comment.value.postId}">
                        <h4>${comment.value.username}</h4>
                        <p>${comment.value.timeStamp}</p>
                        <p>${comment.value.commentText}</p>
                        <c:if test="${commentUserId == comment.value.userId}">
                            <form action="private" method="post">
                                <input type="hidden" name="action" value="deleteCommentViewOnly">
                                <input type="hidden" name="otherUsername" value="${usernameVO}">
                                <input type="hidden" name="commentId" value="${comment.getKey()}">
                                <input type="submit" value="Delete Comment">
                            </form>
                        </c:if>
                        <br><br><br>
                    </c:if>
                </c:forEach> 

                <form action="private" method="post">
                    <input type="hidden" name="action" value="commentAllUserPost">
                    <input type="hidden" name="postId" value="${post.getKey()}">
                    <input type="hidden" name="userName" value="${user.username}">
                    <input type="hidden" name="usernameVO" value="${usernameVO}">
                    <label>Post a comment:</label><br>
                    <textarea name="allUserCommentText" rows="2" cols="50"></textarea><br>
                    <input type="submit" value="Post Comment">
                </form>
                </div>
                <br>
            </c:forEach>

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
