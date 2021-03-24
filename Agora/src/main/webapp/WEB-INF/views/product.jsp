<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
</head>
<body>

<h1>Product details:</h1>
<div>
  <h5>${product.name} (${product.creationDate})</h5>
  <p> <img alt="" src="${product.productImgUrl}">  </p>
  <p> ${product.description}</p>
  	<form action="addProductInventory.do" method="POST">
			<input type="hidden" name="id" value="${product.id}">
			<button class="btn" type="submit">Is this available?</button>
		</form>
</div>

</body>
</html>