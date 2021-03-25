<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1,
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
<a href="home.do"><img src="resources/images/home.png" alt="home icon"/></a>
</div>

<div class="column center">
<h1 class="center">AGORA CHECKOUT</h1>
</div>

<div class="column">
<a href="viewCart.do"><img src="resources/images/carticon.png" alt="cart icon"/></a>
</div>

<div class="container center">
<nav class="navbar navbar-expand-md navbar-dark bg-dark">


<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">

<ul class="navbar-nav mr-auto">

	<li class="nav-item">
        <a class="nav-link" href="inventory.do">All Inventory</a>
    </li>

	<li class="nav-item">
        <a class="nav-link" href="findAllProd.do">Product Catalog</a>
    </li>
    <!--  
    <form action="addProduct.do" method="GET">
	  <button type="submit" value="submit">Sell Something</button>
	</form>
	-->
	<li class="nav-item">
        <a class="nav-link" href="addProduct.do">Sell</a>
    </li>

	<li class="nav-item">
        <a class="nav-link lmarg" href="logout.do">Logout</a>
    </li>

</ul>

	<form action="findProdByKW.do" method="GET">
		<input type="text" placeholder="Search Products" name="keywordSearch"/> 
		<button type="submit" value="submit">Search</button>
	</form>
	
</div>
</nav>


<div class="container-fluid bgimage text-center">
<!-- <div class="transbox center margt15"> -->


<div class="transbox center margt15">
<div class="scrolley container-fluid">
<h3>Checking out</h3>
<!--Display all items in checkout  -->
<table class="table">
	<thead class="table">
		<tr>
			<th>ID</th>
			<th>Product</th>
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
</div>
</div>
<div class="transbox center margt18">
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
      <label for="expMo">Exp Mo:</label>
      <input type="text" name="month" required>
      <br>
      <label for="expYr">Exp Yr (yyyy):</label>
      <input type="text" name="year" required>
	  <input type="hidden" name="total" value="${totalCost}">
	  <input type="hidden" name="paidfor" value="${paidfor}">
	  <input type="hidden" name="count" value="${count}">
      <br>
      <input type="submit" value="CLICK TO PAY">
      <br>

    </form>
<br>
</div>
</div>
<br>
<!-- </div> -->
</div>    
</div>
</div>
</div>
<!-- </div> -->
<div class="container footer text-center">
<h6>&#169 2021 Ghoul Squad Gulag, All Rights Reserved.</h6>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

</body>
</html>