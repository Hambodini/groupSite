<%-- 
    Document   : index
    Created on : Sep 21, 2021, 1:02:53 PM
    Author     : fs148523
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Project</title>
    </head>
    <body>
        <h1>Social Media Fun Site Login!</h1>
        <h1>${message}</h1>

        <form action="private" method="post">
            <input type="hidden" name="action" value="attemptLogin">
            
            <label>user name</label>
            <input type="text" name="userName" value="">
            <br>
            
            <label>password</label>
            <input type="text" name="password" value="">
            <br>

            <input type="submit" value="submit">
        </form>
    </body>
</html>
