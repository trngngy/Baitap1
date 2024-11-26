<%-- 
    Document   : welcome
    Created on : May 10, 2024, 8:19:30 AM
    Author     : Luu Minh Quan
--%>

<%@page import="java.util.List"%>
<%@page import="sample.category.CategoryDAO"%>
<%@page import="sample.category.CategoryDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f2f2f2;
            }
            .actions {
                white-space: nowrap;
            }
            .actions a {
                margin-right: 10px;
                color: #007bff;
                text-decoration: none;
            }
            .actions a:hover {
                text-decoration: underline;
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
        <h1><%= loginUser.getFullname()%></h1>
        <form action="LogoutController" method="POST">
            <input type="submit" value="Logout" >
        </form>
        <div>
            <%
                CategoryDAO dao = new CategoryDAO();
                List<CategoryDTO> categoryList = null;
                categoryList = dao.getAllCategory();
            %>
        </div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Category Images</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (categoryList != null) {
                        for (CategoryDTO category : categoryList) {
                %>
                <tr>
                    <td><%= category.getCategoryID()%></td>
                    <td><%= category.getCategoryName()%></td>
                    <td><%= category.getCategoryImages()%></td>
                    <td><%= category.getStatus()%></td>
                    <td>
                        <a href="updateCategory.jsp">Update</a>
                        <a href="DeleteCategoryController?id=<%= category.getCategoryID()%>">Delete</a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6">No category found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="createCategory.jsp">Create New Category</a>
    </body>
</html>
