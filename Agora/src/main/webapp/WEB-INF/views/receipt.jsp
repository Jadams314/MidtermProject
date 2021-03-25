<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receipt</title>
</head>
<body>
<a href = "home.do">Home</a>

<c:choose>
	
	<c:when test="${empty cart}">
		<h3>The info you entered was incorrect, please return to cart and try again.</h3>
		<br>
		<h2>Back to Shopping cart</h2>
		<form action="viewCart.do" method="GET">
      		<input type="submit" value="SHOPPING CART">
    	</form>
    
	</c:when>
	
	<c:otherwise>
<h1>HERE IS YOUR RECEIPT:</h1>
<h3>You paid $ ${total} and purchased ${count} items.</h3>
<h5>Thank you for shopping we hope you choose Agora for all your future purchases.</h5>

<table class="table">
	<thead class="table">
	<th>ID</th>
	<th>Name</th>
	<th>Price</th>
	</thead>
	<tbody>
		<c:forEach var="p" items="${cart}">
			<tr>
				<td><img src="${p.product.productImgUrl}" alt="A product" width="100" height="100"></td>
				<td>${p.name}</td>
				<td>${p.price}</td>
			</tr>	
		</c:forEach>
	</tbody>
		
	<tfoot>
		<th>Items: </th>
		<th>${count}</th>
		<th>Total</th>
		<th>${total}</th>
	</tfoot>

</table>

		</c:otherwise>
		
</c:choose>
</body>
</html>