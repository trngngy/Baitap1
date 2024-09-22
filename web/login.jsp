<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #e9ecef;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            form {
                background-color: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 350px;
                text-align: center;
            }
            h2 {
                margin-bottom: 20px;
                color: #333;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 16px;
                box-sizing: border-box;
                transition: border-color 0.3s;
            }
            input[type="text"]:focus, input[type="password"]:focus {
                border-color: #4CAF50;
                outline: none;
            }
            input[type="submit"], input[type="button"] {
                width: 100%;
                padding: 12px 15px;
                margin: 10px 0;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
            }
            input[type="reset"] {
                background-color: #f44336;
                color: white;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            input[type="reset"]:hover {
                background-color: #d7322f;
            }
            h3 {
                color: red;
            }
            .success-message {
                color: green;
            }
            label {
                text-align: left;
                width: 100%;
                display: block;
                margin-top: 10px;
                font-size: 14px;
                color: #333;
            }
        </style>
    </head>
    <body>
        <form action="LoginController" method="post">
            <h2>Đăng Nhập</h2>
            <label for="username">Tên đăng nhập</label>
            <input type="text" id="username" name="username" required/><br/>
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" required/><br/>
            <input type="submit" value="Login"/>
            <input type="button" value="Register" onclick="window.location.href='register.jsp'"/>
            <input type="button" value="Forgot Password" onclick="window.location.href='forgot-password.jsp'"/>

            <%
                String error = (String) request.getAttribute("ERROR");
                if (error != null && !error.isEmpty()) {
            %>
                <h3><%= error %></h3>
            <%
                }
            %>

            <%
                String successMessage = (String) request.getAttribute("SUCCESS");
                if (successMessage != null && !successMessage.isEmpty()) {
            %>
                <p class="success-message"><%= successMessage %></p>
            <%
                }
            %>
        </form>
    </body>
</html>
