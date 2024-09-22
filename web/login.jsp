<%-- 
    Document   : login
    Created on : May 10, 2024, 2:10:46 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(to right, #e9ecef, #f8f9fa);
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
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                width: 350px;
                text-align: center;
            }
            h2 {
                margin-bottom: 20px;
                color: #333;
                font-size: 24px;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 16px;
                box-sizing: border-box;
                transition: border-color 0.3s, box-shadow 0.3s;
            }
            input[type="text"]:focus, input[type="password"]:focus {
                border-color: #4CAF50;
                box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
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
                transition: background-color 0.3s, transform 0.2s;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
            }
            input[type="button"] {
                background-color: #007bff;
                color: white;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
                transform: translateY(-1px);
            }
            input[type="button"]:hover {
                background-color: #0056b3;
                transform: translateY(-1px);
            }
            h3 {
                color: red;
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
            <h2>Login</h2>
            <label for="username">Username</label>
            <input type="text" name="username" id="username" required/><br/>
            <label for="password">Password</label>
            <input type="password" name="password" id="password" required/><br/>
            <input type="submit" value="Login"/>
            <input type="button" value="Register" onclick="window.location.href = 'register.jsp'"/>
        </form>
    </body>
</html>
