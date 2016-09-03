<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form action="AddTrip.do" method="POST">
	City: <input type="text" name="city" value="${param.city}" /><br />
	State: <input type="text" name="state" value="${param.state}" /><br />
	Start: <input type="date" name="startDate" value="" /><br />
	End: <input type="date" name="endDate" value="" /><br /> <input
		type="submit" value="Add Trip" />
</form>

