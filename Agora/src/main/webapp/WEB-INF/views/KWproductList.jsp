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

<!--Display all Products-->		
	<table class="table">
		<thead class="table">
			<th>ID</th>
			<th>Image</th>
			<th>Name</th>
			<th>Description</th>
			
		</thead>
		<tbody>
			<c:forEach  var="p" items="${keywordSearch}">
				<tr>
					<td>${p.id}</td>
					<td><a href="displayProduct.do?pid=${p.id}" style="width: 200px; height: 75px; border: 0px solid black;"><div style="width: auto; height: auto;"><img src="${p.productImgUrl}" width="50%" height="100%" style="margin-left: 50px;"></div></td>
					<td><a href="displayProduct.do?pid=${p.id}">${p.name}</a></td>
					<td>${p.description }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<!--Display all Products-->		

	
</body>
</html>