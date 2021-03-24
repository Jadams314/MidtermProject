<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body>

<h1>Add A Product</h1>

	<form action="registerproduct.do" method="POST">
      <label for="name">Name:</label>
      <input type="text" name="name" required>
      <br>
      <label for="description">Description:</label>
      <input type="text" name="description" required>
      <br>
      <label for="price">Price:</label>
      <input type="text" name="price" required>
      <br>
      <label for="image">Image URL:</label>
      <input type="text" name="image" required>
      <br>
      <input type="submit" value="Add">
    </form>

</body>
</html>