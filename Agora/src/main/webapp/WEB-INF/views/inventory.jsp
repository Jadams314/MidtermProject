<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory List</title>
</head>
<body>
<h1>Inventory List</h1>
<c:forEach var="i" items="${inventory}">
<p>
	${i.id} ${i.name} ${i.description} 
</p>
</c:forEach>
</body>
</html>