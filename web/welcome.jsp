<%-- 
    Document   : welcome
    Created on : May 10, 2024, 8:19:30 AM
    Author     : Luu Minh Quan
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <h1><%= loginUser.getFullname()%></h1>
        <form action="LogoutController" method="POST">
            <input type="submit" value="Logout" >
        </form>
    </body>
</html>
