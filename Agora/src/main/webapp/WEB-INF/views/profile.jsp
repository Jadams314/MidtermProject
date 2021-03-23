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
<title>Agora Homepage</title>
</head>
<body>

<div class="container header text-center">
<h1>Agora Mercantile</h1>
</div>
<div class="container center">
<nav class="navbar navbar-expand-lg navbar-light bg-light">

<a class="navbar-brand" href="profile.do">Home</a>

<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">

<ul class="navbar-nav mr-auto">

	<li class="nav-item">
        <a class="nav-link" href="#">Link</a>
    </li>

	<li class="nav-item">
        <a class="nav-link" href="#">Link</a>
    </li>

	<li class="nav-item">
        <a class="nav-link" href="#">Link</a>
    </li>

</ul>
<a href="viewcart.do"><img src="/resources/images/carticon.png" alt="cart icon"/></a>
 <!-- <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search Entire Site" aria-label="Search">
      <button type="submit">Submit</button>
 </form> -->
 
</div>
</nav>

<div class="container-fluid bgimage text-center">

<div class="transbox center">

<div>
	<form action="inventory.do" method="GET">
	  <button type="submit" value="submit">Your Inventory</button>
	</form>
</div>
<div>
	<h3>Search Products by ID</h3>
	<form action="findProdById.do" method="GET">
	 <input type="text" name="pid"/> 
	  <button type="submit" value="submit">Search</button>
	</form>
</div>
<div>
	<h3>Search Products by Keyword</h3>
	<form action="findProdByKW.do" method="GET">
	 <input type="text" name="keywordSearch"/> 
	  <button type="submit" value="submit">Search</button>
	</form>
</div>
<div>
	<form action="findAllProd.do" method="GET">
	  <button type="submit" value="submit">Browse All</button>
	</form>
</div>
<div>
	<h3>Shopping Cart</h3><form action="viewCart.do" method="GET">
	  <input type="submit" value="submit" />
	</form>
</div>
</div>
</div>
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