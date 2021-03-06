<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<title>Main Page</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("expires", "0"); //proxies
		
		if(session.getAttribute("username") == null){
			response.sendRedirect("login.jsp");
		} else if(session.getAttribute("nickname") == null){
			response.sendRedirect("createNickname.jsp");
		}

	
	%>
	<br>
	<div class="container">
		<form action="Logout">
			Welcome, ${nickname}!
			<input type="submit" value="Log Out">
		</form>
		
		<form action="Profile">
			<input type="submit" value="Profile"> <br>
		</form>
	
		<br>
	
	
		<form action="writePost.jsp">
			<input type="submit" value="Write a new post"><br>
		</form>
		
		
		
		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/users?characterEncoding=UTF-8&serverTimezone=UTC" user="root" password="Password1"/>
	
		<sql:query var="posts" dataSource="${db}">select * from posts</sql:query>
		
		<table class="table">
			<thead>
				<tr>
		      		<th scope="col">Author</th>
		      		<th scope="col">Title</th>
		      		<th scope="col">Written Date</th>
		    	</tr>
		  	</thead>
		  	<tbody>
		  		<c:forEach items="${posts.rows}" var="post">
		  			<tr>
						<td><c:out value="${post.author}"></c:out></td>
					  	<td>
					  	<a href="http://localhost:8080/BoardRoom/detailPost.jsp?author=${post.author}&title=${post.title}&date=${post.writtenDate}">
					  		<c:out value="${post.title}"></c:out>
					  	</a></td>
					  	<td><c:out value="${post.writtenDate}"></c:out></td>
					  	
		    		</tr>
		  		</c:forEach>
		  	</tbody>
		</table>
	</div>
	
	
</body>
</html>