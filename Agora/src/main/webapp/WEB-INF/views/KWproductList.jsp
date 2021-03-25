<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,
	shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css" type="text/css">
<title>Product By ID</title>
</head>
<body>

	<div class="container header text-center">

		<div class="row">

			<div class="column">
				<a href="home.do"><img src="/resources/images/home.png"
					alt="home icon" /></a>
			</div>

			<div class="column center">
				<h1 class="center">Agora</h1>
			</div>

			<div class="column">
				<a href="viewCart.do"><img src="/resources/images/carticon.png"
					alt="cart icon" /></a>
			</div>

		</div>
	</div>

	<div class="container center">
		<nav class="navbar navbar-expand-md navbar-dark bg-dark">

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav mr-auto">

					<li class="nav-item"><a class="nav-link" href="inventory.do">All
							Inventory</a></li>

					<li class="nav-item"><a class="nav-link" href="findAllProd.do">Product
							Catalog</a></li>
					<!--  
    <form action="addProduct.do" method="GET">
	  <button type="submit" value="submit">Sell Something</button>
	</form>
	-->
					<li class="nav-item"><a class="nav-link" href="addProduct.do">Sell</a>
					</li>

					<li class="nav-item"><a class="nav-link lmarg"
						href="logout.do">Logout</a></li>

				</ul>


				<form action="findProdByKW.do" method="GET">
					<input type="text" placeholder="Search Products"
						name="keywordSearch" />
					<button type="submit" value="submit">Search</button>
				</form>
			</div>
		</nav>

		<div class="container-fluid bgimage text-center">

			<div class="transbox center">
				<div class="scrolley container-fluid">

					<h2>Search Results:</h2>
					<table class="table">
						<thead class="table">
							<th>ID</th>
							<th>Image</th>
							<th>Name</th>
							<th>Description</th>

						</thead>
						<tbody>
							<c:forEach var="p" items="${keywordSearch}">
								<tr>
									<td>${p.id}</td>
									<td><a href="displayProduct.do?pid=${p.id}"
										style="width: 200px; height: 75px; border: 0px solid black;"><div
												style="width: auto; height: auto;">
												<img src="${p.productImgUrl}" width="50%" height="100%"
													style="margin-left: 50px;">
											</div></td>
									<td><a href="displayProduct.do?pid=${p.id}">${p.name}</a></td>
									<td>${p.description }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


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