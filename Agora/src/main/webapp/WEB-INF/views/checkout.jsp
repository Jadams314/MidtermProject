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
				<td>${p.name}</td>
				<td>${p.description}</td>
				<td>${p.price}</td>
			</tr>	
		</c:forEach>
	</tbody>
		
	<tfoot>
		<th>Number of Items: </th>
		<th>${count}</th>
		<th>Total</th>
		<th>${totalCost}</th>
	</tfoot>

</table>

</body>
</html>