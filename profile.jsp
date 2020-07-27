<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yujongu.DAO.PostDAO, com.yujongu.Post, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<title>Profile Page</title>
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
	
	<%
		PostDAO dao = new PostDAO();
		ArrayList<Post> posts = dao.retrievePosts((String) session.getAttribute("nickname"));
	%>
	<br>
	<div class="container">
	
		<div class="jumbotron jumbotron-fluid">
		  	<div class="container">
		    	<h1 class="display-4">${nickname } - since ${date }</h1>
		    	<p class="lead">Here are all your posts!</p>
		  	</div>
		</div>
		
		<table class="table">
			<thead>
				<tr>
		      		<th scope="col">Author</th>
		      		<th scope="col">Title</th>
		      		<th scope="col">Written Date</th>
		    	</tr>
		  	</thead>
		  	<tbody>
		  		<c:forEach items="<%=posts %>" var="post">
		  			<tr>
						<td><c:out value="${post.writer}"></c:out></td>
					  	<td>
					  	<a href="http://localhost:8080/BoardRoom/detailPost.jsp?author=${post.writer}&title=${post.title}&date=${post.writtenDate}">
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