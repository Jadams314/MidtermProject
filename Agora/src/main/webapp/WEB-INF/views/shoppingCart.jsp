<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
</head>
<body>

<h1>Shopping Cart</h1>
<a href = "home.do">Home</a>

 	<c:forEach var="i" items="${cart}">
		<p>${i.id}: ${i.name}<br>${i.description}
		<form action="removeFromCart.do" method="GET">
			<input type="hidden" name="id" value="${i.id}">
			<button class="btn" type="submit">Remove from Cart</button>
		</form>
		</p>
	</c:forEach>

</body>
</html>