<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<c:set var="author" value="${param.author}"></c:set>
	<c:set var="title" value="${param.title}"></c:set>
	<c:set var="writtenDate" value="${param.date}"></c:set>
	
	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/users?characterEncoding=UTF-8&serverTimezone=UTC" user="root" password="Password1"/>

	<sql:query var="rs" dataSource="${db}">
		select * from posts where author=? and title=?
		<sql:param value="${author }"></sql:param>
		<sql:param value="${title }"></sql:param>
	</sql:query>
	
	<c:forEach items="${rs.rows}" var="res">
		<c:set var="content" value="${res.content}"></c:set>
	</c:forEach>
	Written on 	: ${writtenDate } <br>
	Author		: ${author } <br>
	Title 		: ${title } <br>
	Content 	: ${content } <br>

</body>
</html>