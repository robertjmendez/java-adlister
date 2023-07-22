<%--
  Created by IntelliJ IDEA.
  User: robertmendez
  Date: 7/19/23
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pick a Color</title>
</head>
<body>
<form action="pickcolor" method="post">
    <label for="color">Enter your favorite color:</label>
    <input type="text" id="color" name="color" required>
    <input type="submit" value="Submit">
</form>
</body>
</html>

