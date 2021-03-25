<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
</head>
<body>
<h1>THE AGORA CHECKOUT</h1>
<a href = "home.do">Home</a>

<!--Display all items in checkout  -->
<table class="table">
	<thead class="table">
	<th>ID</th>
	<th>Name</th>
	<th>Description</th>
	<th>Price</th>
	</thead>
	<tbody>
		<c:forEach var="p" items="${paidfor}">
			<tr>
				<td>${p.id}</td>
				<td><img src="${p.product.productImgUrl}" alt="A product" width="100" height="100"></td>
				<td>${p.name}</td>
				<td>${p.description}</td>
				<td>${p.price}</td>
			</tr>	
		</c:forEach>
	</tbody>
		
	<tfoot>
		<th>Items: </th>
		<th>${count}</th>
		<th>Total</th>
		<th>${totalCost}</th>
	</tfoot>

</table>

<h2>Pay With Credit Card</h2>
	<form action="payment.do" method="POST">
      <label for="firstName">First Name:</label>
      <input type="text" name="firstName" required>
      <br>
      <label for="lastName">Last Name:</label>
      <input type="text" name="lastName" required>
      <br>
      <label for="zipCode">Zip Code:</label>
      <input type="text" name="zipCode" required>
      <br>
      <label for="password">Credit Card Number:</label>
      <input type="text" name="creditCard" required>
      <br>
      <label for="email">Exp Mo:</label>
      <input type="text" name="month" required>
      <br>
      <label for="street">Exp Yr:</label>
      <input type="text" name="year" required>
	  <input type="hidden" name="total" value="${totalCost}">
	  <input type="hidden" name="paidfor" value="${paidfor}">
	  <input type="hidden" name="count" value="${count}">
      <br>
      <input type="submit" value="CLICK TO PAY">
    </form>
    

</body>
</html>