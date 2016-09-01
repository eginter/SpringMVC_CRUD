<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trip List</title>
</head>
<nav>
	<ul>
		<li><a href="add.jsp">Add</a></li>
		<li><a href="edit.jsp">Edit</a></li>
		<li><a href="results.jsp">List</a></li>
	</ul>
</nav>

<body>

<div>
	<ul>
		<c:forEach var="trip" items="${sessionScope.triplist}">
					<li>${trip.city}</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>