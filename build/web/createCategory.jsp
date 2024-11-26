<%-- 
    Document   : createCategory
    Created on : Nov 26, 2024, 9:57:06 AM
    Author     : nguye
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Category</title>
         <style>
            .form-container {
                width: 50%;
                margin: auto;
            }
            .form-container form {
                display: flex;
                flex-direction: column;
            }
            .form-container label, .form-container input, .form-container textarea {
                margin: 10px 0;
            }
        </style>
    </head>
    <body>
         <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div class="form-container">
            <h1>Create Category</h1>
            <form action="CreateCategoryController" method="POST">
                CategoryName: <input type="text" name="CategoryName" required><br>
                Images: <input type="text" name="Images" required><br>
                <input type="submit" value="Create Category">
            </form>
            <a href="welcome.jsp">Back to Dashboard</a>

        </div>
    </body>
</html>
