<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form class="pure-form" action="EditTrip.do" method="POST">
	<c:forEach var="trip" items="${sessionScope.triplist}">
		<c:choose>
			<c:when test="${param.tripID == trip.value.index}">
				<li><input type="text" name="city" value="${trip.value.city}"></li>
				<li><input type="text" name="state" value="${trip.value.state}"></li>
				<li><input type="date" name="startDate"
					value="${trip.value.startDate}"></li>
				<li><input type="date" name="endDate"
					value="${trip.value.endDate}"></li>
				<li><input type="hidden" name="index"
					value="${trip.value.index}"></li>
				<li><input type="submit" value="submit"></li>
				<li><input type="submit" name="delete" value="Delete"></li>
				<iframe width="450" height="250" frameborder="0" style="border: 0"
					src="https://www.google.com/maps/embed/v1/search?key=AIzaSyBSZ6I-8PramlLicQV2zY1ykm8EpcQJ_ko&q=${trip.value.city}+${trip.value.state}"
					allowfullscreen> </iframe>
			</c:when>
		</c:choose>
	</c:forEach>
</form>

