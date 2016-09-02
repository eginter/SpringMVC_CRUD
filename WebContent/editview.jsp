<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit View</title>
</head>
<nav>
	<ul>
		<li><a href="add.jsp">Add</a></li>
		<li><a href="edit.jsp">Edit</a></li>
		<li><a href="results.jsp">List</a></li>
	</ul>
</nav>
<div>
<c:out value="${sessionScope.triplist[2]}"/>
	<ul>
	<form action="EditTrip.do" method="POST">
		<c:forEach var="trip" items="${sessionScope.triplist}">
			<c:choose>
    				<c:when test="${param.tripID == trip.value.index}">
        				<li><input type="text" name="city" value="${trip.value.city}"></li>
        				<li><input type="text" name="state" value="${trip.value.state}"></li>
        				<li><input type="date" name="startDate" value="${trip.value.startDate}"></li>
        				<li><input type="date" name="endDate" value="${trip.value.endDate}"></li>
        				<li><input type="hidden" name="index" value="${trip.value.index}"></li>
        				<li><input type="submit" value="submit"></li>
					<li>	<input type="submit" name="delete" value="Delete"></li>		
    				</c:when>
			</c:choose>
		</c:forEach>
	</form>
	</ul>
</div>
<body>

</body>
</html>