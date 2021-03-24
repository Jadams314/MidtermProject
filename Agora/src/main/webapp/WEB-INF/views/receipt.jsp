<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receipt</title>
</head>
<body>
<a href = "home.do">Home</a>
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
		<c:forEach var="p" items="${paidfor}">
			<tr>
				<td>${p}</td>
				<td></td>
				<td></td>
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
</body>
</html>