<%--
  Created by IntelliJ IDEA.
  User: robertmendez
  Date: 7/21/23
  Time: 8:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ads</title>
</head>
<body>
<h1>Ads</h1>
<c:forEach var="ad" items="${ads}">
    <div>
        <h2>${ad.title}</h2>
        <p>${ad.description}</p>
    </div>
</c:forEach>
</body>
</html>
