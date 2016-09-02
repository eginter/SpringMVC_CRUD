<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Trip</title>
</head>
<nav>
	<ul>
		<li><a href="add.jsp">Add</a></li>
		<li><a href="edit.jsp">Edit</a></li>
		<li><a href="results.jsp">List</a></li>
	</ul>
</nav>
<body>
<form action="AddTrip.do" method="POST">
		City:
		<input type="text" name="city" value="Macon"/><br/>
		State:
		<input type="text" name="state" value="GA"/><br/>
		Start: 
		<input type="date" name="startDate" value="20161212"/><br/>
		End:
		<input type="date" name="endDate" value="20161225"/><br/>
		
		<input type="submit" value="Add State" />
	</form>

</body>
</html>