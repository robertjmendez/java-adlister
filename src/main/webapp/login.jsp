<%--
  Created by IntelliJ IDEA.
  User: robertmendez
  Date: 7/19/23
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<%--    When a user visits /login.jsp, they should see a form for logging in


This form should have a 'username' and 'password' field.

This form should submit a POST request to /login.jsp

Inside of login.jsp write some code to check the submmitted values. If the username submitted is "admin",
and the password is "password", redirect the user to the profile page; otherwise, redirect back to the login form.--%>
<form action="login.jsp" method="post">
    <div>
        <label>Username:</label>
        <input type="text" name="username" required>
    </div>
    <div>
        <label>Password:</label>
        <input type="password" name="password" required>
    </div>
    <input type="submit" value="Login">
</form>


<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        if ("admin".equals(username) && "password".equals(password)) {
            response.sendRedirect("profile.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
%>


</body>
</html>
