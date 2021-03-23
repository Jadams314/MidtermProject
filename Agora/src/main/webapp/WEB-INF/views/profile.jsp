<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>WELCOME TO THE PROFILE</h1>

<div>
	<h3>See Inventory</h3>
	<form action="inventory.do" method="GET">
	  <input type="submit" value="View Inventory" />
	</form>
</div>
<div>
	<h3>Search Products by ID</h3>
	<form action="findProdById.do" method="GET">
	 <input type="text" name="pid"/> 
	  <input type="submit" value="submit" />
	</form>
</div>
<div>
	<h3>Search Products by Keyword</h3>
	<form action="findProdByKW.do" method="GET">
	 <input type="text" name="keywordSearch"/> 
	  <input type="submit" value="submit" />
	</form>
</div>
<div>
	<h3>Display all</h3><form action="findAllProd.do" method="GET">
	  <input type="submit" value="submit" />
	</form>
</div>
<div>
	<h3>Shopping Cart</h3><form action="viewCart.do" method="GET">
	  <input type="submit" value="submit" />
	</form>
</div>

</body>
</html>