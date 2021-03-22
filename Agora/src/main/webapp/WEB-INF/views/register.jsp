<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
<h1>Register an account</h1>
	<form action="registerAccount.do" method="POST">
      <label for="firstName">First Name:</label>
      <input type="text" name="firstName" required>
      <br>
      <label for="lastName">Last Name:</label>
      <input type="text" name="lastName" required>
      <br>
      <label for="username">Username:</label>
      <input type="text" name="username" required>
      <br>
      <label for="password">Password:</label>
      <input type="text" name="password" required>
      <br>
      <label for="email">Email:</label>
      <input type="text" name="email" required>
      <br>
      <label for="street">Street:</label>
      <input type="text" name="street" required>
      <br>
      <label for="city">City:</label>
      <input type="text" name="city" required>
      <br>
      <label for="state">State:</label>
      <input type="text" name="state" required>
      <br>
      <label for="zipCode">Zip Code:</label>
      <input type="text" name="zipCode" required>
      <br>
      <input type="submit" value="Register">
    </form>
</body>
</html>