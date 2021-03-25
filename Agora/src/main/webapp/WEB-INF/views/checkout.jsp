<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1,
	shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css" type="text/css">
<title>Checkout</title>
</head>
<body>

<div class="container header text-center">

<div class="row">

<div class="column">
<a href="home.do"><img src="/resources/images/home.png" alt="home icon"/></a>
</div>

<div class="column center">
<h1 class="center">AGORA CHECKOUT</h1>
</div>

<div class="column">
<a href="viewCart.do"><img src="/resources/images/carticon.png" alt="cart icon"/></a>
</div>


<!-- <h1>AGORA CHECKOUT</h1>
<a href = "home.do">Home</a> -->

<!--Display all items in checkout  -->
<table class="table">
	<thead class="table">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
	</tr>
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
		<tr>
			<th>Items: </th>
			<th>${count}</th>
			<th>Total</th>
			<th>${totalCost}</th>
		</tr>
	</tfoot>

</table>

<div class="column center">
<h2 class="center">Pay With Credit Card</h2>

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
      <label for="password">Credit Card #:</label>
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
    
</div>
</div>
</div>

</body>
</html>