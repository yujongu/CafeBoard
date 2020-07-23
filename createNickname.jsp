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
	<br>
	<div class="container">
		<form action="checkNickname" method="post">
			<div class="jumbotron">
			 	<h1 class="display-4">Welcome, ${username}! </h1>
			 	<p class="lead">It is best to not expose your username to others, so lets make a unique nickname to go by!</p>
			 	<hr class="my-4">
			 	<p>Nicknames will be displayed whenever you write a post, or leave a comment.</p>
				<input type="text" name="nickname" required/>
				<input type="submit" value="Submit!"/> ${nicknameDuplicate} <br>
				<small class="form-text text-muted">Nicknames cannot be changed once made.</small>
				<c:remove var="nicknameDuplicate" scope="session"/>
			
			</div>
			
		</form>
	
	</div>

	
	

	

</body>
</html>