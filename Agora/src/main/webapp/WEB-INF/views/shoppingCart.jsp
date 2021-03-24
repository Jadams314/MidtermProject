<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
</head>
<body>

<h1>Shopping Cart</h1>
<a href = "home.do">Home</a>

 	<c:forEach var="p" items="${cart.purchases}">
		<p>${p.inventory.id}: ${p.inventory.name}<br>${p.inventory.description}
		<form action="removeFromCart.do" method="GET">
			<input type="hidden" name="id" value="${p.id}">
			<button class="btn" type="submit">Remove from Cart</button>
		</form>
		</p>
	</c:forEach>

		<form action="checkout.do" method="GET">
			<input type="hidden" name="id" value="${p.id}">
			<button class="btn" type="submit">checkout</button>
		</form>

</body>
</html>