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
	<h1>Products:</h1>
	<div>
		<h5>${product.name}(${product.id})</h5>
		<p>${product.description}</p>
	</div>
	<h5>${displayAll}</h5>

	<table class="table table-striped table-hover">
		<thead class="table-dark">
			<th>ID</th>
			<th>Name</th>
		</thead>
		<tbody>
			<c:forEach var="p" items="${keywordSearch}">
				<tr>
					<td>${p.id}</td>
					<td><a href="findProdByKW.do?pid=${p.id}">${p.name}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>