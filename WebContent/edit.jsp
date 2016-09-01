<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<form action="editview.jsp" method="GET">
		<ul>
			<c:forEach var="trip" items="${sessionScope.triplist}">
					<li><input type="submit" name="tripID" value="${trip.key}">${trip.value.city}</li>
			</c:forEach>
		</ul>
	</form>
</div>

</body>
</html>