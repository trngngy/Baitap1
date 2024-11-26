<%-- 
    Document   : updateCategory
    Created on : Nov 26, 2024, 10:35:26 AM
    Author     : nguye
--%>

<%@page import="java.util.List"%>
<%@page import="sample.category.CategoryDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.category.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
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
        <%
            CategoryDAO dao = new CategoryDAO();
            List<CategoryDTO> categoryList = null;
            categoryList = dao.getAllCategory();
            
        %>
        <h2>Manage Appointments</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Images</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (categoryList != null) {
                        for (CategoryDTO category : categoryList) {
                %>
            <form action="UpdateCategoryController" method="POST">
                <tr>
                    <td><input type="text" name="id" value="<%= category.getCategoryID()%>" readonly=""</td>
                    <td><input type="text" name="name" value="<%= category.getCategoryName()%>"</td>
                    <td><input type="text" name="images" value="<%= category.getCategoryImages()%>"</td>
                    <td><input type="text" name="status" value="<%= category.getStatus()%>"</td>
                    <td><button type="submit" value="Update">Update</button></td>
                </tr>
            </form>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6">No appointments found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
        <a href="welcome.jsp">Back to Dashboard</a>
    </body>
</html>
