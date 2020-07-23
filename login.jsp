<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	
	<p> Login </p>
	
	<form action="Login" method="get">
		Enter username: <input type="text" name="uname"> <br>
		Enter password: <input type="password" name="pword"> <br>
		<input type="submit" value="Login"> ${message} <br>
		<c:remove var="message" scope="session"/>
	</form>
	
	<br>
	
	<p> Sign Up </p>
	
	<form action="SignUp" method="post">
		Enter new username: <input type="text" name="uname" maxlength="20" required> 
		${usernameDuplicate}
		<c:remove var="usernameDuplicate" scope="session"/>
		<br>
		Enter new password: <input type="password" name="pword1" maxlength="20" required> <br>
		Retype your new password: <input type="password" name="pword2" maxlength="20">
		${pwordMessage} <br>
		<c:remove var="pwordMessage" scope="session"/>
		
		<input type="submit" value="SignUp"> ${SignupSuccess} <br>
		<c:remove var="SignupSuccess" scope="session"/>
		
		
	</form>
	
</body>
</html>