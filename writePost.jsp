<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("expires", "0"); //proxies
		
		if(session.getAttribute("username") == null){
			response.sendRedirect("login.jsp");
		}
	
	%>

<br>

<div class="container">
  	<form action="WritePost" method="post">
		<div class="form-group">
			Title
			<input class="form-control" type="text" placeholder="Title" name="title">
		</div>
		
		<div class="form-group">
		   	Content
			<textarea class="form-control" rows="5" name="content"></textarea>
		</div>
		<input type="submit" value="Upload Post">
	</form>
</div>


	
</body>
</html>