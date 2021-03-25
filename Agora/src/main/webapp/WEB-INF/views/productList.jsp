<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product By ID</title>
</head>
<body>
	<!-- Products By ID-->
	<h1>Products:</h1>
	<div>
		<h5>${product.name}${product.id}</h5>
		<p>${product.description}</p>
	</div>

	<!--Products By ID-->

	
<!--Display all Products-->		
	<table class="table">
		<thead class="table">
			<th>ID</th>
			<th>Image</th>
			<th>Name</th>
			<th>Description</th>
			
		</thead>
		<tbody>
			<c:forEach  var="p" items="${displayAll}">
				<tr>
					<td>${p.id}</td>
					<td><a href="displayProduct.do?pid=${p.id}" style="width: 200px !important; height: 75px !important; border: 0px solid black;"><div style="width: auto; height: auto;"><img src=${p.productImgUrl} width="50%" height="100%" style="margin-left: 50px;"></div></td>
					<td><a href="displayProduct.do?pid=${p.id}">${p.name}</a></td>
					<td>${p.description }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<!--Display all Products-->		

<!--Products By keyword-->		
	<table class="table">
		<thead class="table">
			<th>ID</th>
			<th>Name</th>
			<th>Description</th>
		</thead>
		<tbody>
			<c:forEach var="p" items="${keywordSearch}">
				<tr>
					<td>${p.id}</td>
					<td><a href="displayProduct.do?pid=${p.id}">${p.name}</a></td>
					<td>${p.description }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<!--Products By keyword-->		
</body>
</html>