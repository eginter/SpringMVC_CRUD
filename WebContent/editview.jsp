<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form class="pure-form-stacked" action="EditTrip.do" method="POST">
	<c:forEach var="trip" items="${sessionScope.triplist}">
		<c:choose>
			<c:when test="${param.tripID == trip.value.index}">
				<input type="text" name="city" value="${trip.value.city}">
				<input type="text" name="state" value="${trip.value.state}">
				<input type="date" name="startDate"
					value="${trip.value.startDate}">
				<input type="date" name="endDate"
					value="${trip.value.endDate}">
				<input type="hidden" name="index"
					value="${trip.value.index}"></li>
				<input type="submit" value="submit"></li>
				<input type="submit" name="delete" value="Delete">
			</c:when>
		</c:choose>
	</c:forEach>
</form>

