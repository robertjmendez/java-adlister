<%--
  Created by IntelliJ IDEA.
  User: robertmendez
  Date: 7/20/23
  Time: 7:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Guess The Number</title>
</head>
<body>
<form action="GuessServlet" method="post">
    <label for="guess">Guess a number between 1 and 3:</label>
    <input type="number" id="guess" name="guess" min="1" max="3" required>
    <input type="submit" value="Submit">
</form>
</body>
</html>
