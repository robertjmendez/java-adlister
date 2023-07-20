<%--
  Created by IntelliJ IDEA.
  User: robertmendez
  Date: 7/19/23
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pizza Order</title>
</head>
<body>
<form action="PizzaOrderServlet" method="post">
    <div>
        <label for="crust">Crust Type:</label>
        <select id="crust" name="crust">
            <option value="" selected disabled>Select crust</option>
            <option value="thin">Thin</option>
            <option value="thick">Thick</option>
        </select>
    </div>
    <div>
        <label for="sauce">Sauce Type:</label>
        <select id="sauce" name="sauce">
            <option value="" selected disabled>Select sauce</option>
            <option value="tomato">Tomato</option>
            <option value="pesto">Pesto</option>
        </select>
    </div>
    <div>
        <label for="size">Size Type:</label>
        <select id="size" name="size">
            <option value="" selected disabled>Select size</option>
            <option value="small">Small</option>
            <option value="medium">Medium</option>
            <option value="large">Large</option>
        </select>
    </div>
    <div>
        <label>Toppings:</label>
        <div>
            <label for="mushrooms">
                <input type="checkbox" id="mushrooms" name="toppings" value="mushrooms">
                Mushrooms</label>
            <label for="pepperoni">
                <input type="checkbox" id="pepperoni" name="toppings" value="pepperoni">
                Pepperoni</label>
        </div>
    </div>
    <div>
        <label for="address">Delivery Address:</label>
        <input type="text" id="address" name="address" required>
    </div>
    <input type="submit" value="Order Pizza">
</form>

</body>
</html>
