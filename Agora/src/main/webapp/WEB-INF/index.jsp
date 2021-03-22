<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agora</title>
</head>
<body>

<h1>Welcome to Agora</h1>
${TEST}

<div>
	<h3>Login</h3>
	<form action="login.do" method="POST">
	  Username <input type="text" name="username" />
	  Password <input type="text" name="password" />
	  <input type="submit" value="Login" />
	</form>
</div>
<div>
	<h3>Register</h3>
	<form action="register.do" method="GET">
	  <input type="submit" value="Register an Account" />
	</form>
</div>

</body>
</html>